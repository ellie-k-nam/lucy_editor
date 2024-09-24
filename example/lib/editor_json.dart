import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucy_editor/lucy_editor.dart';
import 'package:lucy_editor/styles/a11y-dark.dart';
import 'package:lucy_editor/styles/atom-one-dark-reasonable.dart';
import 'package:lucy_editor/styles/atom-one-dark.dart';
import './find.dart';
import './menu.dart';
import 'package:lucy_editor/languages/json.dart';
import 'package:lucy_editor/styles/atom-one-light.dart';

class JsonEditor extends StatefulWidget {

  const JsonEditor();

  @override
  State<StatefulWidget> createState() => _JsonEditorState();

}

class _JsonEditorState extends State<JsonEditor> {

  final CodeLineEditingController _controller = CodeLineEditingController();

  @override
  void initState() {
    rootBundle.loadString('assets/code.json').then((value) {
      _controller.text = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final color = 0xff343232;
    return CodeEditor(
      style: CodeEditorStyle(
        codeTheme: CodeHighlightTheme(
          languages: {
            'json': CodeHighlightThemeMode(
              mode: langJson
            )
          },
          theme: a11YDarkTheme,//atomOneDarkTheme

        ),
        backgroundColor: Color(color),
        //textColor: Colors.amber,
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
      sperator: Container(
        width: 1,
        color: Colors.blue
      ),
    );
  }

}