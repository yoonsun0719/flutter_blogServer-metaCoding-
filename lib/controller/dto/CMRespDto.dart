import 'package:intl/intl.dart';

class CMRespDto {
  final int? code;
  final String? msg;
  final dynamic data;

  CMRespDto({this.code, this.msg, this.data,
  });

  //통신을위해서 Json 처럼 생긴문자열 {"id" : 1} => Dart 오브젝트
  CMRespDto.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        msg = json['msg'],
        data = json['data'];
}
