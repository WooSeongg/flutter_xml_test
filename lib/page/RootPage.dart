
import 'package:flutter/cupertino.dart';
import 'package:flutter_xml_test/control/FormControl.dart';

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

  makeCallBackFunc(Map callbackFunc){

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child:FormControl()
    );
  }

}