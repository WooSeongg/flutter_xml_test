
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xml_test/controlWidget/FormControl.dart';

import '../constans.dart';

//스크립트 해석 및 Form컨트롤을 생성하는 페이지
class RootPage extends StatelessWidget {

  /// 파싱된 스크립트 List
  //함수목록이 저장되어 있음
  final List? script;

  const RootPage({
    super.key,
    this.script,
    //this.css
  });

  //콜백 리스트
  // Map<String, dynamic> callbackFunc = {};

  getCallBackFunc(List callbackList){
    for(Map<String, dynamic> func in callbackList){

    }
  }

  makeWidgetTree(){
    widgetTree = {xmlIdList[0] : FormControl(id:xmlIdList[0], name:xmlTagNames[1])}; // 자동으로 생성되어야 함
  }


  @override
  Widget build(BuildContext context) {

    makeWidgetTree();

    return MaterialApp(
      title:"JS파싱 테스트 앱",
      home: Container(
          child: widgetTree[xmlIdList[0]]
      ),
    );
  }

}