import 'package:flutter/material.dart';
import 'package:flutter_blog/util/validator_util.dart';
import 'package:get/get.dart';

import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_form_field.dart';
import '../../components/custom_textarea.dart';
import 'home_page.dart';

class WritePage extends StatelessWidget {
  //const WritePage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            child: ListView(
              children: [
                CustomTextformField(
                  hint: 'Title',
                  funValidator: validateWriteTitle(),
                ),
                CustomTextArea(hint: 'Content',
                    funValidator: validateWriteContent()
                ),
                CustomElevatedButton(
                    text: '등록',
                    funPageRoute: (){
                      if(_formKey.currentState!.validate()){
                        Get.off(HomePage());
                      }
                    }
                ),
              ],
            )
        ),
      ),
    );
  }
}
