part of re_editor;

const CodeLines _kInitialCodeLines = CodeLines([
  CodeLineSegment(codeLines: [CodeLine.empty])
]);

const int _kUnitCodeWhitespace = 0x20;
const List<String> _kClosures = ['{}', '[]', '()'];
const List<String> _kClosureAndQuates = ['{}', '[]', '()', '\'\'', '""', '``'];

class _CodeLineEditingControllerImpl extends ValueNotifier<CodeLineEditingValue>
    implements CodeLineEditingController {
  final StreamController _timerStream = StreamController<bool>.broadcast();
  final StreamController _saveController = StreamController<bool>.broadcast();
  CodeFindController? _findController;
  CodeScrollController? _scrollControler;
  @override
  final CodeLineOptions options;
  final CodeLineSpanBuilder? spanBuilder;
  late final _CodeLineEditingCache _cache;
  late int _preEditLineIndex;
  CodeLineEditingValue? _preValue;
  GlobalKey? _editorKey;
  VoidCallback? _codeChangedCallback;
  FocusNode? _focusNode;
  late AnalysisResult _analysisResult;
  String _lastAnalyzedText = '';
  Timer? _debounce;
  late VoidCallback _changeCallback;
  bool _isSaved = true;
  final _intelliSense = StreamController<IntelliData>.broadcast();
  final _intelliData = StreamController<IntelliData>.broadcast();
  final _reqObjetInfo = StreamController<bool>.broadcast();
  var _objetsInfo = <(String, String)>[];
  StreamSubscription? _subscription;
  bool _disposed = false;
  Program? _ast;
  late LayerLink _startHandleLayerLink;

  VoidCallback? _saveCallback;
  VoidCallback? _reqObjetInfoCallback;
  IntelliSenseCallback? _intelliSenseCallback;
  StreamSubscription? _saveSubscription;
  StreamSubscription? _intelliSenseSubscription;
  StreamSubscription? _reqObjetInfoSubscription;

  _CodeLineEditingControllerImpl({
    required CodeLines codeLines,
    required this.options,
    required analysisResult,
    this.spanBuilder,
  }) : super(CodeLineEditingValue(codeLines: codeLines)) {
    _cache = _CodeLineEditingCache(this);
    _preEditLineIndex = -1;
    _analysisResult = analysisResult;

    _changeCallback = () {
      //if( _cache.isCodeChanged )
      final newText = value.text;
      if (newText.isNotEmpty &&
          newText[newText.length - 1].isValidVariablePart) {
        final code = value.codeLines.asString(options.lineBreak);
        if (code.isNotEmpty) {
          try {
            _ast = parsejs(code, filename: 'javascript');
          } catch (err) {
            print('parsejs : ${err.toString()}');
          }
        }
      }
      _codeChangedCallback?.call();
      if (_isSaved && isCodeChanged) _isSaved = false;
    };
    addListener(_changeCallback);
    addListener(scheduleAnalysis);
    _subscription = _intelliData.stream.listen(_showIntelliSense);
  }

  factory _CodeLineEditingControllerImpl.fromText(String? text,
      [CodeLineOptions options = const CodeLineOptions()]) {
    return _CodeLineEditingControllerImpl(
      codeLines: CodeLineUtils.toCodeLines(text ?? ''),
      options: options,
      analysisResult: const AnalysisResult(issues: []),
    );
  }

  factory _CodeLineEditingControllerImpl.fromFile(File file,
      [CodeLineOptions options = const CodeLineOptions()]) {
    final CodeLines codeLines = file.existsSync()
        ? CodeLines.of(file.readAsLinesSync().map((e) => CodeLine(e)))
        : _kInitialCodeLines;
    if (codeLines.isEmpty) {
      codeLines.add(CodeLine.empty);
    }
    return _CodeLineEditingControllerImpl(
      codeLines: codeLines,
      options: const CodeLineOptions(),
      analysisResult: const AnalysisResult(issues: []),
    );
  }

  factory _CodeLineEditingControllerImpl.fromTextAsync(String? text,
      [CodeLineOptions options = const CodeLineOptions()]) {
    final _CodeLineEditingControllerImpl controller =
        _CodeLineEditingControllerImpl(
      codeLines: _kInitialCodeLines,
      options: options,
      analysisResult: const AnalysisResult(issues: []),
    );
    CodeLineUtils.toCodeLinesAsync(text ?? '')
        .then((value) => controller.codeLines = value);
    return controller;
  }
  @override
  void hideIntelliSense() {
    final autocompleteState = _editorKey!.currentContext!
        .findAncestorStateOfType<_CodeAutocompleteState>();
    autocompleteState?.dismiss();
  }

  @override
  Program? get AST => _ast;

  @override
  bool get disposed => _disposed;

  @override
  bool get isSaved => _isSaved;

  @override
  StreamController get saveController => _saveController;

  @override
  AnalysisResult get analysisResult => _analysisResult;

  @override
  set analysisResult(AnalysisResult analysisResult) =>
      _analysisResult = analysisResult;

  @override
  CodeFindController? get findController => _findController;

  @override
  set findController(CodeFindController? controller) =>
      _findController = controller;

  @override
  CodeScrollController? get scrollController => _scrollControler;

  @override
  set scrollController(CodeScrollController? controller) =>
      _scrollControler = controller;

  @override
  set value(CodeLineEditingValue value) {
    _preValue = super.value;
    super.value = value;
  }

  @override
  set codeLines(CodeLines newCodeLines) {
    value = value.copyWith(
        codeLines: newCodeLines.isEmpty ? _kInitialCodeLines : newCodeLines);
  }

  @override
  set selection(CodeLineSelection newSelection) {
    value = value.copyWith(selection: newSelection);
  }

  @override
  set composing(TextRange newComposing) {
    value = value.copyWith(composing: newComposing);
  }

  _CodeFieldRender get render =>
      _editorKey?.currentContext?.findRenderObject() as _CodeFieldRender;

  TextLineBreak get lineBreak => options.lineBreak;

  String get indent => options.indent;

  @override
  CodeLineEditingValue? get preValue => _preValue;

  @override
  CodeLines get codeLines => value.codeLines;

  @override
  CodeLineSelection get selection => value.selection;

  @override
  TextRange get composing => value.composing;

  @override
  CodeLine get baseLine => codeLines[selection.baseIndex];

  @override
  CodeLine get extentLine => codeLines[selection.extentIndex];

  @override
  CodeLine get startLine => codeLines[selection.startIndex];

  @override
  CodeLine get endLine => codeLines[selection.endIndex];

  @override
  bool get isComposing => composing.end > composing.start;

  @override
  String get text => codeLines.asString(lineBreak);

  @override
  FocusNode? get focusNode => _focusNode;

  @override
  set focusNode(FocusNode? node) => _focusNode = node;

  @override
  String get selectedText {
    final StringBuffer sb = StringBuffer();
    if (selection.isSameLine) {
      sb.write(startLine.substring(selection.startOffset, selection.endOffset));
    } else {
      for (int i = selection.startIndex; i <= selection.endIndex; i++) {
        final CodeLine codeLine = codeLines[i];
        if (i == selection.startIndex) {
          if (codeLine.chunkParent) {
            sb.write(codeLine.asString(selection.startOffset, lineBreak));
          } else {
            sb.write(codeLine.substring(selection.startOffset));
          }
        } else if (i == selection.endIndex) {
          sb.write(codeLine.substring(0, selection.endOffset));
        } else {
          sb.write(codeLine.asString(0, lineBreak));
        }
        if (i < selection.endIndex) {
          sb.write(lineBreak.value);
        }
      }
    }
    return sb.toString();
  }

  @override
  int get lineCount => codeLines.lineCount;

  @override
  CodeLineSelection get unforldLineSelection {
    final int baseRawIndex;
    final int extentRawIndex;
    if (selection.isSameLine) {
      baseRawIndex = extentRawIndex = index2lineIndex(selection.baseIndex);
    } else {
      baseRawIndex = index2lineIndex(selection.baseIndex);
      extentRawIndex = index2lineIndex(selection.extentIndex);
    }
    return selection.copyWith(
        baseIndex: baseRawIndex, extentIndex: extentRawIndex);
  }

  @override
  bool get isEmpty => codeLines == _kInitialCodeLines;

  @override
  bool get isAllSelected =>
      selection.start.index == 0 &&
      selection.start.offset == 0 &&
      selection.end.index == codeLines.length - 1 &&
      selection.end.offset == codeLines.last.length;

  @override
  bool get canUndo => _cache.canUndo;

  @override
  bool get canRedo => _cache.canRedo;

  @override
  bool get isCodeChanged => _cache.isCodeChanged;

  @override
  VoidCallback? get codeChangedCallback => _codeChangedCallback;

  @override
  set codeChangedCallback(VoidCallback? callback) =>
      _codeChangedCallback = callback;

  @override
  set saveCallback(ui.VoidCallback? callback) {
    _saveCallback = callback;
    _saveSubscription?.cancel();
    _saveSubscription = _saveController.stream.listen((data) {
      _saveCallback?.call();
    });
  }

  @override
  set reqObjetInfoCallback(ui.VoidCallback? callback) {
    _reqObjetInfoCallback = callback;
    _reqObjetInfoSubscription?.cancel();
    _reqObjetInfoSubscription = _reqObjetInfo.stream.listen((data) {
      _reqObjetInfoCallback?.call();
    });
  }

  @override
  set intelliSenseCallback(IntelliSenseCallback? callback) {
    _intelliSenseCallback = callback;
    _intelliSenseSubscription?.cancel();
    _intelliSenseSubscription = _intelliSense.stream.listen((data) {
      _intelliSenseCallback?.call(data);
    });
  }

  @override
  set text(String value) {
    runRevocableOp(() {
      if (value.isEmpty) {
        value = ' ';
      }
      this.value =
          CodeLineEditingValue(codeLines: CodeLineUtils.toCodeLines(value));
    });
  }

  @override
  set textAsync(String value) {
    CodeLineUtils.toCodeLinesAsync(value).then((value) {
      runRevocableOp(() {
        this.value = CodeLineEditingValue(codeLines: value);
      });
    }).onError((error, stackTrace) {
      // Should not happen
    });
  }

  @override
  void initializeCache() {
    _isSaved = true;
    _cache.initialize();
  }

  @override
  void bindEditor(GlobalKey key) {
    _editorKey = key;
  }

  @override
  void edit(TextEditingValue newValue) {
    final CodeLines newCodeLines;
    final TextSelection newSelection;
    final TextRange newComposing;
    // FIXME: large list operation is very very slow
    if (selection.isSameLine) {
      if (startLine.text == newValue.text) {
        newCodeLines = codeLines;
      } else {
        newCodeLines = CodeLines.from(codeLines);
        newCodeLines[selection.startIndex] =
            startLine.copyWith(text: newValue.text);
      }
      newSelection = newValue.selection;
      newComposing = newValue.composing;
    } else if (selection.baseIndex < selection.extentIndex) {
      newCodeLines = codeLines.sublines(0, selection.startIndex);
      newCodeLines.add(endLine.copyWith(
          text: newValue.text + endLine.substring(selection.endOffset)));
      if (selection.endIndex + 1 < codeLines.length) {
        newCodeLines.addFrom(codeLines, selection.endIndex + 1);
      }
      newSelection = newValue.selection;
      newComposing = newValue.composing;
    } else {
      newCodeLines = codeLines.sublines(0, selection.startIndex);
      newCodeLines.add(endLine.copyWith(
          text: startLine.substring(0, selection.startOffset) + newValue.text));
      if (selection.endIndex + 1 < codeLines.length) {
        newCodeLines.addFrom(codeLines, selection.endIndex + 1);
      }
      newSelection = TextSelection.collapsed(
          offset: selection.startOffset + newValue.selection.baseOffset);
      if (newValue.composing.isValid) {
        newComposing = TextRange(
          start: selection.startOffset + newValue.composing.start,
          end: selection.startOffset + newValue.composing.end,
        );
      } else {
        newComposing = newValue.composing;
      }
    }
    if (_preEditLineIndex != selection.extentIndex) {
      _preEditLineIndex = selection.extentIndex;
      _cache.markNewRecord(true);
    }
    value = value.copyWith(
      codeLines: newCodeLines,
      selection: CodeLineSelection.fromTextSelection(
        index: selection.startIndex,
        selection: newSelection,
      ),
      composing: newComposing,
      text: newValue.text,
    );
    _cache.markNewRecord(false);
    makeCursorCenterIfInvisible();
  }

  @override
  void selectLine(int index) {
    selectLines(index, index);
  }

  @override
  void selectLines(int base, int extent) {
    final int start = min(base, extent);
    final int end = max(base, extent);
    if (start < 0 || end >= codeLines.length) {
      return;
    }
    selection = selection.copyWith(
      baseIndex: base,
      baseOffset: base > extent ? codeLines[end].length : 0,
      extentIndex: extent,
      extentOffset: base > extent ? 0 : codeLines[end].length,
    );
    makeCursorCenterIfInvisible();
  }

  @override
  void selectAll() {
    selection = CodeLineSelection(
        baseIndex: 0,
        baseOffset: 0,
        extentIndex: codeLines.length - 1,
        extentOffset: codeLines.last.length);
  }

  @override
  void cancelSelection() {
    if (!selection.isCollapsed) {
      selection = CodeLineSelection.fromPosition(position: selection.extent);
      makeCursorCenterIfInvisible();
    }
  }

  @override
  void moveSelectionLinesUp() {
    runRevocableOp(_moveSelectionLinesUp);
  }

  @override
  void moveSelectionLinesDown() {
    runRevocableOp(_moveSelectionLinesDown);
  }

  @override
  void moveCursor(AxisDirection direction) {
    switch (direction) {
      case AxisDirection.left:
        if (!selection.isCollapsed) {
          selection = CodeLineSelection.fromPosition(position: selection.start);
        } else if (selection.extentIndex != 0 || selection.extentOffset != 0) {
          if (selection.baseAffinity != selection.extentAffinity) {
            selection = selection.copyWith(
                baseAffinity: TextAffinity.upstream,
                extentAffinity: TextAffinity.upstream);
          } else {
            final int index;
            final int offset;
            if (selection.extentOffset == 0) {
              index = selection.extentIndex - 1;
              offset = codeLines[index].length;
            } else {
              index = selection.extentIndex;
              // Skip 1 character to left
              offset = codeLines[index]
                  .substring(0, selection.extentOffset)
                  .characters
                  .skipLast(1)
                  .string
                  .length;
            }
            selection = CodeLineSelection.collapsed(
              index: index,
              offset: offset,
              affinity: TextAffinity.downstream,
            );
          }
        }
        break;
      case AxisDirection.right:
        if (!selection.isCollapsed) {
          selection = CodeLineSelection.fromPosition(position: selection.end);
        } else if (selection.extentIndex != codeLines.length - 1 ||
            selection.extentOffset != codeLines.last.length) {
          if (selection.baseAffinity != selection.extentAffinity) {
            selection = selection.copyWith(
                baseAffinity: TextAffinity.downstream,
                extentAffinity: TextAffinity.downstream);
          } else {
            final int index;
            final int offset;
            if (selection.extentOffset == extentLine.length) {
              index = selection.extentIndex + 1;
              offset = 0;
            } else {
              index = selection.extentIndex;
              // Skip 1 character to right
              offset = selection.extentOffset +
                  codeLines[index]
                      .substring(selection.extentOffset)
                      .characters
                      .first
                      .length;
            }
            selection = CodeLineSelection.collapsed(
              index: index,
              offset: offset,
              affinity: TextAffinity.upstream,
            );
          }
        }
        break;
      case AxisDirection.up:
        final CodeLinePosition? position =
            _render?.getUpPosition(selection.start);
        if (position != null) {
          selection = CodeLineSelection.fromPosition(position: position);
        } else {
          final CodeLinePosition current = selection.start;
          if (current.index == 0) {
            selection = const CodeLineSelection.collapsed(index: 0, offset: 0);
          } else {
            selection = CodeLineSelection.collapsed(
                index: current.index - 1,
                offset:
                    min(codeLines[current.index - 1].length, current.offset));
          }
        }
        break;
      case AxisDirection.down:
        final CodeLinePosition? position =
            _render?.getDownPosition(selection.start);
        if (position != null) {
          selection = CodeLineSelection.fromPosition(position: position);
        } else {
          final CodeLinePosition current = selection.end;
          if (current.index == codeLines.length - 1) {
            selection = CodeLineSelection.collapsed(
                index: codeLines.length - 1, offset: codeLines.last.length);
          } else {
            selection = CodeLineSelection.collapsed(
                index: current.index + 1,
                offset:
                    min(codeLines[current.index + 1].length, current.offset));
          }
        }
        break;
    }
    makeCursorVisible();
  }

  @override
  void moveCursorToLineStart() {
    final String current = extentLine.text;
    final int prefixWhitespaceCount = _prefixWhitespaceCount(current);
    final int offset;
    if (selection.extentOffset == 0) {
      offset = prefixWhitespaceCount;
    } else {
      if (selection.extentOffset == prefixWhitespaceCount) {
        offset = 0;
      } else {
        offset = prefixWhitespaceCount;
      }
    }
    selection = CodeLineSelection.collapsed(
        index: selection.extentIndex, offset: offset);
    makeCursorVisible();
  }

  @override
  void moveCursorToLineEnd() {
    selection = CodeLineSelection.collapsed(
        index: selection.extentIndex, offset: extentLine.length);
    makeCursorVisible();
  }

  @override
  void moveCursorToPageStart() {
    selection = const CodeLineSelection.collapsed(index: 0, offset: 0);
    makeCursorVisible();
  }

  @override
  void moveCursorToPageEnd() {
    selection = CodeLineSelection.collapsed(
        index: codeLines.length - 1, offset: codeLines.last.length);
    makeCursorVisible();
  }

  @override
  void moveCursorToPageUp() {
    var prevIndex = selection.baseIndex - 20;
    selection = CodeLineSelection.collapsed(
        index: prevIndex < 0 ? 0 : prevIndex, offset: 0);
    makeCursorVisible();
  }

  @override
  void moveCursorToPageDown() {
    var nextIndex = selection.baseIndex + 20;

    selection = CodeLineSelection.collapsed(index: nextIndex, offset: 0);
    makeCursorVisible();
  }

  @override
  void extendSelection(AxisDirection direction) {
    switch (direction) {
      case AxisDirection.left:
        if (selection.extentIndex != 0 || selection.extentOffset != 0) {
          final int index;
          final int offset;
          if (selection.extentOffset == 0) {
            index = selection.extentIndex - 1;
            offset = codeLines[index].length;
          } else {
            index = selection.extentIndex;
            final Characters characters =
                extentLine.substring(0, selection.extentOffset).characters;
            offset =
                selection.extentOffset - characters.takeLast(1).first.length;
          }
          selection = selection.copyWith(
              extentIndex: index,
              extentOffset: offset,
              extentAffinity: TextAffinity.downstream);
        }
        break;
      case AxisDirection.right:
        if (selection.extentIndex != codeLines.length - 1 ||
            selection.extentOffset != codeLines.last.length) {
          final int index;
          final int offset;
          if (selection.extentOffset == extentLine.length) {
            index = selection.extentIndex + 1;
            offset = 0;
          } else {
            final Characters characters =
                extentLine.substring(selection.extentOffset).characters;
            index = selection.extentIndex;
            offset = selection.extentOffset + characters.elementAt(0).length;
          }
          selection = selection.copyWith(
              extentIndex: index,
              extentOffset: offset,
              extentAffinity: TextAffinity.upstream);
        }
        break;
      case AxisDirection.up:
        final CodeLinePosition? position =
            _render?.getUpPosition(selection.extent);
        if (position != null) {
          selection = selection.copyWith(
              extentIndex: position.index,
              extentOffset: position.offset,
              extentAffinity: position.affinity);
        } else {
          final CodeLinePosition current = selection.extent;
          if (current.index == 0) {
            selection = selection.copyWith(extentIndex: 0, extentOffset: 0);
          } else {
            selection = selection.copyWith(
                extentIndex: current.index - 1,
                extentOffset:
                    min(codeLines[current.index - 1].length, current.offset));
          }
        }
        break;
      case AxisDirection.down:
        final CodeLinePosition? position =
            _render?.getDownPosition(selection.extent);
        if (position != null) {
          selection = selection.copyWith(
              extentIndex: position.index,
              extentOffset: position.offset,
              extentAffinity: position.affinity);
        } else {
          final CodeLinePosition current = selection.extent;
          if (current.index == codeLines.length - 1) {
            selection = selection.copyWith(
                extentIndex: codeLines.length - 1,
                extentOffset: codeLines.last.length);
          } else {
            selection = selection.copyWith(
                extentIndex: current.index + 1,
                extentOffset:
                    min(codeLines[current.index + 1].length, current.offset));
          }
        }
        break;
    }
    makeCursorVisible();
  }

  // void adjustSelection(int offset, bool range) {
  //   var baseIndex = selection.baseIndex;
  //   var extentIndex = selection.extentIndex;
  //   var baseOffset = selection.baseOffset;
  //   var extentOffset = selection.extentOffset;
  //   if( baseIndex > extentIndex ) {
  //     (baseIndex, extentIndex) = (extentIndex, baseIndex);
  //   }
  //   if( baseOffset > extentOffset ) {
  //     (baseOffset, extentOffset) = (extentOffset, baseOffset);
  //   }
  //   baseOffset = _wordForward ? (range ? baseOffset : offset) : (range ? offset : baseOffset);
  //   extentOffset = _wordForward ? (range ? offset : extentOffset) : (range ? extentOffset : offset);
  //   selection = selection.copyWith(
  //       baseIndex: baseIndex,
  //       extentIndex: extentIndex,
  //       baseOffset: baseOffset,
  //       extentOffset: extentOffset
  //   );
  // }

  // bool get hasSelection => selection.baseIndex!=selection.extentIndex ||
  //                          selection.baseOffset!=selection.extentOffset;

  // int findWordOffsetExt(bool forward) {
  //   final bOffset = selection.baseOffset;
  //   final eOffset = selection.extentOffset;
  //
  //   final line = extentLine.text;
  //   var skip = true;
  //   var start = (forward ? bOffset : eOffset) - 1;
  //   var end = (forward ? eOffset : bOffset) - 1;
  //
  //   for( int i=start; forward ? i<end : i>=end; forward ? i++ : i-- ) {
  //     if( line[i]==' ') {
  //       if( skip ) {
  //         continue;
  //       } else {
  //         return i;
  //       }
  //     } else {
  //       skip = false;
  //     }
  //   }
  //   return -1;
  // }

  int findWordOffset(bool forward) {
    final line = extentLine.text;
    var skip = true;

    var start = forward ? selection.extentOffset : selection.extentOffset - 1;
    final end = forward ? line.length : 0;

    if (start == end) {
      return start;
    }
    for (int i = start; forward ? i < end : i >= end; forward ? i++ : i--) {
      if (line[i] == ' ') {
        if (skip) {
          continue;
        } else {
          return i;
        }
      } else {
        skip = false;
      }
    }
    return -1;
  }

  @override
  void extendSelectionToWordBackward() {
    final direction = selection.extentOffset - selection.baseOffset;

    var offset = findWordOffset(false);
    if (offset == -1) {
      offset = direction > 0 ? selection.extentOffset : 0;
    }
    selection = selection.copyWith(
        extentIndex: selection.extentIndex, extentOffset: offset);
    makeCursorVisible();
  }

  @override
  void extendSelectionToWordForward() {
    final direction = selection.extentOffset - selection.baseOffset;

    var offset = findWordOffset(true);
    if (offset == -1) {
      offset = direction > 0 ? extentLine.text.length : selection.baseOffset;
    }
    selection = selection.copyWith(
        extentIndex: selection.extentIndex, extentOffset: offset);
    makeCursorVisible();
  }

  @override
  void moveCursorToWordBoundaryForward() {
    final direction = selection.extentOffset - selection.baseOffset;

    var offset = findWordOffset(true);
    if (offset == -1) {
      offset = extentLine.text.length;
    }
    selection = selection.copyWith(
        extentIndex: selection.extentIndex,
        baseOffset: offset,
        extentOffset: offset);
    makeCursorVisible();
  }

  @override
  void moveCursorToWordBoundaryBackward() {
    final direction = selection.extentOffset - selection.baseOffset;

    var offset = findWordOffset(false);
    if (offset == -1) {
      offset = 0;
    }
    selection = selection.copyWith(
        extentIndex: selection.extentIndex,
        baseOffset: offset,
        extentOffset: offset);
    makeCursorVisible();
  }

  @override
  void extendSelectionToLineStart() {
    selection = selection.copyWith(extentOffset: 0);
    makeCursorVisible();
  }

  @override
  void extendSelectionToLineEnd() {
    selection = selection.copyWith(
        extentIndex: selection.extentIndex, extentOffset: extentLine.length);
    makeCursorVisible();
  }

  @override
  void extendSelectionToPageStart() {
    selection = selection.copyWith(extentIndex: 0, extentOffset: 0);
    makeCursorVisible();
  }

  @override
  void extendSelectionToPageEnd() {
    selection = selection.copyWith(
        extentIndex: codeLines.length - 1, extentOffset: codeLines.last.length);
    makeCursorVisible();
  }

  @override
  void deleteSelectionLines([bool keepExtentOffset = true]) {
    runRevocableOp(() {
      _deleteSelectionLines(keepExtentOffset);
    });
  }

  @override
  void deleteSelection() {
    runRevocableOp(_deleteSelection);
  }

  @override
  void deleteAllBefore() {
    runRevocableOp(_deleteAllBefore);
  }

  @override
  void deleteBackward() {
    runRevocableOp(_deleteBackward);
  }

  @override
  void deleteForward() {
    runRevocableOp(_deleteForward);
  }

  @override
  void applyNewLine() {
    runRevocableOp(_applyNewLine);
  }

  @override
  void applyIndent() {
    runRevocableOp(_applyIndent);
  }

  @override
  void applyOutdent() {
    runRevocableOp(_applyOutdent);
  }

  @override
  void transposeCharacters() {
    runRevocableOp(_transposeCharacters);
  }

  @override
  void replaceSelection(String replacement, [CodeLineSelection? range]) {
    runRevocableOp(() {
      _replaceRange(replacement, range);
    });
  }

  @override
  void replaceAll(Pattern pattern, String replacement) {
    runRevocableOp(() {
      _replaceAll(pattern, replacement);
    });
  }

  @override
  void undo() => _cache.undo();

  @override
  void redo() => _cache.redo();

  @override
  Future<void> copy() {
    if (selection.isCollapsed) {
      return Clipboard.setData(
          ClipboardData(text: extentLine.text + lineBreak.value));
    } else {
      return Clipboard.setData(ClipboardData(text: selectedText));
    }
  }

  @override
  void cut() {
    copy();
    if (selection.isCollapsed) {
      deleteSelectionLines(true);
    } else {
      deleteSelection();
    }
  }

  @override
  void paste() {
    Clipboard.getData(Clipboard.kTextPlain).then((data) {
      final String? text = data?.text;
      if (text == null || text.isEmpty) {
        return;
      }
      replaceSelection(text);
    });
  }

  @override
  void collapseChunk(int start, int end) {
    if (start < 0 ||
        start >= codeLines.length ||
        end <= start + 1 ||
        end > codeLines.length) {
      return;
    }
    if (codeLines[start].chunkParent) {
      return;
    }
    final CodeLines newCodeLines = codeLines.sublines(0, start);
    newCodeLines.add(codeLines[start]
        .copyWith(chunks: codeLines.sublines(start + 1, end).toList()));
    if (end < codeLines.length) {
      newCodeLines.addFrom(codeLines, end);
    }
    final int newStartIndex;
    final int newStartOffset;
    if (selection.startIndex <= start) {
      newStartIndex = selection.startIndex;
      newStartOffset = selection.startOffset;
    } else if (selection.startIndex < end) {
      newStartIndex = start;
      newStartOffset = codeLines[start].text.length;
    } else {
      newStartIndex = selection.startIndex - (end - start - 1);
      newStartOffset = selection.startOffset;
    }
    final int newEndIndex;
    final int newEndOffset;
    if (selection.endIndex <= start) {
      newEndIndex = selection.endIndex;
      newEndOffset = selection.endOffset;
    } else if (selection.endIndex < end) {
      newEndIndex = start;
      newEndOffset = codeLines[start].text.length;
    } else {
      newEndIndex = selection.endIndex - (end - start - 1);
      newEndOffset = selection.endOffset;
    }
    final CodeLineSelection newSelection;
    if (selection.baseIndex < selection.extentIndex) {
      newSelection = selection.copyWith(
          baseIndex: newStartIndex,
          baseOffset: newStartOffset,
          extentIndex: newEndIndex,
          extentOffset: newEndOffset);
    } else {
      newSelection = selection.copyWith(
          baseIndex: newEndIndex,
          baseOffset: newEndOffset,
          extentIndex: newStartIndex,
          extentOffset: newStartOffset);
    }
    final TextRange newComposing;
    if (selection.baseIndex > start && selection.baseIndex < end) {
      newComposing = TextRange.empty;
    } else {
      newComposing = composing;
    }
    value = value.copyWith(
        codeLines: newCodeLines,
        selection: newSelection,
        composing: newComposing);
  }

  @override
  void expandChunk(int index) {
    if (!codeLines[index].chunkParent) {
      return;
    }
    final CodeLines newCodeLines = codeLines.sublines(0, index);
    newCodeLines.add(codeLines[index].copyWith(chunks: const []));
    final List<CodeLine> collapsedChunks = codeLines[index].chunks;
    newCodeLines.addAll(collapsedChunks);
    if (index + 1 < codeLines.length) {
      newCodeLines.addFrom(codeLines, index + 1);
    }
    final CodeLineSelection newSelection;
    if (selection.endIndex <= index) {
      newSelection = selection;
    } else if (selection.startIndex <= index) {
      if (selection.baseIndex < selection.extentIndex) {
        newSelection = selection.copyWith(
            extentIndex: selection.extentIndex + collapsedChunks.length);
      } else {
        newSelection = selection.copyWith(
            baseIndex: selection.baseIndex + collapsedChunks.length);
      }
    } else {
      newSelection = selection.copyWith(
          baseIndex: selection.baseIndex + collapsedChunks.length,
          extentIndex: selection.extentIndex + collapsedChunks.length);
    }
    value = value.copyWith(
      codeLines: newCodeLines,
      selection: newSelection,
    );
  }

  @override
  void clearComposing() {
    value = value.copyWith(composing: TextRange.empty);
  }

  @override
  int index2lineIndex(int index) => codeLines.index2lineIndex(index);

  @override
  CodeLineIndex lineIndex2Index(int lineIndex) =>
      codeLines.lineIndex2Index(lineIndex);

  @override
  void makeCursorCenterIfInvisible() {
    _render?.makePositionCenterIfInvisible(selection.extent);
  }

  @override
  void makeCursorVisible() {
    _render?.makePositionVisible(selection.extent);
  }

  @override
  void makePositionCenterIfInvisible(CodeLinePosition position) {
    _render?.makePositionCenterIfInvisible(position);
  }

  @override
  void makePositionVisible(CodeLinePosition position) {
    _render?.makePositionVisible(position);
  }

  @override
  void runRevocableOp(VoidCallback op) {
    _cache.markNewRecord(true);
    op();
    _cache.markNewRecord(false);
  }

  @override
  void dispose() {
    _saveSubscription?.cancel();
    _intelliSenseSubscription?.cancel();
    _reqObjetInfoSubscription?.cancel();
    _debounce?.cancel();
    _editorKey = null;
    _cache.dispose();
    _saveController.close();
    _reqObjetInfo.close();
    _intelliSense.close();
    removeListener(_changeCallback);
    removeListener(scheduleAnalysis);
    _subscription?.cancel();
    _disposed = true;
    super.dispose();
  }

  _CodeFieldRender? get _render =>
      _editorKey?.currentContext?.findRenderObject() as _CodeFieldRender?;

  void _moveSelectionLinesUp() {
    if (selection.startIndex == 0) {
      return;
    }
    final CodeLines newCodeLines = CodeLines.from(codeLines);
    final CodeLine tmp = codeLines[selection.startIndex - 1];
    for (int i = selection.startIndex; i <= selection.endIndex; i++) {
      newCodeLines[i - 1] = newCodeLines[i];
    }
    newCodeLines[selection.endIndex] = tmp;
    value = value.copyWith(
        codeLines: newCodeLines,
        selection: selection.copyWith(
          baseIndex: selection.baseIndex - 1,
          extentIndex: selection.extentIndex - 1,
        ));
    makeCursorCenterIfInvisible();
  }

  void _moveSelectionLinesDown() {
    if (selection.endIndex == codeLines.length - 1) {
      return;
    }
    final CodeLines newCodeLines = CodeLines.from(codeLines);
    final CodeLine tmp = codeLines[selection.endIndex + 1];
    for (int i = selection.endIndex; i >= selection.startIndex; i--) {
      newCodeLines[i + 1] = newCodeLines[i];
    }
    newCodeLines[selection.startIndex] = tmp;
    value = value.copyWith(
        codeLines: newCodeLines,
        selection: selection.copyWith(
          baseIndex: selection.baseIndex + 1,
          extentIndex: selection.extentIndex + 1,
        ));
    makeCursorCenterIfInvisible();
  }

  void _deleteSelectionLines([bool keepExtentOffset = true]) {
    if (codeLines.equals(_kInitialCodeLines)) {
      return;
    }
    final CodeLines newCodeLines = codeLines.sublines(0, selection.startIndex);
    if (selection.endIndex + 1 < codeLines.length) {
      newCodeLines.addFrom(codeLines, selection.endIndex + 1);
    }
    if (newCodeLines.isEmpty) {
      newCodeLines.add(CodeLine.empty);
    }
    final int index = min(selection.startIndex, newCodeLines.length - 1);
    final int offset;
    if (keepExtentOffset) {
      offset = min(newCodeLines[index].length, selection.extentOffset);
    } else {
      offset = 0;
    }
    value = value.copyWith(
      codeLines: newCodeLines,
      selection: CodeLineSelection.collapsed(index: index, offset: offset),
    );
    makeCursorCenterIfInvisible();
  }

  void _deleteSelection() {
    if (selection.isCollapsed) {
      return;
    }
    final CodeLines newCodeLines = codeLines.sublines(0, selection.startIndex);
    final CodeLine after = _codeLineAfter(selection.end);
    newCodeLines.add(after.copyWith(
      text: _codeTextBefore(selection.start) + after.text,
    ));
    if (selection.endIndex + 1 < codeLines.length) {
      newCodeLines.addFrom(codeLines, selection.endIndex + 1);
    }
    value = value.copyWith(
        codeLines: newCodeLines,
        selection: CodeLineSelection.collapsed(
            index: selection.startIndex,
            offset: selection.startOffset,
            affinity: selection.start.affinity));
    makeCursorCenterIfInvisible();
  }

  void _deleteAllBefore() {
    selection = selection.copyWith(baseOffset: 0);
    _deleteSelection();
    makeCursorCenterIfInvisible();
  }

  void _deleteBackward() {
    if (selection.isCollapsed) {
      if (selection.baseIndex == 0 && selection.baseOffset == 0) {
        // At the start position of page, nothing to delete
        return;
      }
      if (selection.baseOffset == 0) {
        // Delete this line and merge into the previous line
        final CodeLines newCodeLines =
            codeLines.sublines(0, selection.baseIndex - 1);
        final CodeLine preLine = codeLines[selection.baseIndex - 1];
        if (preLine.chunkParent) {
          // Should expand this chunk
          newCodeLines.add(CodeLine(preLine.text));
          newCodeLines
              .addAll(preLine.chunks.sublist(0, preLine.chunks.length - 1));
          newCodeLines.add(baseLine.copyWith(
              text: preLine.chunks.last.text + baseLine.text));
          if (selection.baseIndex + 1 < codeLines.length) {
            newCodeLines.addFrom(codeLines, selection.baseIndex + 1);
          }
          value = value.copyWith(
              codeLines: newCodeLines,
              selection: CodeLineSelection.collapsed(
                index: selection.baseIndex + preLine.chunks.length - 1,
                offset: preLine.chunks.last.length,
              ));
        } else {
          newCodeLines
              .add(baseLine.copyWith(text: preLine.text + baseLine.text));
          if (selection.baseIndex + 1 < codeLines.length) {
            newCodeLines.addFrom(codeLines, selection.baseIndex + 1);
          }
          value = value.copyWith(
              codeLines: newCodeLines,
              selection: CodeLineSelection.collapsed(
                index: selection.baseIndex - 1,
                offset: preLine.length,
              ));
        }
      } else {
        final CodeLines newCodeLines = CodeLines.from(codeLines);
        if (_isWrapedByClosureSymbol(baseLine.text, selection.baseOffset)) {
          // Delete left and right closure symbols at same time, like this:
          // abc{|}123 -> abc123
          newCodeLines[selection.baseIndex] = baseLine.copyWith(
              text: baseLine.substring(0, selection.baseOffset - 1) +
                  baseLine.substring(selection.baseOffset + 1));
          value = value.copyWith(
              codeLines: newCodeLines,
              selection: CodeLineSelection.collapsed(
                  index: selection.baseIndex,
                  offset: selection.baseOffset - 1));
        } else {
          String backward = _codeTextBefore(selection.base);
          if (_isMultipleIndent(backward)) {
            // Delete a indent
            backward = backward.substring(indent.length, backward.length);
          } else if (backward.isNotEmpty) {
            // Delete the previous character normally
            final Characters characters = backward.characters;
            backward = characters.skipLast(1).string;
          }
          newCodeLines[selection.baseIndex] = baseLine.copyWith(
              text: backward + baseLine.substring(selection.baseOffset));
          value = value.copyWith(
              codeLines: newCodeLines,
              selection: CodeLineSelection.collapsed(
                  index: selection.baseIndex, offset: backward.length));
        }
      }
    } else {
      _deleteSelection();
    }
    makeCursorCenterIfInvisible();
  }

  void _deleteForward() {
    if (selection.isCollapsed) {
      if (selection.extentIndex == codeLines.length - 1 &&
          selection.extentOffset == codeLines.last.length) {
        // At the end position of page, nothing to delete
        return;
      }
      if (selection.extentOffset == extentLine.length) {
        // Delete next line and merge into the current line
        final CodeLines newCodeLines =
            codeLines.sublines(0, selection.extentIndex);
        if (extentLine.chunkParent) {
          final CodeLine nextLine = extentLine.chunks.first;
          // Should expand this chunk
          newCodeLines
              .add(nextLine.copyWith(text: extentLine.text + nextLine.text));
          newCodeLines.addAll(extentLine.chunks.sublist(1));
          if (selection.extentIndex + 1 < codeLines.length) {
            newCodeLines.addFrom(codeLines, selection.extentIndex + 1);
          }
        } else {
          newCodeLines.add(codeLines[selection.extentIndex + 1].copyWith(
              text:
                  extentLine.text + codeLines[selection.extentIndex + 1].text));
          if (selection.extentIndex + 2 < codeLines.length) {
            newCodeLines.addFrom(codeLines, selection.extentIndex + 2);
          }
        }
        value = value.copyWith(
            codeLines: newCodeLines,
            selection: CodeLineSelection.collapsed(
              index: selection.extentIndex,
              offset: extentLine.length,
            ));
      } else {
        final CodeLines newCodeLines = CodeLines.from(codeLines);
        if (_isWrapedByClosureSymbol(extentLine.text, selection.extentOffset)) {
          // Delete left and right closure symbols at same time, like this:
          // abc{|}123 -> abc123
          newCodeLines[selection.extentIndex] = extentLine.copyWith(
              text: extentLine.substring(0, selection.extentOffset - 1) +
                  extentLine.substring(selection.extentOffset + 1));
          value = value.copyWith(
              codeLines: newCodeLines,
              selection: CodeLineSelection.collapsed(
                  index: selection.extentIndex,
                  offset: selection.extentOffset - 1));
        } else {
          String forward = _codeTextAfter(selection.extent);
          final int indentSizeInForward = _prefixWhitespaceCount(forward);
          if (indentSizeInForward > 0 &&
              indentSizeInForward % indent.length == 0) {
            forward = forward.substring(indent.length);
          } else {
            // Delete the next character normally
            final Characters characters = forward.characters;
            forward = characters.skip(1).string;
          }
          newCodeLines[selection.extentIndex] = extentLine.copyWith(
              text: _codeTextBefore(selection.extent) + forward);
          value = value.copyWith(
              codeLines: newCodeLines,
              selection: CodeLineSelection.collapsed(
                  index: selection.extentIndex,
                  offset: selection.extentOffset));
        }
      }
    } else {
      _deleteSelection();
    }
    makeCursorCenterIfInvisible();
  }

  void _applyNewLine() {
    final CodeLines newCodeLines = codeLines.sublines(0, selection.startIndex);
    final CodeLine before = _codeLineBefore(selection.start);
    final CodeLine after = _codeLineAfter(selection.end);
    newCodeLines.add(before);
    final String alignIndent = before.substring(0, before.text.indentLength);
    final int offset;
    // If the enter tap in a closure, we should add a new code line inside the closure
    // with an addtional indent.
    // e.g.
    // {|} => {
    //           |
    //        }
    if (_selectionInClosure) {
      newCodeLines.add(CodeLine(alignIndent + indent));
      offset = newCodeLines.last.length;
    } else {
      offset = alignIndent.length;
    }
    // Align the next line's intent with pre code line
    newCodeLines.add(after.copyWith(text: alignIndent + after.text));
    if (selection.endIndex + 1 < codeLines.length) {
      newCodeLines.addFrom(codeLines, selection.endIndex + 1);
    }
    value = value.copyWith(
      codeLines: newCodeLines,
      selection: CodeLineSelection.collapsed(
          index: selection.startIndex + 1, offset: offset),
    );
    makeCursorCenterIfInvisible();
  }

  void _applyIndent() {
    final CodeLines newCodeLines = CodeLines.from(codeLines);
    if (selection.isSameLine) {
      if (selection.isCollapsed ||
          selection.startOffset != 0 ||
          selection.endOffset != endLine.length) {
        final String textBefore = _codeTextBefore(selection.start);
        final int indentLength =
            indent.length - textBefore.length % indent.length;
        newCodeLines[selection.extentIndex] = extentLine.copyWith(
            text: textBefore +
                ' ' * indentLength +
                _codeTextAfter(selection.end));
        value = value.copyWith(
            codeLines: newCodeLines,
            selection: CodeLineSelection.collapsed(
                index: selection.startIndex,
                offset: selection.startOffset + indentLength));
      } else {
        // This whole line is selected, just add the indent
        newCodeLines[selection.extentIndex] =
            extentLine.copyWith(text: _applyTextIndent(extentLine.text));
        value = value.copyWith(
            codeLines: newCodeLines,
            selection: selection.copyWith(
                baseOffset: selection.baseOffset == 0
                    ? 0
                    : newCodeLines[selection.baseIndex].length,
                extentOffset: selection.extentOffset == 0
                    ? 0
                    : newCodeLines[selection.extentIndex].length));
      }
    } else {
      for (int i = selection.startIndex; i <= selection.endIndex; i++) {
        // Do not apply indent to the last line if the offset is 0
        if (i == selection.endIndex && selection.endOffset == 0) {
          continue;
        }
        List<CodeLine> chunks = codeLines[i].chunks;
        if (chunks.isNotEmpty && i != selection.endIndex) {
          // Apply indent to collapsed chunks
          chunks = _applyIndents(chunks);
        }
        newCodeLines[i] = codeLines[i].copyWith(
            text: _applyTextIndent(codeLines[i].text), chunks: chunks);
      }
      value = value.copyWith(
          codeLines: newCodeLines,
          selection: selection.copyWith(
            baseOffset:
                _whitespaceCountBefore(baseLine.text, selection.baseOffset) ==
                        selection.baseOffset
                    ? selection.baseOffset
                    : selection.baseOffset +
                        (newCodeLines[selection.baseIndex].length -
                            baseLine.text.length),
            extentOffset: _whitespaceCountBefore(
                        extentLine.text, selection.extentOffset) ==
                    selection.extentOffset
                ? selection.extentOffset
                : selection.extentOffset +
                    (newCodeLines[selection.extentIndex].length -
                        extentLine.text.length),
          ));
    }
    makeCursorCenterIfInvisible();
  }

  void _applyOutdent() {
    final CodeLines newCodeLines;
    if (selection.isSameLine) {
      final CodeLine outdentCodeLine =
          extentLine.copyWith(text: _applyTextOutdent(extentLine.text));
      if (outdentCodeLine == extentLine) {
        // Nothing changed
        return;
      }
      newCodeLines = CodeLines.from(codeLines);
      newCodeLines[selection.extentIndex] = outdentCodeLine;
    } else {
      final CodeLines outdentCodeLines = CodeLines.of([]);
      bool lastSkipped = false;
      for (int i = selection.startIndex; i <= selection.endIndex; i++) {
        // Do not apply outdent to the last line if the offset is 0
        if (i == selection.endIndex && selection.endOffset == 0) {
          lastSkipped = true;
          continue;
        }
        List<CodeLine> chunks = codeLines[i].chunks;
        if (chunks.isNotEmpty && i != selection.endIndex) {
          // Apply indent to collapsed chunks
          chunks = _applyOutdents(chunks);
        }
        outdentCodeLines.add(codeLines[i].copyWith(
            text: _applyTextOutdent(codeLines[i].text), chunks: chunks));
      }
      if (outdentCodeLines.equals(codeLines.sublines(selection.startIndex,
          lastSkipped ? selection.endIndex : selection.endIndex + 1))) {
        // Nothing changed
        return;
      }
      newCodeLines = CodeLines.from(codeLines);
      for (int i = 0; i < outdentCodeLines.length; i++) {
        newCodeLines[i + selection.startIndex] = outdentCodeLines[i];
      }
    }
    // If there are enough whitespace after the selection, we should keep the selection offset.
    final int whitespaceCountAfterBaseLine =
        max(0, _prefixWhitespaceCount(baseLine.text) - selection.baseOffset);
    final int baseOffset = max(
        0,
        selection.baseOffset -
            max(
                0,
                baseLine.length -
                    newCodeLines[selection.baseIndex].length -
                    whitespaceCountAfterBaseLine));
    final int whitespaceCountAfterExtentLine = max(
        0, _prefixWhitespaceCount(extentLine.text) - selection.extentOffset);
    final int extentOffset = max(
        0,
        selection.extentOffset -
            max(
                0,
                extentLine.length -
                    newCodeLines[selection.extentIndex].length -
                    whitespaceCountAfterExtentLine));
    value = value.copyWith(
        codeLines: newCodeLines,
        selection: selection.copyWith(
          baseOffset: baseOffset,
          extentOffset: extentOffset,
        ));
    makeCursorCenterIfInvisible();
  }

  void _transposeCharacters() {
    if (!selection.isCollapsed) {
      return;
    }
    if (selection.baseIndex == 0 && selection.baseOffset == 0) {
      return;
    }
    if (selection.baseOffset == 0) {
      final CodeLines newCodeLines;
      final int newOffset;
      final CodeLine preLine = codeLines[selection.baseIndex - 1];
      if (baseLine.length == 0) {
        if (preLine.length == 0) {
          return;
        }
        newCodeLines = CodeLines.from(codeLines);
        final String take = preLine.takeLastCharacter(1);
        newCodeLines[selection.baseIndex - 1] =
            preLine.copyWith(text: preLine.skipLastCharacter(1));
        newCodeLines[selection.baseIndex] = baseLine.copyWith(text: take);
        newOffset = take.length;
      } else {
        newCodeLines = CodeLines.from(codeLines);
        newCodeLines[selection.baseIndex - 1] =
            preLine.copyWith(text: preLine.text + baseLine.takeCharacter(1));
        newCodeLines[selection.baseIndex] =
            baseLine.copyWith(text: baseLine.skipCharacter(1));
        newOffset = 0;
      }
      value = value.copyWith(
          codeLines: newCodeLines,
          selection: selection.copyWith(
            baseOffset: newOffset,
            extentOffset: newOffset,
          ));
    } else if (selection.baseOffset == baseLine.length &&
        baseLine.characterLength == 1) {
      if (selection.baseIndex == 0) {
        return;
      }
      final CodeLine preLine = codeLines[selection.baseIndex - 1];
      final CodeLines newCodeLines = CodeLines.from(codeLines);
      newCodeLines[selection.baseIndex - 1] =
          preLine.copyWith(text: preLine.text + baseLine.text);
      newCodeLines[selection.baseIndex] = baseLine.copyWith(text: '');
      value = value.copyWith(
          codeLines: newCodeLines,
          selection: selection.copyWith(
            baseOffset: 0,
            extentOffset: 0,
          ));
    } else if (selection.baseOffset == baseLine.length) {
      final CodeLines newCodeLines = CodeLines.from(codeLines);
      newCodeLines[selection.baseIndex] = baseLine.copyWith(
          text: baseLine.skipLastCharacter(2) +
              baseLine.takeCharacterAtLastIndex(0) +
              baseLine.takeCharacterAtLastIndex(1));
      value = value.copyWith(
        codeLines: newCodeLines,
      );
    } else {
      final CodeLines newCodeLines = CodeLines.from(codeLines);
      final Characters characters = baseLine.text.characters;
      final int index =
          baseLine.text.substring(0, selection.baseOffset).characters.length;
      final String start = characters.take(index - 1).string;
      final String right = characters.elementAt(index);
      final String left = characters.elementAt(index - 1);
      final String end =
          characters.takeLast(characters.length - index - 1).string;
      newCodeLines[selection.baseIndex] =
          baseLine.copyWith(text: start + right + left + end);
      value = value.copyWith(
          codeLines: newCodeLines,
          selection: selection.copyWith(
            baseOffset: selection.baseOffset + right.length,
            extentOffset: selection.extentOffset + right.length,
          ));
    }
  }

  void _replaceRange(String replacement, [CodeLineSelection? range]) {
    range ??= selection;
    if (replacement.isEmpty && range.isCollapsed) {
      return;
    }
    final List<String> replaceCodeLines =
        CodeLineUtils.toTextLines(replacement);
    final CodeLines newCodeLines = codeLines.sublines(0, range.startIndex);
    int index = 0;
    int offset = 0;
    if (replaceCodeLines.length == 1) {
      newCodeLines.add(codeLines[range.endIndex].copyWith(
          text: _codeTextBefore(range.start) +
              replaceCodeLines.first +
              _codeTextAfter(range.end)));
      index = range.startIndex;
      offset = range.startOffset + replaceCodeLines.first.length;
    } else {
      for (int i = 0; i < replaceCodeLines.length; i++) {
        final String replaceCodeLine = replaceCodeLines[i];
        if (i == 0) {
          newCodeLines
              .add(CodeLine(_codeTextBefore(range.start) + replaceCodeLine));
        } else if (i == replaceCodeLines.length - 1) {
          newCodeLines.add(codeLines[range.endIndex]
              .copyWith(text: replaceCodeLine + _codeTextAfter(range.end)));
          index = newCodeLines.length - 1;
          offset = replaceCodeLine.length;
        } else {
          newCodeLines.add(CodeLine(replaceCodeLine));
        }
      }
    }
    if (range.endIndex + 1 < codeLines.length) {
      newCodeLines.addFrom(codeLines, range.endIndex + 1);
    }
    value = CodeLineEditingValue(
        codeLines: newCodeLines,
        selection: CodeLineSelection.collapsed(
            index: index, offset: offset, affinity: range.extentAffinity));
    makeCursorCenterIfInvisible();
  }

  void _replaceAll(Pattern pattern, String replacement) {
    if (pattern is String && pattern.isEmpty) {
      return;
    }
    int extentOffset = selection.extentOffset;
    for (int i = 0; i < selection.extentIndex; i++) {
      extentOffset += codeLines[i].charCount + lineBreak.value.length;
    }
    final String preText = text;
    int delta = 0;
    final String newText = text.replaceAllMapped(pattern, (match) {
      if (match.end <= extentOffset) {
        delta += replacement.length - (match.end - match.start);
      }
      return replacement;
    });
    if (preText == newText) {
      return;
    }
    final CodeLines newCodeLines = CodeLineUtils.toCodeLines(newText);
    int newExtentIndex = 0;
    int newExtentOffset = 0;
    int start = 0;
    extentOffset += delta;
    final int length = newCodeLines.length;
    for (int i = 0; i < length; i++) {
      final int end =
          start + newCodeLines[i].charCount + lineBreak.value.length;
      if (extentOffset >= start && extentOffset < end) {
        newExtentIndex = i;
        newExtentOffset = extentOffset - start;
        break;
      }
      start = end;
    }
    value = CodeLineEditingValue(
        codeLines: newCodeLines,
        selection: CodeLineSelection.collapsed(
            index: newExtentIndex, offset: newExtentOffset));
    makeCursorCenterIfInvisible();
  }

  List<CodeLine> _applyIndents(List<CodeLine> children) {
    if (children.isEmpty) {
      return children;
    }
    final List<CodeLine> newChildren = [];
    for (final CodeLine codeLine in children) {
      newChildren.add(CodeLine(
          _applyTextIndent(codeLine.text), _applyIndents(codeLine.chunks)));
    }
    return newChildren;
  }

  List<CodeLine> _applyOutdents(List<CodeLine> children) {
    if (children.isEmpty) {
      return children;
    }
    final List<CodeLine> newChildren = [];
    for (final CodeLine codeLine in children) {
      newChildren.add(CodeLine(
          _applyTextOutdent(codeLine.text), _applyOutdents(codeLine.chunks)));
    }
    return newChildren;
  }

  String _applyTextIndent(String text) {
    // Indent the mod count of whitespace
    final int mod = _prefixWhitespaceCount(text) % indent.length;
    return ' ' * (mod == 0 ? indent.length : mod) + text;
  }

  String _applyTextOutdent(String text) {
    final int index = _prefixWhitespaceCount(text);
    if (index == 0) {
      return text;
    }
    // Outdent the mod count of whitespace
    final int mod = index % indent.length;
    return text.substring(mod == 0 ? indent.length : mod);
  }

  String _codeTextBefore(CodeLinePosition position) {
    return codeLines[position.index].substring(0, position.offset);
  }

  String _codeTextAfter(CodeLinePosition position) {
    return codeLines[position.index].substring(position.offset);
  }

  CodeLine _codeLineBefore(CodeLinePosition position) {
    return CodeLine(_codeTextBefore(position));
  }

  CodeLine _codeLineAfter(CodeLinePosition position) {
    return CodeLine(_codeTextAfter(position), codeLines[position.index].chunks);
  }

  int _prefixWhitespaceCount(String text) {
    int index = 0;
    for (; index < text.length; index++) {
      if (text.codeUnitAt(index) != _kUnitCodeWhitespace) {
        break;
      }
    }
    return index;
  }

  int _whitespaceCountBefore(String text, int offset) {
    int count = 0;
    for (int i = offset - 1; i >= 0; i--) {
      if (text.codeUnitAt(i) != _kUnitCodeWhitespace) {
        break;
      }
      count++;
    }
    return count;
  }

  bool _isWrapedByClosureSymbol(String text, int offset) {
    if (text.isEmpty) {
      return false;
    }
    if (offset == 0 || offset == text.length) {
      return false;
    }
    return _kClosureAndQuates.contains(text.substring(offset - 1, offset + 1));
  }

  bool _isMultipleIndent(String text) =>
      text.isNotEmpty &&
      text.length % indent.length == 0 &&
      _prefixWhitespaceCount(text) == text.length;

  bool get _selectionInClosure {
    int? forwardUnitCode;
    for (int i = selection.startOffset - 1; i >= 0; i--) {
      final int codeUnit = startLine.codeUnitAt(i);
      if (codeUnit == _kUnitCodeWhitespace) {
        continue;
      }
      forwardUnitCode = codeUnit;
      break;
    }
    if (forwardUnitCode == null) {
      return false;
    }
    int? backwardUnitCode;
    for (int i = selection.endOffset; i < endLine.length; i++) {
      final int codeUnit = endLine.codeUnitAt(i);
      if (codeUnit == _kUnitCodeWhitespace) {
        continue;
      }
      backwardUnitCode = codeUnit;
      break;
    }
    if (backwardUnitCode == null) {
      return false;
    }
    return _kClosures
        .contains(String.fromCharCodes([forwardUnitCode, backwardUnitCode]));
  }

  @override
  void changeAnalysisResult(AnalysisResult result) async {
    analysisResult = result;
    notifyListeners();
  }

  @override
  TextSpan? buildTextSpan(int index, TextStyle baseStyle) {
    return spanBuilder?.call(index, codeLines[index], baseStyle);
  }

  @override
  void scheduleAnalysis() {
    _debounce?.cancel();

    if (_lastAnalyzedText == text) {
      // If the last analyzed code is the same as current code
      // we don't need to analyze it again.
      return;
    }
    _debounce = Timer(const Duration(milliseconds: 5000), () async {
      _timerStream.sink.add(true);
    });
  }

  @override
  StreamController<IntelliData> get intelliSense => _intelliSense;

  @override
  StreamController<IntelliData> get intelliData => _intelliData;

  @override
  StreamController<bool> get reqObjetInfo => _reqObjetInfo;

  List<(String, String)> get objetsInfo => _objetsInfo;

  void set objetsInfo(value) {
    _objetsInfo.clear();
    _objetsInfo = value;
  }

  void _showIntelliSense(IntelliData data) {
    if (null == _editorKey?.currentContext) return;
    final autocompleteState = _editorKey!.currentContext!
        .findAncestorStateOfType<_CodeAutocompleteState>();
    if (autocompleteState == null) {
      return;
    }
    if (isComposing || !selection.isCollapsed) {
      autocompleteState.dismiss();
      return;
    }
    final _CodeFieldRender? render =
        _editorKey!.currentContext!.findRenderObject() as _CodeFieldRender?;
    if (render == null) {
      autocompleteState.dismiss();
      return;
    }
    final Offset? position =
        render.calculateTextPositionScreenOffset(selection.extent, true);
    if (position == null) {
      autocompleteState.dismiss();
      return;
    }

    autocompleteState.show(
        layerLink: _startHandleLayerLink,
        position: position,
        lineHeight: render.lineHeight,
        value: value,
        buildedOutside: true,
        prompts: data,
        onAutocomplete: (value) {
          if (data.type != IntelliType.objet) {
            final line = extentLine.text;
            final word = 'Property(';
            final args = analysisArgs(
                line, line.substring(line.indexOf(word) + word.length));

            var start = 0, end = 0;
            if (data.type == IntelliType.property) {
              start = args[0].$1;
              end = args[0].$2;
            } else {
              final pos = null == data.styleName ? 0 : 1;
              start = args[pos].$1;
              end = args[pos].$2;
            }
            //final ctrl = args
            final range = CodeLineSelection(
                baseIndex: selection.baseIndex,
                extentIndex: selection.extentIndex,
                baseOffset: start,
                extentOffset: end);
            if (null == data.styleName &&
                args.length == 2 &&
                args[1].$1 != args[1].$2) {
              final propName = range.copyWith(
                  baseOffset: args[1].$1, extentOffset: args[1].$2);
              replaceSelection('propName', propName);
            }
            replaceSelection('\'$value\'', range);
          } else {
            replaceSelection(value);
          }
        });
  }

  // List<(int, int)> checkArgs(String line) {
  //   const keyword = 'Property(';
  //   var args = line.substring(line.indexOf(keyword)+keyword.length);
  //   args = args.substring(0, args.indexOf(')'));
  //   final result = <(int, int)>[];
  //   args.split(',').forEach((arg) {
  //     final tmp = arg.trim();
  //     result.add((line.indexOf(tmp), tmp.length));
  //   });
  //   return result;
  // }

  // String? findStyleName(String line) {
  //   var styleName = line.substring(0, selection.baseOffset);
  //   final comma = styleName.lastIndexOf(',');
  //   if( -1!=comma ) {
  //     styleName = styleName.substring(0, comma).trimRight();
  //     styleName = styleName.substring(styleName.indexOf('(')+1);
  //     final tmp = (styleName!='styleName') ? styleName : null;
  //     return tmp?.replaceAll("'", '');
  //   }
  //   return null;
  // }

  // int countOfChar(String word, String pattern) {
  //   var count = 0;
  //   var pos = word.indexOf(pattern);
  //   while( -1!=pos ) {
  //     word = word.substring(pos+1);
  //     count++;
  //     pos = word.indexOf(pattern);
  //   }
  //   return count;
  // }

  // bool checkValidPos(String line, bool isProp) {
  //   var bLine = line.substring(0, selection.baseOffset);
  //   var param = bLine.substring(bLine.lastIndexOf('(')+1);
  //   if( isProp ) {
  //     if( -1!=param.indexOf(',') ) {
  //       return false;
  //     }
  //   } else {
  //     final count = countOfChar(param, ',');
  //     if( count==2 ) {
  //       return false;
  //     } else if( count==1 ) {
  //       param = param.substring(param.indexOf('(')+1, param.indexOf(','));
  //       return param!='styleName';
  //     }
  //   }
  //   return true;
  // }

  (int, int) nextArgInfo(int prevArg, String rest) {
    var start = 0;
    var end = 0;
    var argStart = false;
    for (var i = 0; i < rest.length; i++) {
      final ch = rest[i];
      if (!argStart && ch == ' ') {
        start++;
      } else if (ch == ',' || (argStart && ch == ' ')) {
        break;
      } else {
        if (!argStart) {
          argStart = true;
        }
        end++;
      }
    }
    return (prevArg + start + 1, prevArg + end + 1);
  }

  List<(int, int)> analysisArgs(String line, String argStart) {
    final args = argStart.split(',').where((a) => a.isNotEmpty).toList();
    var result = <(int, int)>[];
    var start = argStart.isEmpty ? line.length : line.indexOf(argStart);
    // first not exist -> first arg
    if (args.isEmpty) {
      result.add((start, start));
    } else {
      var commaCount = args.length > 2 ? 2 : args.length;
      var prev = 0;
      for (var i = 0; i < argStart.length; i++) {
        final ch = argStart[i];
        if (ch == ',') {
          commaCount--;
          result.add((start, start + (i - prev)));
          prev = i + 1;
          start += i + 1;
        } else if (ch == ' ') {
          prev++;
          start++;
        }
        if (commaCount == 0 || i == argStart.length - 1) {
          if (-1 == argStart.indexOf(',')) {
            result.add((start, start + (i - prev) + 1));
          } else if (-1 < line.indexOf('etStyleProperty') &&
              result.length == 1) {
            final rest = argStart.substring(prev);
            result.add(nextArgInfo(result.last.$2 + 1, rest));
          }
          break;
        }
      }
    }
    if (args.isNotEmpty &&
        -1 < line.indexOf('etStyleProperty') &&
        result.length == 1) {
      result.add((result[0].$2 + 1, result[0].$2 + 1));
    }
    return result;
  }

  @override
  void showIntelliSense() {
    if (null != _editorKey?.currentContext) {
      final line = value.codeLines[value.selection.baseIndex].text;
      var keyword = '';
      var isFirstArg = true;
      String? styleName;
      var intelliType = IntelliType.objet;
      var noIntelli = false;

      final prop =
          line.contains('.setProperty') || line.contains('.getProperty');
      final styleProp = line.contains('.setStyleProperty') ||
          line.contains('.getStyleProperty');
      if (prop || styleProp) {
        final word = 'Property(';
        final args = analysisArgs(
            line, line.substring(line.indexOf(word) + word.length));

        //if( prop&&args.length==1 || styleProp&&args.length==2 ) {
        final pos = value.selection.baseOffset;
        isFirstArg =
            args[0].$2 == 0 || (args[0].$1 <= pos && args[0].$2 >= pos);
        if (args.length == 2 && args[1].$1 == args[1].$2) {
          isFirstArg = args[1].$2 >= pos;
        }
        var end = -1;
        if (prop) {
          intelliType = IntelliType.property;
          end = line.indexOf('.setProperty');
          end = (-1 == end) ? line.indexOf('.getProperty') : end;
          noIntelli = (args[0].$2 != 0 && args[0].$2 < pos);
        } else if (styleProp) {
          intelliType = IntelliType.styleProperty;
          end = line.indexOf('.setStyleProperty');
          end = (-1 == end) ? line.indexOf('.getStyleProperty') : end;
          noIntelli = (args.last.$2 != 0 && args.last.$2 < pos);
          if (-1 != end && !isFirstArg && !noIntelli) {
            styleName =
                line.substring(args[0].$1, args[0].$2).replaceAll("'", '');
            styleName = styleName == 'styleName' ? null : styleName;
          }
        }
        var start = end - 1;
        if (!line[0].isNumeric) {
          for (; start >= 0; start--) {
            if (!line[start].isValidVariablePart) {
              break;
            }
          }
        }
        keyword = line.characters.getRange(start + 1, end).string;
        //}
      }
      if (styleProp && !isFirstArg && null == styleName || noIntelli) return;
      _intelliSense
          .add(IntelliData(keyword, styleName: styleName, type: intelliType));
    }
  }

  @override
  StreamController get timerStream => _timerStream;

  @override
  set startHandleLayerLink(LayerLink value) => _startHandleLayerLink = value;
}

