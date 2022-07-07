import 'package:flutter/material.dart';
import 'package:flutter_blog/controller/post_controller.dart';
import 'package:flutter_blog/util/validator_util.dart';
import 'package:get/get.dart';

import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_form_field.dart';
import '../../components/custom_textarea.dart';
import 'home_page.dart';

class WritePage extends StatelessWidget {
  //const WritePage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _content = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('글쓰기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            child: ListView(
              children: [
                CustomTextformField(
                  controller: _title,
                  hint: 'Title',
                  funValidator: validateWriteTitle(),
                ),
                CustomTextArea(
                    controller: _content,
                    hint: 'Content',
                    funValidator: validateWriteContent()
                ),
                CustomElevatedButton(
                    text: '등록',
                    funPageRoute: () async {
                      if(_formKey.currentState!.validate()){
                        //글쓰기 완료 후 함수호출
                        //PostController p = Get.find(); ==다른곳에서 사용안하면==> Get.find<PostController>();
                        await Get.find<PostController>().save(_title.text, _content.text); //trim=>공백확인
                        Get.off(()=>HomePage());
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
