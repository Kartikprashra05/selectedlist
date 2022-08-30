import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pagebuildernew/selectionexp/selection_controller.dart';

class SelectionExample extends StatelessWidget {
  SelectionExample({Key? key}) : super(key: key);
  final _controller = Get.put(SelectionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selction Example'),
      ),
      body: Container(
        child: Column(
          children: [
            Obx(
              () => Container(
                height: 150,
                child: _controller.secondlist.length > 0
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _controller.secondlist.length,
                        itemBuilder: (BuildContext context, index) {
                          var model = _controller.grouplist[index];
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _controller
                                          .grouplist[index].isSelected!.value =
                                      !_controller
                                          .grouplist[index].isSelected!.value;
                                  if (_controller
                                      .grouplist[index].isSelected!.value) {
                                    _controller.secondlist
                                        .remove(_controller.grouplist[index]);
                                  }
                                },
                                child: CircleAvatar(
                                  child: model.avatar,
                                ),
                              ),
                              Text(model.title.toString())
                            ],
                          );
                        })
                    : Container(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Obx(
              () => ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: _controller.grouplist.length,
                  itemBuilder: (BuildContext, index) {
                    return ListTile(
                      onTap: () {
                        _controller.grouplist[index].isSelected!.value =
                            !_controller.grouplist[index].isSelected!.value;
                        if (_controller.grouplist[index].isSelected!.value) {
                          _controller.secondlist
                              .add(_controller.grouplist[index]);
                        } else {
                          _controller.secondlist
                              .remove(_controller.grouplist[index]);
                        }
                      },
                      leading: _controller.grouplist[index].avatar,
                      title:
                          Text(_controller.grouplist[index].title.toString()),
                    );
                  }),
            ),
            Obx(() => Text(_controller.name.value)),
            TextField(
              onSubmitted: (value) {
                _controller.updated(value);
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "jsaij"),
            )
          ],
        ),
      ),
    );
  }
}