class _CodeLineEditingCache {
  final CodeLineEditingController controller;
  late _CodeLineEditingCacheNode _node;
  late _CodeLineEditingCacheNode _redoNode;
  late bool _markNewRecord;
  final _trackCount = ValueNotifier<int>(0);
  int _nodeCount = 0;

  _CodeLineEditingCache(this.controller) {
    controller.addListener(_onValueChanged);
    _node = _CodeLineEditingCacheNode(controller.value);
    _markNewRecord = false;
  }

  ValueNotifier<int> get trackCount => _trackCount;
  bool get isCodeChanged => _trackCount.value != 0;
  bool get canUndo => _node.pre != null;
  bool get canRedo => _node.next != null;

  void initialize() {
    _trackCount.value = 0;
  }

  void track() => _trackCount.value++;

  void undo() {
    if (_node.pre != null && !_node.pre!.value.isInitial) {
      _node = _node.pre!;

      if (0 < _trackCount.value) {
        _trackCount.value--;
      } else if (0 == _trackCount.value) {
        _trackCount.value = --_nodeCount;
      }
      controller.value = _node.value;
    }
  }

  void redo() {
    if (_node.next != null) {
      _node = _node.next!;

      _trackCount.value++;
      controller.value = _node.value;
    }
  }

  void dispose() {
    controller.removeListener(_onValueChanged);
  }

