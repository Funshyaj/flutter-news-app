import 'package:dio/dio.dart';
import '../models/post.dart';

abstract class ApiService{
  Future<List<Article>> getHeadlines(Dio dio);
  Future<List<Article>> getBusinessNews();
  Future<List<Article>> getStartUpNews();
  Future<List<Article>> getSportsNews();
  Future<List<Article>> getAfricaNews();

}

class ApiServiceImpl extends ApiService{

  //setting up api end point
  static const headlinesApi = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=2b8f4f5e4195450c87a0ceeaf519d557';
  static const businessNewsApi = 'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=2b8f4f5e4195450c87a0ceeaf519d557';
  static const startUpNewsApi = 'https://newsapi.org/v2/everything?q=startup&apiKey=2b8f4f5e4195450c87a0ceeaf519d557';
  static const sportNewsApi = 'https://newsapi.org/v2/everything?q=sports&apiKey=2b8f4f5e4195450c87a0ceeaf519d557';
  static const africaNewsApi = 'https://newsapi.org/v2/everything?q=africa&apiKey=2b8f4f5e4195450c87a0ceeaf519d557';

  //create an instance for dio
  final dio = Dio();

  @override
  Future<List<Article>> getHeadlines(Dio dio) async{
    var news = <Article>[];
    //making network request...
    var res = await dio.get(
        headlinesApi,
        // options: Options(headers:{"j":"mjmj"})
        );
    news = Post.fromJson(res.data).articles;
    return news;
  }

  @override
  Future<List<Article>> getBusinessNews() async{
    var news = <Article>[];
    //making network request...
    var res = await dio.get(businessNewsApi);
    news = Post.fromJson(res.data).articles;
    return news;
  }

  @override
  Future<List<Article>> getStartUpNews()async{
    var news = <Article>[];
    //making network request...
    var res = await dio.get(startUpNewsApi);
    news = Post.fromJson(res.data).articles;
    return news;
  }

  @override
  Future<List<Article>> getSportsNews() async{
    var news = <Article>[];
    //making network request...
    var res = await dio.get(sportNewsApi);
    news = Post.fromJson(res.data).articles;
    return news;
  }

  @override
  Future<List<Article>> getAfricaNews() async{
    var news = <Article>[];
    //making network request...
    var res = await dio.get(africaNewsApi);
    news = Post.fromJson(res.data).articles;
    return news;
  }






}


