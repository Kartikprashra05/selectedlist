import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'group_model.dart';

class SelectionController extends GetxController {
  RxList<GroupModel> grouplist = RxList();
  RxList<GroupModel> secondlist = RxList();
  var name = "".obs;
  var isname = false.obs;

  updated(String restroname) {
    name.value = restroname;
  }

  @override
  void onInit() {
    grouplist.refresh();
    loadItems();
    // TODO: implement onInit
    super.onInit();
  }

  loadItems() {
    List<GroupModel> newitems = [
      GroupModel(
          title: 'kartik',
          avatar: Icon(Icons.dangerous_rounded),
          isSelected: false.obs,
          subtitle: 'prashar'),
      GroupModel(
          title: 'kartik',
          avatar: Icon(Icons.dangerous_rounded),
          isSelected: false.obs,
          subtitle: 'prashar'),
      GroupModel(
          title: 'kartik',
          avatar: Icon(Icons.dangerous_rounded),
          isSelected: false.obs,
          subtitle: 'prashar'),
    ];
    grouplist.addAll(newitems);
  }
}
