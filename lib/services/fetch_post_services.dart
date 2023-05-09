import 'dart:convert';
import 'package:demo_app/services/api_servies.dart';
import 'package:dio/dio.dart';

import '../app/app.locator.dart';
import '../models/post.dart';
import '../models/bPost.dart';

abstract class FetchPostService {
  fetchPosts();
}

class FetchPostServiceImpl extends FetchPostService  {

  final _api = locator<ApiService>();

  late List<Article> _posts;
  List<Article> get posts => _posts;

  bool get hasPosts => _posts != null && _posts.isNotEmpty;

  @override
 Future<List<Article>>fetchPosts() async{
    _posts = await _api.getPosts();
    return _posts;
  }


}

