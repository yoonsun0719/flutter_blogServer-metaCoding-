import 'package:get/get.dart';

const host ='http://10.50.100.76:8080';

//통신
class UserProvider extends GetConnect {
  //promise
  Future<Response> login(Map data) => post('$host/login', data);

}
