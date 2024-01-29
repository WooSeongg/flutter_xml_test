import 'package:flutter/material.dart';
import 'package:flutter_xml_test/page/RootPage.dart';
import 'package:flutter_xml_test/util/FileReader.dart';

import 'constans.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  //JS파일을 읽어 List<Map>으로 저장함
  List<dynamic> parsedJS = await getJSData(controlIdList);
  print(parsedJS);
  runApp(RootPage(script:parsedJS));
}

// class MyHomePage extends StatelessWidget {
//
//   //
//   List? script;
//
//   MyHomePage({super.key, required List script});
//
//   @override
//   Widget build(BuildContext context) {
//
//     return MaterialApp(
//       title:"JS파싱 테스트 앱",
//       home: RootPage(script: script),
//     );
//   }
// }
