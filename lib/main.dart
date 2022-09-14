import 'package:flutter/material.dart';
import 'package:flutter_blog/view/pages/post/home_page.dart';
import 'package:flutter_blog/view/pages/user/login_page.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main () => runApp(MyApp());

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( //GetX이므로 GetMaterial
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
