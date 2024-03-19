import 'package:flutter/material.dart';
import 'package:lucy_editor/lucy_editor.dart';

class BasicField extends StatelessWidget {

  const BasicField();

  @override
  Widget build(BuildContext context) {
    return CodeEditor(
      wordWrap: false,
      controller: CodeLineEditingController.fromText(('Hello Reqable💐👏 ' * 10 + '\n') * 100),
    );
  }

}