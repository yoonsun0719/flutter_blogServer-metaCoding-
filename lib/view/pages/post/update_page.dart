
import 'package:flutter/material.dart';
import 'package:flutter_blog/controller/post_controller.dart';
import 'package:flutter_blog/controller/user_controller.dart';
import 'package:flutter_blog/util/validator_util.dart';
import 'package:get/get.dart';

import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_form_field.dart';
import '../../components/custom_textarea.dart';
import 'home_page.dart';

class UpdatePage extends StatelessWidget {
  //const WritePage({Key? key}) : super(key: key);
  //final PostController p = Get.find();

  final _formKey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final PostController p = Get.find();
      _title.text = '${p.post.value.title}';
      _content.text = '${p.post.value.content}';
      return Scaffold(
      appBar: AppBar(
        title: Text('글 수정하기'),
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
                  //value: '${p.post.value.title}',
                ),
                CustomTextArea(
                  controller: _content,
                  hint: 'Content',
                  funValidator: validateWriteContent(),
                  //value: '${p.post.value.content}',
                ),
                //homepage -> detailpage -> updatePage -> detailpage
                CustomElevatedButton(
                    text: '수정하기',
                    funPageRoute: (){
                      if(_formKey.currentState!.validate()){
                        p.updateById(p.post.value.id ?? 0, _title.text, _content.text);
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
