import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:validators/validators.dart';

import '../../../util/validator_util.dart';
import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_form_field.dart';
import 'login_page.dart';

class JoinPage extends StatelessWidget {
  //const JoinPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

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
              child: Text('회원가입 페이지',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            _joinForm(),
          ],
        ),
      ),
    );
  }

  Widget _joinForm() {
    return Form(
      key: _formKey,
        child: Column(
          children: [
            CustomTextformField(hint: 'User Name', funValidator: validateUsername()
            ),
            CustomTextformField(hint: 'Password', funValidator: validatePassword()
            ),
            CustomTextformField(hint: 'Email', funValidator: validateEmail()
            ),
            CustomElevatedButton(text: '회원가입',
              funPageRoute: () {
              if(_formKey.currentState!.validate()){
                Get.to(LoginPage());
                }
              },
            ),
            TextButton(
              onPressed: (){
                Get.to(LoginPage());
              },
              child: Text('로그인 페이지로 이동'),
            ),
          ],
        ),
    );
  }
}











































































 