  void markNewRecord(bool flag) {
    _markNewRecord = flag;
  }

  void _onValueChanged() {
    final equal = _node.value.equals(controller.value);
    //if (equal && _node.pre!.value.isInitial) {
    if (equal) {
      return;
    }
    if (_node.isInitial) {
      _appendNewNode();
      return;
    }
    if (_node.isTail) {
      _appendNewNode();
      return;
    }
    if (_markNewRecord) {
      _markNewRecord = false;
      _appendNewNode();
      return;
    }
    _node.value = controller.value;
  }

  void _appendNewNode() {
    final _CodeLineEditingCacheNode newNode =
        _CodeLineEditingCacheNode(controller.value);
    if (_node.next != null) {
      _node.next!.pre = null;
    }
    if (!_node.isInitial) track();
    _node.next = newNode;
    newNode.pre = _node;
    _node = newNode;
    _nodeCount++;
  }
}

class _CodeLineEditingCacheNode {
  _CodeLineEditingCacheNode? pre;
  _CodeLineEditingCacheNode? next;
  CodeLineEditingValue value;

  _CodeLineEditingCacheNode(this.value);

  bool get isRoot => pre == null;

  bool get isInitial => pre == null && next == null;

  bool get isTail => next == null;
}

extension _StringExtension on String {
  int get indentLength {
    int index = 0;
    for (; index < length; index++) {
      if (codeUnitAt(index) != _kUnitCodeWhitespace) {
        break;
      }
    }
    return index;
  }

