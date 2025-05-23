part of re_editor;

class _CodeHighlighter extends ValueNotifier<List<_HighlightResult>> {

  final _CodeParagraphProvider _provider;
  final _CodeHighlightEngine _engine;

  CodeLineEditingController _controller;
  CodeHighlightTheme? _theme;
  bool _ready = false;

  bool get ready => _ready;

  _CodeHighlighter({
    required CodeLineEditingController controller,
    CodeHighlightTheme? theme,
  }) : _provider = _CodeParagraphProvider(),
    _controller = controller,
    _theme = theme,
    _engine = _CodeHighlightEngine(theme),
    super(const []) {
    _controller.addListener(_onCodesChanged);
    _processHighlight();
  }

  set controller(CodeLineEditingController value) {
    if (_controller == value) {
      return;
    }
    _controller.removeListener(_onCodesChanged);
    _controller = value;
    _controller.addListener(_onCodesChanged);
    _processHighlight();
  }

  set theme(CodeHighlightTheme? value) {
    if (_theme == value) {
      return;
    }
    _theme = value;
    _engine.theme = value;
    _processHighlight();
  }

  IParagraph build({
    required int index,
    required TextStyle style,
    required double maxWidth,
  }) {
    _provider.updateBaseStyle(style);
    return _provider.build(_controller.buildTextSpan(index, style) ?? _buildSpan(index, style), maxWidth);
  }

  @override
  void dispose() {
    _controller.removeListener(_onCodesChanged);
    _engine.dispose();
    super.dispose();
  }

  TextSpan _buildSpan(int index, TextStyle style) {
    final String text = _controller.codeLines[index].text;
    if (index >= value.length) {
      return TextSpan(
        text: text,
        style: style
      );
    }
    final _HighlightResult result = value[index];
    if (result.nodes.isEmpty) {
      return TextSpan(
        text: text,
        style: style
      );
    }
    if (result.source == text) {
      return _buildSpanFromNodes(result.nodes, style);
    }
    // Diff the changes and reuse node to avoid style blink.
    final List<_HighlightNode> startNodes = [];
    int start = 0;
    int end = text.length;
    for (int i = 0; i < result.nodes.length && start < end; i++) {
      final String value = result.nodes[i].value;
      if (text.startsWith(value, start)) {
        startNodes.add(result.nodes[i]);
        start += value.length;
      } else {
        break;
      }
    }
    final List<_HighlightNode> endNodes = [];
    for (int i = result.nodes.length - 1; i >= 0 && start < end; i--) {
      final String value = result.nodes[i].value;
      if (text.substring(start, end).endsWith(value)) {
        endNodes.insert(0, result.nodes[i]);
        end -= value.length;
      } else {
        break;
      }
    }
    final _HighlightNode? midNode;
    if (startNodes.isEmpty) {
      midNode = _HighlightNode(text.substring(start, end), result.nodes[0].className);
    } else if (startNodes.length < result.nodes.length) {
      midNode = _HighlightNode(text.substring(start, end), result.nodes[startNodes.length].className);
    } else if (end > start){
      midNode = _HighlightNode(text.substring(start, end), result.nodes.last.className);
    } else {
      midNode = null;
    }
    return _buildSpanFromNodes([
      ...startNodes,
      if (midNode != null)
        midNode,
      ...endNodes
    ], style);
  }

  TextSpan _buildSpanFromNodes(List<_HighlightNode> nodes, TextStyle? baseStyle) {
    return TextSpan(
      children: nodes.map((e) => TextSpan(
          text: e.value,
          style: _findStyle(e.className)
        )).toList(),
      style: baseStyle
    );
  }

  TextStyle? _findStyle(String? className) {
    if (className == null) {
      return null;
    }
    while(true) {
      final TextStyle? style = _theme?.theme[className];
      if (style != null) {
        return style;
      }
      final int pieceIndex = className!.indexOf('-');
      if (pieceIndex < 0) {
        break;
      }
      className = className.substring(pieceIndex + 1);
      if (className.isEmpty) {
        break;
      }
    }
    return null;
  }

  void _onCodesChanged() {
    if (_controller.preValue?.codeLines == _controller.codeLines) {
      return;
    }
    _processHighlight();
  }

