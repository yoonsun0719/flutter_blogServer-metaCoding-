import 'package:flutter/material.dart';
import 'package:flutter_blog/controller/post_controller.dart';
import 'package:flutter_blog/controller/user_controller.dart';
import 'package:flutter_blog/view/pages/post/update_page.dart';
import 'package:get/get.dart';

import 'home_page.dart';

class DetailPage extends StatelessWidget {
  //const DetailPage({Key? key}) : super(key: key);

  final int? id;

  const DetailPage(this.id);

  @override
  Widget build(BuildContext context) {
    //String data = Get.arguments;
    UserController u = Get.find();
    PostController p = Get.find();
    print('로그인 유저아이디 : ${u.principal.value.id}');

    return Scaffold(
      appBar: AppBar(
        title: Text(' 로그인 상태 : ${p.post.value.user!
            .username}, 게시글 : $id'), //${u.isLogin}
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(()=>Column(
          // Center(child: Text('Detail Page $id '),),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //paddingAll(15),
            Text('${p.post.value.title}', //글제목
              style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 35
            ),),
            Divider(height: 30,),
            u.principal.value.id == p.post.value.user!.id ? Row(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await p.deletebyId(p.post.value.id!);
                    Get.off( ()=> HomePage()); //상태관리로 갱신시킬 수있음
                  },
                  child: Text('삭제'),
                ),
                SizedBox(width: 10.0,) ,
                ElevatedButton(
                  onPressed: () {
                    Get.to(()=>UpdatePage());
                  },
                  child: Text('수정'),
                ),
              ],
            ) : SizedBox(),
            Expanded(
              child: SingleChildScrollView(
                child: Text('${p.post.value.content}'),
              ),
            )
          ],
        ),
        ),
      ),
    );
  }
}
