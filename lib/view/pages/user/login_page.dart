import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/controller/user_controller.dart';
import 'package:flutter_blog/domain/user/user_repository.dart';
import 'package:flutter_blog/util/jwt.dart';
import 'package:flutter_blog/util/validator_util.dart';
import 'package:get/get.dart';

import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_form_field.dart';
import '../post/home_page.dart';
import 'join_page.dart';

class LoginPage extends StatelessWidget {
  //const LoginPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  //상태관리 해주는 역할
  final UserController u = Get.put(UserController());

  final _username = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              height: 200.0,
              child: Text(
                '로그인 페이지 ${u.isLogin}',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            _loginForm(),
          ],
        ),
      ),
    );
  }

  Widget _loginForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextformField(
              controller: _username,
              hint: 'User Name',
              funValidator: validateUsername()),
          CustomTextformField(
              controller: _password,
              hint: 'Password',
              funValidator: validatePassword()),
          CustomElevatedButton(
            text: '로그인',
            funPageRoute: () async {
              /*1번 if (_formKey.currentState!.validate()) {
                Get.to(() => HomePage());
                u.login('ssar', '1234');*/
              if (_formKey.currentState!.validate()) {
                //Get.to(HomePage());
                //UserRepository u = UserRepository();
                int result = await u.login(
                    _username.text.trim(), _password.text.trim());
                if (result == 1) {
                  print('토큰 정상적으로 받음');
                  //jwtToken = token;
                  //print('jwtToken : $jwtToken');
                  Get.to(() => HomePage());
                } else {
                  print('토큰 못받음');
                  Get.snackbar('로그인 시도', '로그인실패');
                }
              }
            },
          ),
          TextButton(
            onPressed: () {
              Get.to(JoinPage());
            },
            child: Text('회원가입이 필요합니다.'),
          ),
        ],
      ),
    );
  }
}