  int getOffsetWithoutIndent(String indent) {
    int index = 0;
    while (startsWith(indent, index)) {
      index += indent.length;
    }
    return index;
  }

  String insert(String value, int index) {
    return substring(0, index) + value + substring(index);
  }
}

class _CodeLineEditingControllerDelegate implements CodeLineEditingController {
  late CodeLineEditingController _delegate;
  final List<ui.VoidCallback> _listeners = [];

  CodeLineEditingController get delegate => _delegate;

  set delegate(CodeLineEditingController value) {
    for (final listener in _listeners) {
      value.addListener(listener);
    }
    _delegate = value;
  }

  @override
  void hideIntelliSense() => _delegate.hideIntelliSense();

  @override
  Program? get AST => _delegate.AST;

  @override
  bool get disposed => _delegate.disposed;

  @override
  bool get isSaved => _delegate.isSaved;

  @override
  StreamController get saveController => _delegate.saveController;

  @override
  AnalysisResult get analysisResult => _delegate.analysisResult;

  @override
  set analysisResult(AnalysisResult analysisResult) =>
      _delegate.analysisResult = analysisResult;

  @override
  CodeFindController? get findController => _delegate.findController;

  @override
  set findController(CodeFindController? controller) =>
      _delegate.findController = controller;

  @override
  CodeScrollController? get scrollController => _delegate.scrollController;