  void _processHighlight() {
    _engine.run(_controller.codeLines, (result) {
      value = result;
      if( value.isNotEmpty && value.first.nodes.isNotEmpty ) {
        _ready = true;
      }
    });
  }

  String _formatTime(int milliseconds) {
    int seconds = (milliseconds / 1000).truncate();
    int minutes = (seconds / 60).truncate();
    int hours = (minutes / 60).truncate();

    String hoursStr = (hours % 60).toString().padLeft(2, '0');
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    return '$hoursStr:$minutesStr:$secondsStr';
  }
}

class _CodeHighlightEngine {

  //late final _IsolateTasker<_HighlightPayload, List<_HighlightResult>> _tasker;

  Highlight? _highlight;
  CodeHighlightTheme? _theme;
  String _language = 'javascript';

  _CodeHighlightEngine(final CodeHighlightTheme? theme) {
    this.theme = theme;
    //_tasker = _IsolateTasker<_HighlightPayload, List<_HighlightResult>>('CodeHighlightEngine', _run);
  }

  set theme(CodeHighlightTheme? value) {
    if (_theme == value) {
      return;
    }
    _theme = value;
    final Map<String, CodeHighlightThemeMode>? modes = _theme?.languages;
    if (modes == null) {
      _highlight = null;
    } else {
      final Highlight highlight = Highlight();
      highlight.registerLanguages(modes.map((key, value) => MapEntry(key, value.mode)));
      _highlight = highlight;

      if( modes.values.first.mode == langJavascript ) {
        hi.highlight.registerLanguage(_language, js.javascript);
      } else if( modes.values.first.mode == langJson ) {
        _language = 'json';
        hi.highlight.registerLanguage(_language, json.json);
      }
    }
  }

  void dispose() {
    //_tasker.close();
  }

  void run(CodeLines codes, IsolateCallback<List<_HighlightResult>> callback) {
    final Highlight? highlight = _highlight;

    if (highlight == null) {
      callback(const []);
      return;
    }
    final Map<String, CodeHighlightThemeMode>? modes = _theme?.languages;
    if (modes == null) {
      callback(const []);
      return;
    }

    final result = _run(_HighlightPayload(
      highlight: highlight,
      codes: codes,
      languages: modes.keys.toList(),
      maxSizes: modes.values.map((e) => e.maxSize).toList(),
      maxLineLengths: modes.values.map((e) => e.maxLineLength).toList(),
      lang: _language,
    ));
    callback(result);

    // _tasker.run(_HighlightPayload(
    //   highlight: highlight,
    //   codes: codes,
    //   languages: modes.keys.toList(),
    //   maxSizes: modes.values.map((e) => e.maxSize).toList(),
    //   maxLineLengths: modes.values.map((e) => e.maxLineLength).toList(),
    // ), callback);
  }

  static List<_HighlightResult> _run(_HighlightPayload payload) {
    final CodeLines codeLines = payload.codes;
    final int maxSize = payload.maxSizes.reduce(min);
    final int maxLineLength = payload.maxLineLengths.reduce(min);
    // Evalaute performance
    bool canHighlight = true;
    int total = 0;
    for (int i = 0; i < codeLines.length; i++) {
      final int length = codeLines[i].length;
      if (length > maxLineLength || total > maxSize) {
        canHighlight = false;
        break;
      }
      total += length;
    }
    //canHighlight = false;
    final String code = payload.codes.asString(TextLineBreak.lf, false);
    final HighlightResult result;
    if (!canHighlight) {
      result = payload.highlight.justTextHighlightResult(code);
    } else if (payload.languages.length == 1) {
      final re = hi.highlight.parse(code, language: payload.lang);;
      result = convertReEditor(code, re, payload.highlight.emitter);
      //result = payload.highlight.highlight(code: code, language: payload.languages.first);
    } else {
      result = payload.highlight.highlightAuto(code, payload.languages);
    }
    final _HighlightLineRenderer renderer = _HighlightLineRenderer();
    result.render(renderer);

    return renderer.lineResults;
  }

