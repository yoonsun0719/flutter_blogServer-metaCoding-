import 'package:flutter/material.dart';
import 'package:flutter_blog/controller/user_controller.dart';
import 'package:get/get.dart';


class UserInfo extends StatelessWidget {
  //const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController u = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text('회원정보'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('회원번호 : ${u.principal.value.id}'),
            Text('회원이름 : ${u.principal.value.username}'),
            Text('회원이메일 : ${u.principal.value.email}'),
            Text('회원가입일 : ${u.principal.value.created}'),
          ],
        ),
      ),
    );
  }
}
