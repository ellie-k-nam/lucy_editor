part of re_editor;

/// Define code autocomplate prompt information.
///
/// See also [CodeKeywordPrompt], [CodeFieldPrompt] and [CodeFunctionPrompt].
abstract class CodePrompt {

  const CodePrompt({
    required this.word
  });

  /// Content associated with user input.
  ///
  /// e.g. User input is 're', the prompt word 'return' will be displayed to user.
  final String word;

  /// Get the final auto completion content. In most cases it is equal to [word], but there are some exceptions.
  /// For example, for functions, auto completion of parameters may be required.
  ///
  /// e.g. User input is 'he', 'hello(String name)' will be auto completed.
  String get autocomplete;

}

/// The keyword autocomplate prompt. such as 'return', 'class', 'new' and so on.
class CodeKeywordPrompt extends CodePrompt {

  const CodeKeywordPrompt({
    required super.word
  });

  @override
  String get autocomplete => word;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is CodeKeywordPrompt && other.word == word;
  }

  @override
  int get hashCode => word.hashCode;

}

/// The field autocomplate prompt. Compared to [CodeKeywordPrompt],
/// type definitions also need to be provided.
///
/// If a line of code is 'String foo;', 'foo' is the word and 'String' is the type.
class CodeFieldPrompt extends CodePrompt {

  const CodeFieldPrompt({
    required super.word,
    required this.type,
  });

  /// The field type name.
  final String type;

  @override
  String get autocomplete => word;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is CodeFieldPrompt && other.word == word && other.type == type;
  }

  @override
  int get hashCode => Object.hash(word, type);

}

/// The function autocomplate prompt.
class CodeFunctionPrompt extends CodePrompt {

  const CodeFunctionPrompt({
    required super.word,
    required this.type,
    this.parameters = const {},
    this.optionalParameters = const {},
  });

  /// The function return type.
  final String type;

  /// The function required parameters.
  final Map<String, String> parameters;

  /// The function optional parameters.
  final Map<String, String> optionalParameters;

  @override
  String get autocomplete => '$word(${parameters.keys.join(', ')})';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is CodeFunctionPrompt && other.word == word && other.type == type &&
      mapEquals(other.parameters, parameters) && mapEquals(other.optionalParameters, optionalParameters);
  }

  @override
  int get hashCode => Object.hash(word, type, parameters, optionalParameters);

}

/// The event handler autocomplate prompt.
class CodeEventPrompt extends CodePrompt {

  CodeEventPrompt({
    required super.word,
    this.args = const [],
  });

  /// The function required arguments.
  final List<String> args;

  @override
  String get autocomplete => '$word(${args.join(', ')})';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is CodeEventPrompt && other.word == word &&
        listEquals(other.args, args);
  }

  @override
  int get hashCode => Object.hash(word, args);
}

class CodeAutocompleteEditingValue {

  const CodeAutocompleteEditingValue({
    required this.word,
    required this.prompts,
    required this.index,
  });

  final String word;

  final List<CodePrompt> prompts;

  final int index;

  CodeAutocompleteEditingValue copyWith({
    String? word,
    List<CodePrompt>? prompts,
    int? index,
  }) {
    return CodeAutocompleteEditingValue(
      word: word ?? this.word,
      prompts: prompts ?? this.prompts,
      index: index ?? this.index,
    );
  }

  String get currentPrompt => prompts[index].autocomplete;

  String get autocomplete => currentPrompt.isEmpty ? currentPrompt : currentPrompt.substring(word.length);

}

typedef CodeAutocompleteWidgetBuilder = PreferredSizeWidget Function(BuildContext context,
  ValueNotifier<CodeAutocompleteEditingValue> notifier, ValueChanged<CodeAutocompleteEditingValue> onSelected);

class CodeAutocomplete extends StatefulWidget {