  @override
  set scrollController(CodeScrollController? controller) =>
      _delegate.scrollController = controller;

  @override
  CodeLines get codeLines => _delegate.codeLines;

  @override
  set codeLines(CodeLines value) {
    _delegate.codeLines = value;
  }

  @override
  ui.TextRange get composing => _delegate.composing;

  @override
  set composing(ui.TextRange value) {
    _delegate.composing = value;
  }

  @override
  CodeLineSelection get selection => _delegate.selection;

  @override
  set selection(CodeLineSelection value) {
    _delegate.selection = value;
  }

  @override
  String get text => _delegate.text;

  @override
  set text(String value) {
    _delegate.text = value;
  }

  @override
  CodeLineEditingValue get value => _delegate.value;

  @override
  set value(CodeLineEditingValue value) {
    _delegate.value = value;
  }

  @override
  void addListener(ui.VoidCallback listener) {
    if (!_delegate.disposed) {
      _listeners.add(listener);
      _delegate.addListener(listener);
    }
  }

  @override
  void applyIndent() {
    _delegate.applyIndent();
  }

  @override
  void applyNewLine() {
    _delegate.applyNewLine();
  }

  @override
  void applyOutdent() {
    _delegate.applyOutdent();
  }

  @override
  CodeLine get baseLine => _delegate.baseLine;

