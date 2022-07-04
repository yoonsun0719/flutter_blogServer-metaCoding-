import 'package:flutter/material.dart';
import 'package:flutter_blog/controller/post_controller.dart';
import 'package:flutter_blog/util/jwt.dart';
import 'package:flutter_blog/view/pages/post/write_page.dart';
import 'package:get/get.dart';
import '../../../controller/user_controller.dart';
import '../../../size.dart';
import '../user/login_page.dart';
import '../user/user_info.dart';
import 'detail_page.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //UserController u = Get.put(UserController()); //put = 없으면 만들고 있으면 찾음. --> 우린 있으므로 fint 로변경
    UserController u = Get.find();

    //홈페이지 도착하면 목록을 뿌려줘야 하므로
    //객체생성(create) , onInit함수실행 (initialize)
    PostController p = Get.put(PostController());
    //p.findAll();

    return Scaffold(
      drawer: _navigation(context),
      appBar: AppBar(
        title: Text('${u.isLogin}'),
      ),
      body: Obx(()=> ListView.separated(
        itemCount: p.posts.length,
        itemBuilder: (context, index){
          return ListTile(
            onTap: () async{
              await p.findById(p.posts[index].id!);
              Get.to(DetailPage(p.posts[index].id),arguments: 'arguments 속성 테스트');
            },
            title: Text('${p.posts[index].title}'),
            leading: Text('${p.posts[index].id}'),
          );
        },
        separatorBuilder: (context, index){
          return Divider();
        },
      ),
      ),
    );
  }

  Widget _navigation(BuildContext context) {
    //필요한 부분을 찾기위해 넣음 -> 로그아웃
    UserController u = Get.find();

    return Container(
      width: getDrawerWidth(context),
      height: double.infinity,
      color: Colors.blue,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  Get.to(UserInfo());
                },
                child: Text(
                  '회원정보보기',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
              Divider(),
              TextButton(
                onPressed: () {
                  Get.to(WritePage());
                },
                child: Text(
                  '글쓰기',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
              Divider(),
              TextButton(
                onPressed: () {
                  /*u.isLogin.value = false;
                  jwtToken = null; --> 함수로 만들것 -> userController */
                  u.logout();
                  Get.to(()=>LoginPage());
                },
                child: Text(
                  '로그아웃',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