  final CodeLineEditingController controller;
  final CodeAutocompleteWidgetBuilder builder;
  final Mode language;
  final List<CodeKeywordPrompt> keywordPrompts;
  final List<CodePrompt> directPrompts;
  final Map<String, List<CodePrompt>> releatedPrompts;
  final Widget child;

  const CodeAutocomplete({
    super.key,
    required this.controller,
    required this.builder,
    required this.language,
    this.keywordPrompts = const [],
    this.directPrompts = const [],
    this.releatedPrompts = const {},
    required this.child,
  });

  @override
  State<StatefulWidget> createState() => _CodeAutocompleteState();

}

class _CodeAutocompleteState extends State<CodeAutocomplete> {

  static const string = const ['\'', '"'];
  late final _CodeAutocompleteNavigateAction _navigateAction;
  late final _CodeAutocompleteAction _selectAction;
  late final _CodeAutocompleteAction _selectAction2;


  ValueChanged? _onAutocomplete;
  OverlayEntry? _overlayEntry;
  ValueNotifier<CodeAutocompleteEditingValue>? _notifier;
  final Set<CodePrompt> _allKeyPromptWords = {};

  @override
  void initState() {
    super.initState();
    _initJavascript();
    _navigateAction = _CodeAutocompleteNavigateAction(
      onInvoke: (intent) {
        final CodeAutocompleteEditingValue? value = _notifier?.value;
        if (value == null) {
          return null;
        }
        int newIndex = value.index;
        if (intent.direction == AxisDirection.up) {
          newIndex--;
        } else {
          newIndex++;
        }
        if (newIndex < 0) {
          newIndex = value.prompts.length - 1;
        } else if (newIndex >= value.prompts.length) {
          newIndex = 0;
        }
        _notifier?.value = value.copyWith(
          index: newIndex,
        );
        return intent;
      },
    );
    onInvoke(intent) {
      final CodeAutocompleteEditingValue? value = _notifier?.value;
      if (value == null) {
        return null;
      }
      _onAutocomplete?.call(value.autocomplete);
      return intent;
    }
    _selectAction = _CodeAutocompleteAction<CodeShortcutNewLineIntent>(
      onInvoke: onInvoke);
    _selectAction2 = _CodeAutocompleteAction<CodeShortcutIntelliIntent>(
      onInvoke: onInvoke);
    _buildAllKeyPromptWords();
  }

  void _initJavascript() {

  }

