import 'package:flutter/foundation.dart';
import 'package:flutter_blog/controller/dto/CMRespDto.dart';
import 'package:flutter_blog/controller/dto/LoginReqDto.dart';
import 'package:flutter_blog/domain/post/post.dart';
import 'package:flutter_blog/domain/post/post_provider.dart';
import 'package:flutter_blog/util/convert_utf8.dart';
import 'package:get/get_connect/http/src/response/response.dart';

//통신을 호출해서 응답되는 데이터를 예쁘게 가공 => json --> Dart 오브젝트
class PostRepository {
  final PostProvider _postProvider = PostProvider();

  Future<Post> findById(int id) async{
    Response response = await _postProvider.findById(id);
    dynamic body = response.body;
    CMRespDto cmRespDto = CMRespDto.fromJson(body);
    //print(body);
     if(cmRespDto.code == 1) {
      Post post = Post.fromJson(cmRespDto.data);
      return post;
    }else{
      return Post();
    }
  }

  Future<List<Post>> findAll() async{
    //print('@@@@@@@@@@@@');
    Response response = await _postProvider.findAll();
    dynamic body = response.body;
    //dynamic convertBody = convertUtf8ToObject(body); //UTF -8 한글깨짐 해결
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    print('포스트 레포지토리 ${cmRespDto.code}');
    print('포스트 레포지토리 ${cmRespDto.msg}');
    print('포스트 레포지토리3 ${cmRespDto.data}');
    //print(cmRespDto.data.runtimeType); //타입이 dynamic 타입

    //통신이 성공했을때 코드 변경
    if (cmRespDto.code ==1){
      List<dynamic> temp = cmRespDto.data;
      List<Post> posts = temp.map((post) => Post.fromJson(post)).toList();
      /*print(posts.length);

      print(posts[0].title
      );*/
      return posts;
    }else{
      /*List<Post> hello = [];  // == 동일 == return <Post>[];
      return hello;*/
      return <Post>[];
    }
  }
}
