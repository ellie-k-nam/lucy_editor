part of re_editor;

const int _kDefaultMinNumberCount = 3;
const Size _kDefaultChunkIndicatorSize = Size(7, 7);

typedef CodeIndicatorValueNotifier = ValueNotifier<CodeIndicatorValue?>;
typedef CodeIndicatorBuilder = Widget Function(
  BuildContext context,
  CodeLineEditingController editingController,
  CodeChunkController chunkController,
  CodeIndicatorValueNotifier notifier,
);

class CodeIndicatorValue {

  final List<CodeLineRenderParagraph> paragraphs;
  final int focusedIndex;

  CodeIndicatorValue({
    required this.paragraphs,
    this.focusedIndex = -1,
  });

  @override
  int get hashCode => Object.hashAll([paragraphs, focusedIndex]);

  @override
  bool operator ==(Object other) {
    if (other is! CodeIndicatorValue) {
      return false;
    }
    return listEquals(other.paragraphs, paragraphs) &&
        other.focusedIndex == focusedIndex;
  }

  CodeIndicatorValue copyWith({
    List<CodeLineRenderParagraph>? paragraphs,
    int? focusedIndex,
  }) {
    return CodeIndicatorValue(
      paragraphs: paragraphs ?? this.paragraphs,
      focusedIndex: focusedIndex ?? this.focusedIndex,
    );
  }

}

class DefaultCodeLineNumber extends LeafRenderObjectWidget {

  final CodeLineEditingController controller;
  final CodeIndicatorValueNotifier notifier;
  final TextStyle? textStyle;
  final TextStyle? focusedTextStyle;
  final int? minNumberCount;

  const DefaultCodeLineNumber({
    super.key,
    required this.notifier,
    required this.controller,
    this.textStyle,
    this.focusedTextStyle,
    this.minNumberCount,
  });

  @override
  RenderObject createRenderObject(BuildContext context) => CodeLineNumberRenderObject(
    controller: controller,
    notifier: notifier,
    textStyle: textStyle ?? _useCodeTextStyle(context, false),
    focusedTextStyle: focusedTextStyle ?? _useCodeTextStyle(context, true),
    minNumberCount: minNumberCount ?? _kDefaultMinNumberCount,
  );

  @override
  void updateRenderObject(BuildContext context, covariant CodeLineNumberRenderObject renderObject) {
    renderObject
      ..controller = controller
      ..notifier = notifier
      ..textStyle = textStyle ?? _useCodeTextStyle(context, false)
      ..focusedTextStyle = focusedTextStyle ?? _useCodeTextStyle(context, true)
      ..minNumberCount = minNumberCount ?? _kDefaultMinNumberCount;
    super.updateRenderObject(context, renderObject);
  }

  TextStyle _useCodeTextStyle(BuildContext context, bool focused) {
    final _CodeEditable? editor = context.findAncestorWidgetOfExactType<_CodeEditable>();
    assert(editor != null);
    return editor!.textStyle.copyWith(
      color: focused ? null :  editor.textStyle.color?.withAlpha(128)
    );
  }

}

class DefaultCodeChunkIndicator extends LeafRenderObjectWidget {

  final double width;
  final CodeChunkController controller;
  final CodeIndicatorValueNotifier notifier;
  final CodeChunkIndicatorPainter? painter;
  final bool collapseIndicatorVisible;
  final bool expandIndicatorVisible;

  const DefaultCodeChunkIndicator({
    super.key,
    required this.width,
    required this.controller,
    required this.notifier,
    this.painter,
    this.collapseIndicatorVisible = true,
    this.expandIndicatorVisible = true,
  });

  @override
  RenderObject createRenderObject(BuildContext context) => CodeChunkIndicatorRenderObject(
    width: width,
    controller: controller,
    notifier: notifier,
    painter: painter ?? DefaultCodeChunkIndicatorPainter(
      color: _useCodeTextColor(context),
    ),
    collapseIndicatorVisible: collapseIndicatorVisible,
    expandIndicatorVisible: expandIndicatorVisible,
  );

