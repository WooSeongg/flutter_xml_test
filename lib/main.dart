import 'package:flutter/material.dart';
import 'package:flutter_xml_test/page/EmptyPage.dart';
import 'package:flutter_xml_test/util/FileReader.dart';

import 'constans.dart';
import 'control/FormPage.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  List<dynamic> parsedJS = await getJSData(controlIdList);

  runApp(MyHomePage());
  
}

class MyHomePage extends StatelessWidget {


  String title = "";

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title:"JS파싱 테스트 앱",
      home: FormPage(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){},
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
