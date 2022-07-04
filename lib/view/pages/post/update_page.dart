
import 'package:flutter/material.dart';
import 'package:flutter_blog/controller/user_controller.dart';
import 'package:flutter_blog/util/validator_util.dart';
import 'package:get/get.dart';

import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_form_field.dart';
import '../../components/custom_textarea.dart';
import 'home_page.dart';

class UpdatePage extends StatelessWidget {
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
                  value: '제목이 들어왔습니다.',
                ),
                CustomTextArea(hint: 'Content',
                    funValidator: validateWriteContent(),
                    value: '내용이 들어왔습니다.' ,
                ),
                //homepage -> detailpage -> updatePage -> detailpage
                CustomElevatedButton(
                    text: '수정하기',
                    funPageRoute: (){
                      if(_formKey.currentState!.validate()){
                        //가장좋은방법 : 같은 Page가 있으면 이동할 때 덮어 씌우기 하면됨
                        Get.back(); //상태관리 GetX 라이브러리 -> obs 사용시가능
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