  @override
  void updateRenderObject(BuildContext context, covariant CodeChunkIndicatorRenderObject renderObject) {
    renderObject
      ..width = width
      ..controller = controller
      ..notifier = notifier
      ..painter = painter ?? DefaultCodeChunkIndicatorPainter(
        color: _useCodeTextColor(context),
      )
      ..collapseIndicatorVisible = collapseIndicatorVisible
      ..expandIndicatorVisible = expandIndicatorVisible;
    super.updateRenderObject(context, renderObject);
  }

  Color? _useCodeTextColor(BuildContext context) {
    final _CodeEditable? editor = context.findAncestorWidgetOfExactType<_CodeEditable>();
    assert(editor != null);
    return editor!.textStyle.color?.withAlpha(128);
  }

}

abstract class CodeChunkIndicatorPainter {

  void paintCollapseIndicator(Canvas canvas, Size container);

  void paintExpandIndicator(Canvas canvas, Size container);

}

class DefaultCodeChunkIndicatorPainter implements CodeChunkIndicatorPainter {

  final Color? color;
  final Size size;

  late final Paint _paint;

  DefaultCodeChunkIndicatorPainter({
    this.color,
    this.size = _kDefaultChunkIndicatorSize
  }) {
    _paint = Paint();
    if (color != null) {
      _paint.color = color!;
    }
  }

  @override
  void paintCollapseIndicator(Canvas canvas, Size container) {
    if (color == null || color == Colors.transparent || container.isEmpty) {
      return;
    }
    final Path path = Path();
    path.moveTo((container.width - size.width) / 2, (container.height - size.height) / 2);
    path.lineTo((container.width + size.width) / 2, (container.height - size.height) / 2);
    path.lineTo(container.width / 2, (container.height + size.height) / 2);
    path.lineTo((container.width - size.width) / 2, (container.height - size.height) / 2);
    canvas.drawPath(path, _paint);
  }

  @override
  void paintExpandIndicator(Canvas canvas, Size container) {
    if (color == null || color == Colors.transparent || container.isEmpty) {
      return;
    }
    final Path path = Path();
    path.moveTo((container.width - size.width) / 2, (container.height - size.height) / 2);
    path.lineTo((container.width + size.width) / 2, container.height / 2);
    path.lineTo((container.width - size.width) / 2, (container.height + size.height) / 2);
    path.lineTo((container.width - size.width) / 2, (container.height - size.height) / 2);
    canvas.drawPath(path, _paint);
  }

}

class DefaultIssueIndicator extends StatefulWidget {
  final CodeLineEditingController _controller;
  final CodeIndicatorValueNotifier _notifier;
  int _allLineCount;

  DefaultIssueIndicator({super.key,
        required CodeLineEditingController controller,
        required CodeIndicatorValueNotifier notifier,
  }): _controller = controller,
      _notifier = notifier,
      _allLineCount = controller.lineCount;


  @override
  DefaultIssueIndicatorState createState() => DefaultIssueIndicatorState();
}

class DefaultIssueIndicatorState extends State<DefaultIssueIndicator> {
  late ScrollController _scrollController;

  @override
  void initState() {
    widget._controller.addListener(_onCodeLineChanged);
    widget._notifier.addListener(_rebuild);
    _scrollController = widget._controller.scrollController!.getScrollerController();
    super.initState();
  }

  @override
  void dispose() {
    widget._controller.removeListener(_onCodeLineChanged);
    widget._notifier.removeListener(_rebuild);
    super.dispose();
  }

  void _rebuild() => WidgetsBinding.instance.addPostFrameCallback((timeStamp) =>
      setState(() {}));

