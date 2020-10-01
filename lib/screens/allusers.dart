import 'package:flutter/material.dart';
import 'package:getx_demo/controller/userController.dart';
import 'package:get/get.dart';

class AllUsers extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Users",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Obx(() {
          return ListView.builder(
              controller: userController.sc,
              itemCount: userController.listName.length + 1,
              itemBuilder: (context, index) {
                if (index == userController.listName.length) {
                  return _buildProgressIndicator();
                } else {
                  return Container(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage:
                            NetworkImage(userController.listName[index].avatar),
                      ),
                      title: Text(
                        userController.listName[index].firstName +
                            " " +
                            userController.listName[index].lastName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      subtitle: Text(
                        userController.listName[index].email,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  );
                }
              });
        }),
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new CircularProgressIndicator(),
      ),
    );
  }
}
