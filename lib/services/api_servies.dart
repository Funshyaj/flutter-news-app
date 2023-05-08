import 'dart:convert';
import 'package:dio/dio.dart';

import '../models/post.dart';
import '../models/ss.dart';

abstract class ApiService{
  getPosts();
}

class ApiServiceImpl extends ApiService{

  //setting up api end point
  static const endPoint = 'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=2b8f4f5e4195450c87a0ceeaf519d557';
  //create an instance for dio
  final dio = Dio();

  @override
  getPosts() async{

    var posts = <Article>[];
    //making network request...
    var res = await dio.get(endPoint);

    posts = Post.fromJson(res.data).articles;


    // }

    return posts;

  }


}
