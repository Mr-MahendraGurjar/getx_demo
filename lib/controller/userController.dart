import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/helper/http_helper.dart';
import 'package:getx_demo/model/userResponse.dart';

class UserController extends GetxController {
  HttpHelper httphelper = HttpHelper();
  var listName = List<Data>().obs;
  ScrollController sc = new ScrollController();
  bool isLoading = false;
  var page = 1.obs;

  Future<void> getUserData()  async {
   /* Future.delayed(
        Duration.zero,
        () => Get.dialog(Center(child: CircularProgressIndicator()),
            barrierDismissible: false));*/
    UsersResponse usersResponse = await httphelper.getAllUserData(page.value);
    listName.value = usersResponse.data;
  //  Get.back();
  }

  @override
  void onInit() {
    super.onInit();
    this.getUserData();
    sc.addListener(() {
      if (sc.position.pixels == sc.position.maxScrollExtent) {
        getUserData();
        page.value++;
      }
    });
  }

  @override
  void onClose(){
    super.onClose();
    sc.dispose();
  }

}
