import 'package:flutter/material.dart';

abstract class BaseControl extends StatelessWidget{

  final String id;
  final String name;

  const BaseControl({required this.id, required this.name});

  String getCtrlId(){
    return id;
  }

  String getCtrlName(){
    return name;
  }

}