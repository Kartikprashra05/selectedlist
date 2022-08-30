import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class GroupModel {
  Widget? avatar;
  String? title;
  String? subtitle;
  RxBool? isSelected;

  GroupModel({this.avatar, this.title, this.subtitle, this.isSelected});
}
