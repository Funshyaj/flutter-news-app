import 'package:demo_app/services/api_servies.dart';
import '../app/app.locator.dart';
import '../models/bPost.dart';
import '../models/sPost.dart';

abstract class FetchPostService {
  fetchBusinessPosts();
  fetchStartUpPosts();
}

class FetchPostServiceImpl extends FetchPostService  {

  final _api = locator<ApiService>();

  late List<Article> _posts;
  List<Article> get posts => _posts;

  bool get hasPosts => _posts != null && _posts.isNotEmpty;

  late List<StartUpArticle> _StartUpPosts;
  List<StartUpArticle> get StartUpPosts => _StartUpPosts;

  bool get hasStartUpPosts => _StartUpPosts != null && _StartUpPosts.isNotEmpty;

  @override
 Future<List<Article>>fetchBusinessPosts() async{
    _posts = await _api.getBusinessPosts();
    return _posts;
  }


  @override
  Future<List<StartUpArticle>> fetchStartUpPosts() async{
   _StartUpPosts = await _api.getStartUpPosts();
   return _StartUpPosts;
  }



}

