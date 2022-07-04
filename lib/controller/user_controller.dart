import 'package:flutter_blog/domain/user/user.dart';
import 'package:flutter_blog/domain/user/user_repository.dart';
import 'package:flutter_blog/util/jwt.dart';
import 'package:get/get.dart';


class UserController extends GetxController {
  final UserRepository _userRepository =UserRepository();
  final RxBool isLogin = false.obs; // UI가 관찰 가능한 변수 => 변경 => UI 자동 업데이트
  final principal = User().obs;

  /*u.isLogin.value = false;
    jwtToken = null; --> 함수로 만들것 -> userController */
  /* await 있을 때 Future 쓰는것*/
  void logout(){
    this.isLogin.value = false;
    jwtToken = null;
  }

  /*Future<String> login(String username, String password) async{
    String token =await _userRepository.login(username, password);

    if(token != '-1'){
      isLogin.value = true;
      jwtToken = token;
      print('jwtToken : $jwtToken');
    }
    return token;
  }*/
  Future<int> login(String username, String password) async{
    User principal =await _userRepository.login(username, password);

    if(principal.id != null) {
      this.isLogin.value = true;
      this.principal.value = principal;
      return 1;
    }else {
      return -1;
    }
  }
}
