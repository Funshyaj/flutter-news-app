import 'package:dio/dio.dart';
import '../models/bPost.dart';
import '../models/sPost.dart';

abstract class ApiService{
  getBusinessPosts();
  getStartUpPosts();
}

class ApiServiceImpl extends ApiService{

  //setting up api end point
  static const businessNewsApi = 'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=2b8f4f5e4195450c87a0ceeaf519d557';
  static const startUpNewsApi = 'https://newsapi.org/v2/everything?q=startup&apiKey=2b8f4f5e4195450c87a0ceeaf519d557';

  //create an instance for dio
  final dio = Dio();


  @override
  getBusinessPosts() async{

    var posts = <Article>[];
    //making network request...
    var res = await dio.get(businessNewsApi);
    posts = Bpost.fromJson(res.data).articles;
    return posts;
  }

  @override
  getStartUpPosts()async{
    var posts = <StartUpArticle>[];
    //making network request...
    var res = await dio.get(startUpNewsApi);
    // breaking posts down
    posts = Spost.fromJson(res.data).articles;
    return posts;
  }


}


