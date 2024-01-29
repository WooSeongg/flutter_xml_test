//xml 태그 모음
import 'package:flutter/cupertino.dart';

final xmlTagNames = [
  'scrinfo', 'form', 'static', 'button', 'image', 'multi_lang'
];

final xmlIdList = [
  'form', 'btn_1'
];

//html 태그 모음
var documentTagNames = [

];


//임시@, xml에서 읽은 id 모음이라 가정
List<String> controlIdList = [
  "form", "btn_1"
];

/// 위젯 주소 저장하는 변수
Map<String, Widget> widgetTree = {};