  void _onCodeLineChanged() {
    widget._allLineCount = widget._controller.lineCount;
    _rebuild();
  }
  @override
  Widget build(BuildContext context) {

    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Builder(
            //animation: widget._controller,
            builder: _buildOnChange,
          ),
        ),
      ),
    );

    // return Scrollbar(
    //   controller: _scrollController,
    //   thumbVisibility: false,
    //   child: SingleChildScrollView(
    //     controller: _scrollController,
    //     scrollDirection: Axis.vertical,
    //     child: SizedBox(
    //       height: MediaQuery.of(context).size.height,
    //       child: Builder(
    //         //animation: widget._controller,
    //         builder: _buildOnChange,
    //       ),
    //     ),
    //   ),
    // );

    // return SingleChildScrollView(
    //   controller: _scrollController,
    //   scrollDirection: Axis.vertical,
    //   child: SizedBox(
    //     height: MediaQuery.of(context).size.height,
    //     child: Builder(
    //       //animation: widget._controller,
    //       builder: _buildOnChange,
    //     ),
    //   ),
    // );
  }

  Widget _buildOnChange(BuildContext context) {

    final CodeIndicatorValue? value = widget._notifier.value;
    if (value == null || value.paragraphs.isEmpty) {
      return const SizedBox.shrink();
    }

    int firstLineIndex = widget._controller.index2lineIndex(value.paragraphs.first.index);
    final tableRows = List.generate(value.paragraphs.length,
      (i) => TableRow(
        children: [
          SizedBox(height: value.paragraphs[i].height),
          // Container(height: value.paragraphs[i].height,
          //   color: Colors.amber,
          //   child: Text(i.toString()),),
        ],
        )
    );

    for (final issue in widget._controller.analysisResult.issues) {
      if (issue.line >= widget._controller.codeLines.length) {
        continue;
      }
      final lineIndex = widget._controller.lineIndex2Index(issue.line).index;
      if( lineIndex >= tableRows.length ) {
        continue;
      }
      final style = TextStyle(
        fontSize: DefaultStyles.errorPopupTextSize,
        backgroundColor: DefaultStyles.backgroundColor,
        fontStyle: DefaultStyles.fontStyle,
      );
      tableRows[lineIndex].children[0] = GutterErrorWidget(
        issue,
        style,
      );
    }

    return AnimatedBuilder(
      animation: widget._controller,
      builder: (BuildContext ctx, Widget? child) {
        return Container(
          padding: const EdgeInsets.only(left: 3, top: 8, bottom: 8),
          width: 16,
          child: Table(
            columnWidths: const {
              0: FixedColumnWidth(16.0),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: tableRows,
          ),
        );
      },
    );

    // return Container(
    //   padding: const EdgeInsets.only(top: 8, bottom: 8),
    //   width: 16,
    //   child: Table(
    //     columnWidths: const {
    //       0: FixedColumnWidth(16.0),
    //     },
    //     defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    //     children: tableRows,
    //   ),
    // );
    //
    // return Container(
    //   width: 16,
    //   padding: const EdgeInsets.only(top: 8, bottom: 8),
    //   height: MediaQuery.of(context).size.height,
    //   child: ListView.builder(
    //       scrollDirection: Axis.vertical,
    //       controller: _scrollController,
    //       itemCount: value.paragraphs.length,
    //       itemBuilder: (context, index) => buildItem(context, index, value)),
    // );
  }

  // Widget buildItem(BuildContext ctx, int idx, CodeIndicatorValue value) {
  //   print('------------- buildItem [ $idx ] -------------');
  //
  //   final codes = widget._controller.codeLines;
  //
  //   final code = codes[idx];
  //
  //
  //   final child = Container(height: value.paragraphs[idx].height,
  //             color: Colors.amber,
  //             child: Text(idx.toString()),);
  //
  //   return Container(
  //     width: 16,
  //     child: child,
  //   );
  // }
}

class DefaultStyles {
  static final backgroundColor = Colors.grey.shade900;
  static final textColor = Colors.grey.shade200;
  static const errorPopupTextSize = 14.0;
  static const fontStyle = FontStyle.normal;
}