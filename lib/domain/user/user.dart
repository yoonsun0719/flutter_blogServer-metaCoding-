import 'package:intl/intl.dart';

class User {
  final int? id;
  final String? username;
 // final String? password;
  final String? email;
  final DateTime? created;
  final DateTime? updated;

  User(
      {this.id,
      this.username,
      //this.password,
      this.email,
      this.created,
      this.updated});

  //통신을위해서 Json 처럼 생긴문자열 {"id" : 1} => Dart 오브젝트
  User.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      username = json['username'],
      email = json['email'],
      created = DateFormat('yyyy-mm-dd').parse(json['created']),
      updated = DateFormat('yyyy-mm-dd').parse(json['updated']);
}