  @override
  void didUpdateWidget(covariant CodeAutocomplete oldWidget) {
    if (oldWidget.language != widget.language || !listEquals(oldWidget.keywordPrompts, widget.keywordPrompts)) {
      _buildAllKeyPromptWords();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Actions(
      actions: {
        CodeShortcutCursorMoveIntent: _navigateAction,
        CodeShortcutNewLineIntent: _selectAction,
        CodeShortcutIntelliIntent: _selectAction2,
      },
      child: widget.child
    );
  }

  void show({
    required LayerLink layerLink,
    required Offset position,
    required double lineHeight,
    required CodeLineEditingValue value,
    required ValueChanged onAutocomplete,
    bool buildedOutside = false,
    IntelliData? prompts = null
  }) {
    dismiss();
    CodeAutocompleteEditingValue? autocompleteEditingValue
              = _buildAutocompleteOptions(value, intelliData: prompts);
    if (autocompleteEditingValue == null) {
      if( !buildedOutside )
        return;
      else {
        autocompleteEditingValue = CodeAutocompleteEditingValue(
            word: '',
            prompts: prompts!.prompts!,
            index: 0
        );
      }
    }
    _notifier = ValueNotifier(autocompleteEditingValue);
    _onAutocomplete = onAutocomplete;
    _overlayEntry = OverlayEntry(
      builder:(context) {
        return _buildWidget(context, layerLink, position, lineHeight);
      },
    );
    Overlay.of(context, rootOverlay: true).insert(_overlayEntry!);
    _navigateAction.setEnabled(true);
    _selectAction.setEnabled(true);
    _selectAction2.setEnabled(true);
  }

  // void showIntelliSense({
  //   required LayerLink layerLink,
  //   required Offset position,
  //   required double lineHeight,
  //   required CodeLineEditingValue value,
  //   required ValueChanged onAutocomplete,
  // }) {
  //
  // }

  void dismiss() {
    _notifier = null;
    _onAutocomplete = null;
    _overlayEntry?.remove();
    _overlayEntry = null;
    _navigateAction.setEnabled(false);
    _selectAction.setEnabled(false);
    _selectAction2.setEnabled(false);
  }

  void _buildAllKeyPromptWords() {
    _allKeyPromptWords.clear();
    _allKeyPromptWords.addAll(widget.keywordPrompts);
    _allKeyPromptWords.addAll(widget.directPrompts);
    final dynamic keywords = widget.language.keywords;
    if (keywords is Map) {
      final dynamic keywordList = keywords['keyword'];
      if (keywordList is List) {
        _allKeyPromptWords.addAll(keywordList.map(
          (keyword) => CodeKeywordPrompt(word: keyword))
        );
      }
      final dynamic builtInList = keywords['built_in'];
      if (builtInList is List) {
        _allKeyPromptWords.addAll(builtInList.map(
          (keyword) => CodeKeywordPrompt(word: keyword))
        );
      }
      final dynamic literalList = keywords['literal'];
      if (literalList is List) {
        _allKeyPromptWords.addAll(literalList.map(
          (keyword) => CodeKeywordPrompt(word: keyword))
        );
      }
      final dynamic typeList = keywords['type'];
      if (typeList is List) {
        _allKeyPromptWords.addAll(typeList.map(
          (keyword) => CodeKeywordPrompt(word: keyword))
        );
      }
    }
  }

  String? getTarget(CodeLineEditingValue value) {
    final text = value.codeLines[value.selection.extentIndex].text;
    final charsBefore = text.substring(0, value.selection.extentOffset).characters;
    if( charsBefore.isEmpty ) {
      return null;
    }
    final charsAfter = text.substring(value.selection.extentOffset).characters;
    if( charsBefore.containsSymbols(string) && charsAfter.containsSymbols(string) ) {
      return null;
    }
    final cut = charsBefore.takeLast(1).string=='.' ? 2 : 1;
    var start = charsBefore.length - cut;
    int checkDot(int start) {
      while( start-- >= 0 ) {
        if( !charsBefore.elementAt(start).isValidVariablePart ) {
          break;
        }
      }
      return start;
    }
    start = checkDot(start);
    var target = charsBefore.getRange(start + 1, charsBefore.length - (cut-1)).string;
    if( null==target ) {
      return null;
    }
    final Iterable<CodePrompt> prompts;
    // *
    if( start>0 && charsBefore.elementAt(start)=='.' ) {
      final mark = start;
      start = checkDot(--start);
      target = charsBefore.getRange(start+1, mark).string;
    }

  }

  Scope? findScope(ScopeArea scopeArea, int line) {
    Scope? scope;
    for (final area in scopeArea.children) {
      if (area.scope.line <= line && area.scope.endLine > line) {
        scope = area.scope;
        break;
      }
      if( area.children.length>0 ) {
        scope = findScope(area, line);
        if( null!=scope )
          break;
      }
    }
    return scope;
  }

  Scope? findParent(Node scope) {
    if( null!=scope.parent ) {
      if( scope.parent is Scope ) {
        return scope.parent as Scope;
      } else {
        return findParent(scope.parent!);
      }
    }
    return null;
  }

  void buildJsCodePrompt(Scope scope, List<CodePrompt> keywordPrompt) {
    final envs = scope.environment.toList();
    if( envs.contains('arguments') ) {
      envs.remove('arguments');
    }
    for( var i=0; i<envs.length; i++ ) {
      final keyword = envs[i];
      final node = scope.variables.elementAt(i).$2;
      if( node is FunctionNode ) {
        final params = Map<String, String>.fromIterable(node.params,
            key: (param) => param.value,
            value: (param) => param.value);

        keywordPrompt.add(CodeFunctionPrompt(word: keyword, type: '', parameters: params));
      } else {
        keywordPrompt.add(CodeFieldPrompt(word: keyword, type: ''));
      }
    }

    if( null!=scope.parent ) {
      final parentScope = findParent(scope);
      if( null!=parentScope )
        buildJsCodePrompt(parentScope, keywordPrompt);
    }
  }

  void buildJsPropertyPrompt(Scope scope, List<CodePrompt> keywordPrompt, String? word) {
    final target = scope.variables.toList().firstWhereOrNull((el) => el.$1 == word);

    if( null==target && null!=scope.parent ) {
      final parentScope = findParent(scope);
      if( null!=parentScope )
        buildJsPropertyPrompt(parentScope, keywordPrompt, word);
    } else {
      var node = target?.$2;
      if( node is VariableDeclarator ) {
        node = node as VariableDeclarator;
        if (null != node && node.init is ObjectExpression) {
          final init = node.init as ObjectExpression;
          init?.properties.forEach((prop) {
            if( prop is SpreadElement ) {
              buildJsPropertyPrompt(scope, keywordPrompt, (prop as SpreadElement).argument.value);
            }
            else if( (prop.key is Name) && (prop.key as Name).value=='__proto__' ) {
               buildJsPropertyPrompt(scope, keywordPrompt, (prop.value as NameExpression ).name.value);
            }
            else if (prop.value is FunctionExpression) {
              final fNode = (prop.value as FunctionExpression).function;
              final params = Map<String, String>.fromIterable(fNode.params,
                  key: (param) => param.value,
                  value: (param) => param.value);
              keywordPrompt.add(CodeFunctionPrompt(word: prop.nameString, type: '', parameters: params));
            }
            else if (prop.value is LiteralExpression) {
              if( prop.key is BinaryExpression ) {
                final propName = getProperyName(scope, prop.key as BinaryExpression);
                keywordPrompt.add(
                    CodeFieldPrompt(word: propName, type: ''));
              } else {
                keywordPrompt.add(
                    CodeFieldPrompt(word: prop.nameString, type: ''));
              }
            }
          });
        }
      }
    }
  }

  String getProperyName(Scope scope, BinaryExpression expr) {
    String getProp(Expression ex) {
      if( ex is NameExpression ) {
        return findValue(scope, ex.name.value);
      } else {
        return (ex as LiteralExpression).value.toString();
      }
      return '';
    }
    return getProp(expr.left).trim() + getProp(expr.right).trim();
  }

  String findValue(Scope scope, String name) {
    final target = scope.variables.toList().firstWhereOrNull((el) => el.$1 == name);
    if( null==target && null!=scope.parent ) {
      final parentScope = findParent(scope);
      if( null!=parentScope )
        findValue(parentScope, name);
    }
    final expr = (target?.$2 as VariableDeclarator).init as LiteralExpression;
    return expr.value.toString();
  }

  List<CodePrompt> makeJsCodePrompt(Program? ast, int line, {String? word, bool isProperties=false}) {
    final keywordPrompt = <CodePrompt>[];

    if (null == ast?.scopeArea)
      return keywordPrompt;
    ScopeArea scopeArea = ast!.scopeArea!;
    if( isProperties ) {
      buildJsPropertyPrompt(
          findScope(scopeArea, line) ?? ast, keywordPrompt, word);
    }
    else {
      buildJsCodePrompt(findScope(scopeArea, line) ?? ast, keywordPrompt);
      widget.controller.objetsInfo.forEach((obj) => keywordPrompt.add(CodeKeywordPrompt(word: obj.$1)));
    }

    return keywordPrompt;
  }

  List<CodePrompt> makeThisCodePrompt(ScopeArea scopeArea, int line) {
    final thisIs = <CodePrompt>[];
    final scope = findScope(scopeArea, line);
    ((null!=scope) ? scope : (scopeArea.scope as Scope))
        .environment.forEach((v) => thisIs.add(CodeKeywordPrompt(word: v)));
    return thisIs;
  }

  String  findThisObject(ScopeArea scopeArea, int line) {
    var result = '';
    var funLine = -1;
    final scope = findScope(scopeArea, line);

    Type? lookupParent(Node expr, {bool? funType}) {
      if( expr is VariableDeclaration ) {
        return ObjectExpression;
      } else if( expr is Program ) {
        return (null==funType) ? null :
                funType ? FunctionDeclaration : FunctionExpression;
      } else if( null==expr.parent ) {
        return null;
      }
      return lookupParent(expr.parent!, funType: funType);
    }

    if( null!=scope ) {
      bool? funType;
      if( scope is FunctionNode ) {
        funType = scope.parent is FunctionDeclaration;
      }
      final type = lookupParent(scope!, funType: funType);
      if( type==ObjectExpression ) {
        var parent = scope!.parent as Node;
        while( parent is! VariableDeclaration ) {
          parent = parent.parent as Node;
        }
        result = parent.declarations.first.name.value;
      }
    }

    return result;
  }

  CodeAutocompleteEditingValue? _buildAutocompleteOptions(
      CodeLineEditingValue value,
      {IntelliData? intelliData}) {

    final String text = value.codeLines[value.selection.extentIndex].text;
    final Characters charactersBefore = text.substring(0, value.selection.extentOffset).characters;
    if (charactersBefore.isEmpty) {
      return null;
    }
    final Characters charactersAfter = text.substring(value.selection.extentOffset).characters;
    // FIXME：Check whether the position is inside a string
    if (charactersBefore.containsSymbols(const ['\'', '"']) && charactersAfter.containsSymbols(const ['\'', '"'])) {
      return null;
    }
    // TODO Should check operator `->` for some languages like c/c++
    final prompts = <CodePrompt>[];
    var word = '';

    final ast = (widget.child as CodeEditor).controller.AST;
    //final vars = ast?.variables.toList();
    if( null!=intelliData && null!=intelliData.prompts) {
      prompts.addAll(intelliData.prompts!);
      if( intelliData.type==IntelliType.objet ) {
        widget.releatedPrompts[intelliData.name] = intelliData.prompts!;
      }
    } else if (null==intelliData && charactersBefore.takeLast(1).string == '.') {
      word = '';
      int start = charactersBefore.length - 2;
      if( !charactersBefore.elementAt(0).isNumeric ) {
        for (; start >= 0; start--) {
          if (!charactersBefore
              .elementAt(start)
              .isValidVariablePart) {
            break;
          }
        }
      }
      final String target = charactersBefore.getRange(start + 1, charactersBefore.length - 1).string;

      var propertyPrompt = <CodePrompt>[];
      if( target=='this' ) {
        final thisResult = findThisObject(ast!.scopeArea!, value.selection.baseIndex);
        if( thisResult.isEmpty ) {
          propertyPrompt = makeThisCodePrompt(ast!.scopeArea!, value.selection.baseIndex);
        } else {
          buildJsPropertyPrompt(ast!, propertyPrompt, thisResult);
        }
      }
      else {
        propertyPrompt = makeJsCodePrompt(
                          ast, value.selection.baseIndex + 1, word: target,
                          isProperties: true);
      }
      if( propertyPrompt.isNotEmpty ) {
        widget.releatedPrompts[target] = propertyPrompt;
      }

      if( target.isNotEmpty ) {
        prompts.addAll(widget.releatedPrompts[target] ?? const []);
      }

      /* find properties(or method) of object */
      if( prompts.isEmpty && null==intelliData && target.isNotEmpty ) {
        widget.controller.intelliSense.add(IntelliData(target));
      }
    } else {
      int start = charactersBefore.length - 1;
      for (; start >= 0; start--) {
        if (!charactersBefore.elementAt(start).isValidVariablePart) {
          break;
        }
      }
      word = charactersBefore.getRange(start + 1, charactersBefore.length).string;
      if (word.isEmpty) {
        return null;
      }

      if (start > 0 && charactersBefore.elementAt(start) == '.') {
        final int mark = start;
        for (start = start - 1; start >= 0; start--) {
          if (!charactersBefore.elementAt(start).isValidVariablePart) {
            break;
          }
        }
        final String target = charactersBefore.getRange(start + 1, mark).string;
        prompts.addAll(widget.releatedPrompts[target]?.where(
          (prompt) => prompt.word.startsWith(word) && prompt.word != word
        ).toList() ?? const []);
      } else {
        var keywordPrompt = makeJsCodePrompt(ast, value.selection.baseIndex + 1, word: word);
        final temp = _allKeyPromptWords.toList();
        keywordPrompt =[...keywordPrompt,...temp];
        prompts.addAll(keywordPrompt.where(
          (prompt) => prompt.word.startsWith(word) && prompt.word != word
        ).toList() ?? const []);
      }
    }

    if (prompts.isEmpty) {
      return null;
    }
    return CodeAutocompleteEditingValue(
      word: word,
      prompts: prompts.toList(),
      index: 0
    );
  }

  Widget _buildWidget(BuildContext context, LayerLink layerLink, Offset position, double lineHeight) {
    final PreferredSizeWidget child = widget.builder(context, _notifier!, (value) {
      _onAutocomplete?.call(value.autocomplete);
    });
    final Size screenSize =  MediaQuery.of(context).size;
    final double offsetX;
    if (position.dx + child.preferredSize.width > screenSize.width) {
      offsetX = screenSize.width - (position.dx + child.preferredSize.width);
    } else {
      offsetX = 0;
    }
    final double offsetY;
    if (position.dy + child.preferredSize.height > screenSize.height) {
      offsetY = -child.preferredSize.height - lineHeight;
    } else {
      offsetY = 0;
    }
    return CompositedTransformFollower(
      link: layerLink,
      showWhenUnlinked: false,
      offset: Offset(offsetX, offsetY),
      child: Align(
        alignment: Alignment.topLeft,
        child: Material(
          color: Colors.transparent,
          child: TapRegion(
            onTapOutside: (event) {
              dismiss();
            },
            child: _CodeEditorTapRegion(
              child: ExcludeSemantics(
                child: child,
              )
            )
          ),
        )
      ),
    );
  }

}

class _CodeAutocompleteAction<T extends Intent> extends CallbackAction<T> {

