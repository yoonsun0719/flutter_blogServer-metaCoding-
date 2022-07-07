import 'package:flutter_blog/domain/post/post.dart';
import 'package:flutter_blog/domain/post/post_repository.dart';
import 'package:get/get.dart';
//repository호출
class PostController extends GetxController{

  final PostRepository _postRepository = PostRepository();
  final posts = <Post>[].obs; // 빈 오브젝트 생성
  final post = Post().obs;

  @override
  void onInit() {
    super.onInit();
   print('컨트롤러까지 넘어온다');
   findAll();
  }

  //목록출력
  Future<void> findAll() async{
    List<Post> posts = await _postRepository.findAll();
    this.posts.value=posts;
  }
   //게시글 출력
  Future<void> findById(int id) async{
    Post post =await _postRepository.findById(id);
    this.post.value = post;
  }

  //삭제
  Future<void> deletebyId(int id) async {
    int result =await _postRepository.deleteById(id);

    if(result == 1 ) {
      print('서버쪽 삭제는 성공이다');
      List<Post> result = posts.where((post) => post.id != id).toList();
      print(result.length);
      posts.value = result;
    }
  }

  //수정 -> Ui 동기화
  Future<void> updateById(int id, String title, String content) async {
    Post post = await _postRepository.updateById(id,title,content);
    if(post.id != null) {
      this.post.value = post;
      posts.value = posts.map((e) => e.id == id ? post : e).toList();
    }
  }

  //글쓰기
  Future<void> save(String title, String content)async {
    Post post = await _postRepository.save(title, content);
    if(post.id != null) {
      posts.add(post);
    }
  }

}