  @override
  void initializeCache() => _delegate.initializeCache();

  @override
  void bindEditor(GlobalKey<State<StatefulWidget>> key) {
    _delegate.bindEditor(key);
  }

  @override
  TextSpan? buildTextSpan(int index, TextStyle baseStyle) {
    return _delegate.buildTextSpan(index, baseStyle);
  }

  @override
  bool get canRedo => _delegate.canRedo;

  @override
  bool get canUndo => _delegate.canUndo;

  @override
  void cancelSelection() {
    _delegate.cancelSelection();
  }

  @override
  void clearComposing() {
    _delegate.clearComposing();
  }

  @override
  void collapseChunk(int index, int end) {
    _delegate.collapseChunk(index, end);
  }

  @override
  Future<void> copy() => _delegate.copy();

  @override
  void cut() {
    _delegate.cut();
  }

  @override
  void deleteAllBefore() {
    _delegate.deleteAllBefore();
  }

  @override
  void deleteBackward() {
    _delegate.deleteBackward();
  }

  @override
  void deleteForward() {
    _delegate.deleteForward();
  }

  @override
  void deleteSelection() {
    _delegate.deleteSelection();
  }

  @override
  void deleteSelectionLines([bool keepExtentOffset = true]) {
    _delegate.deleteSelectionLines(keepExtentOffset);
  }

