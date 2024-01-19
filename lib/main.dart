import 'package:flutter/material.dart';
import 'package:flutter_xml_test/page/EmptyPage.dart';
import 'package:flutter_xml_test/page/RootPage.dart';
import 'package:flutter_xml_test/util/FileReader.dart';

import 'constans.dart';
import 'control/FormControl.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  List<dynamic> parsedJS = await getJSData(controlIdList);

  runApp(MyHomePage(script:parsedJS));
  
}

class MyHomePage extends StatelessWidget {


  List? script;

  MyHomePage({super.key, required List script});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title:"JS파싱 테스트 앱",
      home: RootPage(script: script),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){},
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
