
///기본함수 정의
enum FuncList{
  ///속성정보 취득 함수
  GetProp,
  ///스타일정보 취득 함수
  getStyle,
  ///속성 지정 함수
  setProp,
  ///스타일 지정 함수
  setStyle,
  ///존재하지 않는 함수
  undefined;

  //String과 동일한 이름의 enum을 반환함
  factory FuncList.getByCode(String stringName){
    //첫글자 소문자로 변환
    var lowerCaseName =  stringName.substring(0, 1).toLowerCase() + stringName.substring(1);

    return FuncList.values.firstWhere((value) => value.name == lowerCaseName,
        orElse: () => FuncList.undefined);
  }
}

///콜백함수 정의
enum CallFuncList{
  ///최초 실행 이벤트
  onFormInit,
  ///버튼 클릭 이벤트
  onClick,
  ///존재하지 않는 함수
  undefined;

  //String과 동일한 이름의 enum을 반환함
  factory CallFuncList.getByCode(String stringName){
    //첫글자 소문자로 변환
    var lowerCaseName =  stringName.substring(0, 1).toLowerCase() + stringName.substring(1);

    return CallFuncList.values.firstWhere((value) => value.name == lowerCaseName,
        orElse: () => CallFuncList.undefined);
  }
}