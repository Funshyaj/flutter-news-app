import 'package:dio/dio.dart';
import '../models/post.dart';
import '../models/bPost.dart';

abstract class ApiService{
  getPosts();
}

class ApiServiceImpl extends ApiService{

  //setting up api end point
  static const newsApi = 'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=2b8f4f5e4195450c87a0ceeaf519d557';
  // static const apiKey = '';

  // static const endPoint = 'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=2b8f4f5e4195450c87a0ceeaf519d557';
  //create an instance for dio
  final dio = Dio();




  @override
  getPosts() async{

    var posts = <Article>[];
    //making network request...
    var res = await dio.get(newsApi);
    // var res = await dio.get(endPoint);
    // posts = Post.fromJson(res.data).articles;
    posts = Bpost.fromJson(res.data).articles;
    print(posts);
    print('object');
    // }

    return posts;

  }


}


