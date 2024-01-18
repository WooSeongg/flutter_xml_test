import 'package:flutter/services.dart';

import '../FuncList.dart';


//TagName, id 및 속성이 담긴Map, 을 리턴
Future<List> readJSFile(List<String> tagList) async{
  var dataList = [];
  Map<String, dynamic>? funcList;

  //임시, 프로젝트 내부 파일에 접근
  String data = await rootBundle.loadString('document/cws09.js');

  for (String tag in tagList) {
    RegExp regExp = RegExp('$tag.(\\w+)=(function\\([^)]*\\)\\s*{[^}]*})');
    RegExpMatch? match = regExp.firstMatch(data);

    if (match != null) {
      String tagType = "Button"; //임시
      //콜백함수명
      String callBackFuncName = match.group(1)!;
      //함수 인자 및 바디
      String callBackFuncBodyFull = match.group(2)!;
      Map<String, dynamic> callBackFuncBody = {
        "fullBody": callBackFuncBodyFull, //임시
      };

      //콜백함수에서 정의된 코드 다시 스캔
      if(callBackFuncBodyFull != ""){
        // 객체.함수() 형식일 때
        RegExp functionCallPattern = RegExp(r'(\w+)\.(\w+)\(([^)]*)\)');
        //콜백 바디에서 정의된 모든 함수 찾기
        Iterable<Match> matches = functionCallPattern.allMatches(callBackFuncBodyFull);

        List<Map<String, dynamic>> functionCalls = [];

        for (Match match in matches) {
          String? objectName = match.group(1);  // 객체 이름
          String? funcName = match.group(2);  // 함수 이름
          String? argsString = match.group(3);  // 인자 문자열

          //존재하는 함수인지 확인하는 절차, 존재하는 함수일 때 Enum값을 반환함
          var fname = FuncList.getByCode('$funcName');

          // 인자 문자열을 콤마로 분할하여 리스트로 저장
          List<String> args = argsString!.split(',').map((arg) => arg.trim()).toList();

          // 함수 호출 정보를 Map에 저장
          Map<String, dynamic> functionInfo = {
            'objectName': objectName,
            'funcName': funcName,
            'funcList': funcList,
            'args': args,
          };

          // 리스트에 추가
          functionCalls.add(functionInfo);
        }
      }

      funcList![tag] = {
        'tagType': tagType,
        '$callBackFuncName': callBackFuncBodyFull, //콜백함수가 여러개라면 List로 변경하기
      };
    }
  }
  return dataList;
}