
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 컨트롤의 최상위 태그인 form
class FormControl extends StatelessWidget{

  //생성자
  FormControl({
    super.key,
    this.onLoadingComplete,
    this.child,
    this.tageName,
    this.objData,
    this.backgroundColor = Colors.white
  });

  //****************//
  //*** 콜백 함수 ***//
  //***************//
  /// OnFormInit() 역할을 하는 콜백 함수
  final void Function(String? tageName, Map? objData)? onLoadingComplete;


  //****************//
  //*** 주요 속성 ***//
  //***************//
  ///폼에 들어갈 하위위젯
  final Widget? child;
  ///호출한 페이지의 이름,
  //어떤 페이지로부터 호출되었는지 알 수 있음
  final String? tageName;
  ///호출한 페이지로부터 전달받은 데이터
  final Map? objData;

  //****************//
  //*** 위젯 속성 ***//
  //***************//
  ///폼의 배경색
  final Color backgroundColor;

  //****************//
  //*** 기타 속성 ***//
  //***************//
  ///페이지 최초 실행 확인 용
  bool isFirstLaunch = true;

  @override
  Widget build(BuildContext context) {

    //위젯 반환 시점에 최초 한번만 실행되어야 함
    if(onLoadingComplete != null && isFirstLaunch){
      isFirstLaunch = false;
      onLoadingComplete!(tageName, objData);
    }

    return Container(
      color: backgroundColor,
      child: child
    );
  }

}