import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucy_editor/lucy_editor.dart';
import './find.dart';
import './menu.dart';
import 'package:lucy_editor/languages/javascript.dart';
import 'package:lucy_editor/styles/atom-one-light.dart';
import 'package:lucy_editor/styles/atom-one-dark.dart';

class JsEditor extends StatefulWidget {

  const JsEditor();

  @override
  State<StatefulWidget> createState() => _JsEditorState();

}

class _JsEditorState extends State<JsEditor> {

  final CodeLineEditingController _controller = CodeLineEditingController();

  @override
  void initState() {
    rootBundle.loadString('assets/code.js').then((value) {
      _controller.text = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CodeEditor(
      style: CodeEditorStyle(
        codeTheme: CodeHighlightTheme(
            languages: {
              'javascript': CodeHighlightThemeMode(
                  mode: langJavascript
              )
            },
            theme: atomOneLightTheme
        ),
      ),
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
      // sperator: Container(
      //     width: 0,
      //     color: Colors.blue
      // ),
    );
  }

}