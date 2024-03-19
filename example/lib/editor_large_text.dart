import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucy_editor/lucy_editor.dart';
import 'package:re_editor_exmaple/find.dart';
import 'package:re_editor_exmaple/menu.dart';

class LargeTextEditor extends StatefulWidget {

  const LargeTextEditor();

  @override
  State<StatefulWidget> createState() => _LargeTextEditorState();

}

class _LargeTextEditorState extends State<LargeTextEditor> {

  final CodeLineEditingController _controller = CodeLineEditingController();

  @override
  void initState() {
    rootBundle.loadString('assets/large.txt').then((value) {
      _controller.text = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CodeEditor(
      controller: _controller,
      wordWrap: false,
      indicatorBuilder: (context, editingController, chunkController, notifier) {
        return Row(
          children: [
            DefaultCodeLineNumber(
              controller: editingController,
              notifier: notifier,
            ),
            DefaultCodeChunkIndicator(
              width: 20,
              controller: chunkController,
              notifier: notifier
            )
          ],
        );
      },
      findBuilder: (context, controller, readOnly) => CodeFindPanelView(controller: controller, readOnly: readOnly),
      toolbarController: const ContextMenuControllerImpl(),
      sperator: Container(
        width: 1,
        color: Colors.blue
      ),
    );
  }

}