import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import './editor_autocomplete.dart';
import './editor_basic_field.dart';
import './editor_json.dart';
import './editor_large_text.dart';

import 'editor_javascript.dart';

void main() {
  const html = '''
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>AccountBizEx</TITLE>
<META http-equiv=content-type content="text/html; charset=euc-kr">
<META content="MSHTML 6.00.2900.3243" name=GENERATOR>

</HEAD>

<P><B><font size="4" face="Arial Black">AccountBizEx</font></B></P>
<P><a href="../Control_List.htm"><img src="../List.jpg" width="100" height="21" border="0"></a></P>
<HR color=#cccccc>
<p><img src="AccountBizEx_Main.jpg" border="0"></p>
<HR color=#cccccc>
<p><img src="AccountBizEx_01.jpg" border="0"></p>
<p><span style="font-size:10pt;">- 외곽선 : 차세대 확장계좌컨트롤의 외곽선 모양을 설정.</span></p>
<p><span style="font-size:10pt;">- 계좌입력 : 콤보 8, 계좌레이블, 계좌명 설정.</span></p>
<p><img src="AccountBizEx_01_01.jpg" width="193" height="20" border="0"></p>
<p><span style="font-size:10pt;">- 계좌입력 : 콤보 8-2, 계좌레이블, 계좌명 설정.</span></p>
<p><img src="AccountBizEx_01_02.jpg" width="211" height="20" border="0"></p>
<p><span style="font-size:10pt;">- 계좌비밀번호 : 비밀번호를 설정 합니다.</span></p>
<p><span style="font-size:10pt;">- 외부장치 : 외부장치를 설정 합니다. ( Device )</span></p>
<HR color=#cccccc>
<p><img src="AccountBizEx_02.jpg" border="0"></p>
<p><span style="font-size:10pt;">- 필수입력 : </span><SPAN style="FONT-SIZE: 10pt">전송데이터필드가 연결되어 있고, 필수입력을 체크한 상태이면 </SPAN><span style="font-size:10pt;">차세대 확장계좌컨트롤</span><SPAN style="FONT-SIZE: 10pt">에 데이터가 없을시 서비스가 발생하지 않으며,</SPAN></p>

<P><SPAN style="FONT-SIZE: 10pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;설정한 메시지가 하단메시지바에 출력된 후, 포커스가 </SPAN><span style="font-size:10pt;">차세대 확장계좌컨트롤</span><SPAN style="FONT-SIZE: 10pt">로 자동으로 이동한다.</SPAN></P>
<p><span style="font-size:10pt;">- MRS사용, 통장프린터 MSR사용, IC CARD사용기능을 설정.</span></p>
<HR color=#cccccc>
<p><img src="AccountBizEx_03.jpg" border="0"></p>
<p><span style="font-size:10pt;">- 계좌표시상품종류 : 상품코드 선택 설정.</span></p>
<HR color=#cccccc>
<p><img src="AccountBizEx_04.jpg" border="0"></p>
<p><span style="font-size:10pt;">- 고객번호 : 고객번호를 표시 할 컨트롤을 설정.</span></p>
<p><span style="font-size:10pt;">- 개설지점 : 개설지점을 표시 할 컨트롤을 설정.</span></p>
<p><span style="font-size:10pt;">- 개설지점명 : 개설지점명을 표시 할 컨트롤을 설정.</span></p>
<p><span style="font-size:10pt;">- 관리지점 : 관리지점을 표시 할 컨트롤을 설정.</span></p>
<p><span style="font-size:10pt;">- 관리지점명 : 관리지점명을 표시 할 컨트롤을 설정.</span></p>
<p><span style="font-size:10pt;">- 지점 번호명 : 지점번호명을 표시 할 컨트롤을 설정.</span></p>
<p><span style="font-size:10pt;">- 고객등급코드명 : 고객등급코드명을 표시 할 컨트롤을 설정.</span></p>
<STRONG>
<HR color=#cccccc>
</STRONG>
<P><FONT color=#660033 size=2>ITGEN&reg;VigsPro&reg; ToolManual</FONT></P>
</HTML>
  ''';
  //
  // RegExp exp = RegExp(r'</span><SPAN style="FONT-SIZE: 10pt">',multiLine: true,caseSensitive: false);
  // String data = html.replaceAll(exp, '');
  // print(data);



  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Re-Editor',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: Color.fromARGB(255, 255, 140, 0),
        )
      ),
      home: const MyHomePage(title: 'Re-Editor Demo Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  static const Map<String, Widget> _editors = {
    'Basic Field': BasicField(),
    'Json Editor': JsonEditor(),
    'Auto Complete': AutoCompleteEditor(),
    'Large Text': LargeTextEditor(),
    'Js Editor': JsEditor(),
  };

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final Widget child = _editors.values.elementAt(_index);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: _editors.entries.mapIndexed((index, entry) {
                return TextButton(
                  onPressed: () {
                    setState(() {
                      _index = index;
                    });
                  },
                  child: Text(
                    entry.key,
                    style: TextStyle(
                      color: _index == index ? null : Colors.black
                    ),
                  ),
                );
              }).toList(),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.grey
                  )
                ),
                child: child,
              )
            )
          ],
        )
      ),
    );
  }
}