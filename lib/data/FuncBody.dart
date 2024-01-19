// //콜백함수에 담긴 정보를 저장
// class ScriptData{
//
//   ///태그 종류
//   //Form, Button, Div 등..
//   String tagType;
//
//   //태그 ID
//   String tagId;
//
//   ///콜백함수 이름
//   //OnFormInit, OnClick...
//   String funcName;
//
//   //사용된 함수 List
//   List<JsFuncList>? bodyFuncs;
//
//   ScriptData(this.tagType, this.tagId, this.funcName, this.bodyFuncs);
//
//   //js을 파싱하는 함수
//   factory ScriptData.fromJS(RegExpMatch matchResult, String tagId){
//
//     String tagType = "Button"; //임시
//     //콜백함수명 (OnFormInit, OnClick 등..)
//     String callBackFuncName = matchResult.group(1)!;
//     //함수 인자 및 바디
//     String callBackFuncFullString = matchResult.group(2)!;
//     //함수 인자값 List
//     List<JsFuncList> funcList = [];
//
//     if(callBackFuncFullString != ""){
//
//       // '객체.함수()' 형식
//       RegExp functionCallPattern = RegExp(r'(\w+)\.(\w+)\(([^)]*)\)');
//       //콜백 바디에서 정의된 모든 함수 찾기
//       Iterable<Match> funcMatches = functionCallPattern.allMatches(callBackFuncFullString);
//
//
//
//       for (Match match in funcMatches) {
//
//         String? objName = match.group(1);  // 객체 이름
//         String? funcName = match.group(2);    // 함수 이름
//         String? argsString = match.group(3);  // 인자 문자열
//
//         // 인자값을 콤마로 분할하여 리스트로 저장
//         List<String> args = argsString!.split(',').map((arg) => arg.trim()).toList();
//
//         funcList.add(JsFuncList.fromString(objName!, funcName!, args));
//       }
//
//     }
//
//     return ScriptData(
//         tagType,          //임시
//         tagId,            //태그ID
//         callBackFuncName, //함수이름
//         funcList          //사용된 함수 목록
//     );
//   }
// }
//
// //콜백내부의 함수 하나의 정보
// class JsFuncList{
//
//   //객체이름
//   String objName;
//
//   //함수이름
//   String funcName;
//
//   //함수 인자값
//   List<String> args;
//
//
//   JsFuncList.fromString(String objName, String funcName, List<String> args)
//     :   objName = objName,
//         funcName = funcName,
//         args = args;
//
//
//
//
// }