  bool _isEnabled = false;

  _CodeAutocompleteAction({
    required super.onInvoke
  });

  void setEnabled(bool enabled) {
    _isEnabled = enabled;
  }

  @override
  bool get isActionEnabled => _isEnabled;

}

class _CodeAutocompleteNavigateAction extends _CodeAutocompleteAction<CodeShortcutCursorMoveIntent> {

  _CodeAutocompleteNavigateAction({
    required super.onInvoke
  });

  @override
  bool consumesKey(CodeShortcutCursorMoveIntent intent) {
    return intent.direction == AxisDirection.up || intent.direction == AxisDirection.down;
  }

}

extension _CodeAutocompleteStringExtension on String {

  bool get isValidVariablePart {
    final int char = codeUnits.first;
    return (char >= 65 && char <= 90) || (char >= 97 && char <= 122) ||
           (char >= 48 && char <= 57) || (char == 95 || char == 36);
  }

  bool get isNumeric {
    final int char = codeUnits.first;
    return ( char >= 48 && char <= 57 );
  }

}

extension _CodeAutocompleteCharactersExtension on Characters {

  bool containsSymbols(List<String> symbols) {
    for (int i = length - 1; i >= 0; i--) {
      if (symbols.contains(elementAt(i))) {
        return true;
      }
    }
    return false;
  }

}