  @override
  void dispose() {
    //_delegate.dispose();
  }

  @override
  void edit(TextEditingValue newValue) {
    _delegate.edit(newValue);
  }

  @override
  CodeLine get endLine => _delegate.endLine;

  @override
  void expandChunk(int index) {
    _delegate.expandChunk(index);
  }

  @override
  void extendSelection(AxisDirection direction) {
    _delegate.extendSelection(direction);
  }

  @override
  void extendSelectionToLineEnd() {
    _delegate.extendSelectionToLineEnd();
  }

  @override
  void extendSelectionToLineStart() {
    _delegate.extendSelectionToLineStart();
  }

  @override
  void extendSelectionToWordBackward() {
    _delegate.extendSelectionToWordBackward();
  }

  @override
  void extendSelectionToWordForward() {
    _delegate.extendSelectionToWordForward();
  }

  @override
  void extendSelectionToPageEnd() {
    _delegate.extendSelectionToPageEnd();
  }

  @override
  void extendSelectionToPageStart() {
    _delegate.extendSelectionToPageStart();
  }

  @override
  CodeLine get extentLine => _delegate.extentLine;

  @override
  bool get hasListeners => _delegate.hasListeners;

  @override
  int index2lineIndex(int index) {
    return _delegate.index2lineIndex(index);
  }

