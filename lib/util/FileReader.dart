import 'package:flutter/services.dart';

import '../FuncList.dart';


//TagName, id 및 속성이 담긴 List를 리턴
Future<List> getJSData(List<String> tagList) async{
  var dataList = [];
  var tagIdList = [];
  Map<String, dynamic> content = {};
  Map<String, dynamic>? funcList;

  //임시, 프로젝트 내부 파일에 접근
  String data = await rootBundle.loadString('document/cws09.js');

  // for (String tag in tagList) {
    //콜백함수 정규식
    RegExp regExp = RegExp('(\\w+).(\\w+)=(function\\([^)]*\\)\\s*{[^}]*})');
    List<RegExpMatch>? matches = regExp.allMatches (data).toList();

    if (matches == null) {
      print("null");
      // return null;
    }

    for(RegExpMatch match in matches) {
      String tagType = "Button"; //임시
      String tagId = match.group(1)!; //임시
      //콜백함수명 (OnFormInit, OnClick 등..)
      String callBackFuncName = match.group(2)!;
      //함수 인자 및 바디
      String callBackFuncFullString = match.group(3)!;
      //콜백함수에 정의된 함수 정보를 List로 저장
      List<Map<String, dynamic>> functionCalls = [];

      Map<String, dynamic> callBackFuncBody = {
        "fullString": callBackFuncFullString, //임시
      };

      //콜백함수에서 정의된 코드 다시 스캔
      if(callBackFuncFullString != ""){
        // 객체.함수(인자) 형식
        RegExp functionCallPattern = RegExp(r'(\w+)\.(\w+)\(([^)]*)\)');
        //콜백 바디에서 정의된 모든 함수 찾기
        Iterable<Match> funcMatches = functionCallPattern.allMatches(callBackFuncFullString);
        //객체.속성 = 형식
        RegExp propertiesPattern = RegExp(r'(\w+)\.(\w+)\(([^)]*)\)');
        Iterable<Match> propMatches = functionCallPattern.allMatches(callBackFuncFullString);

        //콜백함수 내부에 정의된 모든 함수, 속성을 찾는 과정
        for (Match match in funcMatches) {
          String? objectName = match.group(1);  // 객체 이름
          String? funcName = match.group(2);    // 함수 이름
          String? argsString = match.group(3);  // 인자 문자열

          //정의된 함수인지 확인하는 절차,
          //존재하지 않는 함수인 경우 undefined 타입을 반환
          if(FuncList.getByCode('$funcName') == FuncList.undefined){
            //존재하지 않는 함수일 경우 현재 루프를 중지하고 다음 요소로 이동
            continue;
          }

          // 인자값을 콤마로 분할하여 리스트로 저장
          List<String> args = argsString!.split(',').map((arg) => arg.trim()).toList();

          // 함수 호출 정보를 Map에 저장
          Map<String, dynamic> functionInfo = {
            'objectName': objectName,
            'funcName': funcName,
            // 'funcList': funcList,
            'args': args,
          };

          // 리스트에 추가
          functionCalls.add(functionInfo);
        }
      }

      tagIdList.add(tagId);
      content[tagId] = {
        //Button, Form 등,  삭제?
        'tagType': tagType,
        //btn_1 등
        'tagId': tagId,
        //콜백함수 이름
        'funcName': callBackFuncName,
        //콜백함수 바디
        'funcBody': functionCalls, //List로 변경하기
      };
      dataList.add(content[tagId]);
    }
  // }
  return dataList;
}