  static HighlightResult convertReEditor(String code, hi.Result re, Emitter emitter) {
    //final Emitter emitter = _TokenTreeEmitter();

    // void addChildren(List<hi.Node> children) {
    //   children.forEach((child) {
    //     if( null != child.className ) {
    //       emitter.startScope(child.className!);
    //       emitter.addText(child.value?? '');
    //       if( null!=child.children ) {
    //         addChildren(child.children!);
    //       }
    //       emitter.endScope();
    //     } else {
    //       emitter.addText(child.value ?? '');
    //       if( null!=child.children ) {
    //         addChildren(child.children!);
    //       }
    //     }
    //   });
    // }
    Mode convertMode(hi.Mode m) {
      final relevance = m.relevance?.toDouble();
      return Mode()
        ..aliases = m.aliases
        ..keywords = m.keywords
        ..illegal = m.illegal
        ..caseInsensitive = m.case_insensitive
        ..contains = m.contains
        ..variants = m.variants
        ..begin = m.begin
        ..beginKeywords = m.beginKeywords
        ..end = m.end
        ..lexemes = m.lexemes
        ..endSameAsBegin = m.endSameAsBegin
        ..endsParent = m.endsParent
        ..endsWithParent = m.endsWithParent
        ..relevance = relevance
        ..subLanguage = m.subLanguage
        ..excludeBegin = m.excludeBegin
        ..excludeEnd = m.excludeEnd
        ..skip = m.skip
        ..returnBegin = m.returnBegin
        ..returnEnd = m.returnEnd
        ..isCompiled = m.compiled
        ..lexemes = m.lexemesRe?.pattern
        ..beginRe = m.beginRe
        ..endRe = m.endRe
        ..illegalRe = m.illegalRe
        ..terminatorEnd = m.terminator_end;
    }

    void emitKeyword(String keyword, String scope) {
      if (keyword.isEmpty) {
        return;
      }
      emitter.startScope(scope);
      emitter.addText(keyword);
      emitter.endScope();
    }

    re.nodes?.forEach((node) {
      if( null != node.className ) {
        emitKeyword(node.children?.first.value?? '', node.className!);
        if( null!=node.children && node.children!.isNotEmpty ) {
          node.children!.forEach((child) {
            if( null != child.className ) {
              emitKeyword(child.children?.first.value?? '', child.className!);
            }
          });
        }
        // emitter.startScope(node.className!);
        // emitter.addText(node.children?.first.value?? '');
        // emitter.endScope();
      } else {
        emitter.addText(node.value?? '');
      }
    });
    emitter.finalize();

    return HighlightResult(
        code: code,
        language: 'javascript',
        relevance: re.relevance?.toDouble()?? 0,
        illegal: false,
        emitter: emitter,
        top: re.top==null ? null : convertMode(re.top!)
    );
  }

}

class _HighlightPayload {

  final Highlight highlight;
  final CodeLines codes;
  final List<String> languages;
  final List<int> maxSizes;
  final List<int> maxLineLengths;
  final String lang;

  const _HighlightPayload({
    required this.highlight,
    required this.codes,
    required this.languages,
    required this.maxSizes,
    required this.maxLineLengths,
    required this.lang,
  });

}

class _HighlightResult {
  final List<_HighlightNode> nodes;

  _HighlightResult(this.nodes);

  String get source => nodes.map((e) => e.value).join();
}

class _HighlightNode {

  final String? className;
  final String value;

  const _HighlightNode(this.value, [this.className]);
}

class _HighlightLineRenderer implements HighlightRenderer {

  final List<_HighlightResult> lineResults;
  final List<String?> classNames;
  _HighlightLineRenderer(): lineResults = [
    _HighlightResult([])
  ], classNames = [];

  @override
  void addText(String text) {
    final String? className = classNames.isEmpty ? null : classNames.last;
    final List<String> lines = text.split(TextLineBreak.lf.value);
    lineResults.last.nodes.add(_HighlightNode(lines.first, className));
    if (lines.length > 1) {
      for (int i = 1; i < lines.length; i++) {
        lineResults.add(_HighlightResult([_HighlightNode(lines[i], className)]));
      }
    }
  }

  @override
  void openNode(DataNode node) {
    final String? className = classNames.isEmpty ? null : classNames.last;
    String? newClassName;
    if (className == null || node.scope == null) {
      newClassName = node.scope;
    } else {
      newClassName = '$className-${node.scope!}';
    }
    newClassName = newClassName?.split('.')[0];
    classNames.add(newClassName);
  }


  @override
  void closeNode(DataNode node) {
    if (classNames.isNotEmpty) {
      classNames.removeLast();
    }
  }

}