  @override
  bool get isAllSelected => _delegate.isAllSelected;

  @override
  bool get isComposing => _delegate.isComposing;

  @override
  bool get isEmpty => _delegate.isEmpty;

  @override
  int get lineCount => _delegate.lineCount;

  @override
  CodeLineIndex lineIndex2Index(int lineIndex) {
    return _delegate.lineIndex2Index(lineIndex);
  }

  @override
  void makeCursorCenterIfInvisible() {
    _delegate.makeCursorCenterIfInvisible();
  }

  @override
  void makeCursorVisible() {
    _delegate.makeCursorVisible();
  }

  @override
  void makePositionCenterIfInvisible(CodeLinePosition position) {
    _delegate.makePositionCenterIfInvisible(position);
  }

  @override
  void makePositionVisible(CodeLinePosition position) {
    _delegate.makePositionVisible(position);
  }

  @override
  void moveCursor(AxisDirection direction) {
    _delegate.moveCursor(direction);
  }

  @override
  void moveCursorToLineEnd() {
    _delegate.moveCursorToLineEnd();
  }

  @override
  void moveCursorToLineStart() {
    _delegate.moveCursorToLineStart();
  }

  @override
  void moveCursorToPageDown() {
    _delegate.moveCursorToPageDown();
  }

  @override
  void moveCursorToPageEnd() {
    _delegate.moveCursorToPageEnd();
  }

  @override
  void moveCursorToPageStart() {
    _delegate.moveCursorToPageStart();
  }

  @override
  void moveCursorToPageUp() {
    _delegate.moveCursorToPageUp();
  }

  @override
  void moveCursorToWordBoundaryBackward() {
    _delegate.moveCursorToWordBoundaryBackward();
  }

  @override
  void moveCursorToWordBoundaryForward() {
    _delegate.moveCursorToWordBoundaryForward();
  }

  @override
  void moveSelectionLinesDown() {
    _delegate.moveSelectionLinesDown();
  }

  @override
  void moveSelectionLinesUp() {
    _delegate.moveSelectionLinesUp();
  }

  @override
  void notifyListeners() {
    _delegate.notifyListeners();
  }

  @override
  CodeLineOptions get options => _delegate.options;

  @override
  void paste() {
    _delegate.paste();
  }

  @override
  CodeLineEditingValue? get preValue => _delegate.preValue;

  @override
  CodeLineSelection get unforldLineSelection => _delegate.unforldLineSelection;

  @override
  void redo() {
    _delegate.redo();
  }

  @override
  void removeListener(ui.VoidCallback listener) {
    _listeners.remove(listener);
    _delegate.removeListener(listener);
  }

  @override
  void replaceAll(Pattern pattern, String replacement) {
    _delegate.replaceAll(pattern, replacement);
  }

  @override
  void replaceSelection(String replacement, [CodeLineSelection? selection]) {
    _delegate.replaceSelection(replacement, selection);
  }

  @override
  void runRevocableOp(ui.VoidCallback op) {
    _delegate.runRevocableOp(op);
  }

  @override
  void selectAll() {
    _delegate.selectAll();
  }

  @override
  void selectLine(int index) {
    _delegate.selectLine(index);
  }

  @override
  void selectLines(int base, int extent) {
    _delegate.selectLines(base, extent);
  }

  @override
  String get selectedText => _delegate.selectedText;

  @override
  CodeLine get startLine => _delegate.startLine;

  @override
  set textAsync(String value) {
    _delegate.textAsync = value;
  }

  @override
  void transposeCharacters() {
    _delegate.transposeCharacters();
  }

  @override
  void undo() {
    _delegate.undo();
  }

  @override
  ui.VoidCallback? codeChangedCallback;

  @override
  FocusNode? focusNode;

  @override
  void changeAnalysisResult(AnalysisResult result) {
    _delegate.changeAnalysisResult(result);
  }

  @override
  bool get isCodeChanged => _delegate.isCodeChanged;

  @override
  _CodeFieldRender get render => _delegate.render;

  @override
  void scheduleAnalysis() {
    _delegate.scheduleAnalysis();
  }

  @override
  StreamController<IntelliData> get intelliSense => _delegate.intelliSense;

  @override
  StreamController<IntelliData> get intelliData => _delegate.intelliData;

  @override
  StreamController<bool> get reqObjetInfo => _delegate.reqObjetInfo;

  @override
  List<(String, String)> get objetsInfo => _delegate.objetsInfo;

  @override
  void set objetsInfo(value) => _delegate.objetsInfo = objetsInfo;

  @override
  void showIntelliSense() => _delegate.showIntelliSense();

  @override
  StreamController get timerStream => _delegate.timerStream;

  @override
  set startHandleLayerLink(LayerLink value) =>
      _delegate.startHandleLayerLink = value;

  @override
  set intelliSenseCallback(IntelliSenseCallback? callback) {}

  @override
  set reqObjetInfoCallback(ui.VoidCallback? callback) {}

  @override
  set saveCallback(ui.VoidCallback? callback) {}
}
