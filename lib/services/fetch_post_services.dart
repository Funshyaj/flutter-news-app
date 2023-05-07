import 'dart:convert';
import 'package:dio/dio.dart';

import '../models/post.dart';

abstract class FetchPostService {
  fetchPosts();
}

class FetchPostServiceImpl extends FetchPostService  {

  //setting up api end point
  static const endPoint = 'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=';
  static const apiKey = '2b8f4f5e4195450c87a0ceeaf519d557';
  //create an instance for dio
  final dio = Dio();


  @override
 Future<List<Post>> fetchPosts() async{
   var posts = <Post>[];

   //making network request...
  var res = await dio.get(endPoint+apiKey);
     var parsed = json.decode(res.data['articles']) as List<dynamic>;
     for (var post in parsed){
       posts.add(Post.fromJson(post));
     }

return posts;

  }


}

