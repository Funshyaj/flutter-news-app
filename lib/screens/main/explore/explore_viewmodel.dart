import 'package:demo_app/models/bPost.dart';
import 'package:stacked/stacked.dart';
import '../../../app/app.locator.dart';
import '../../../services/fetch_post_services.dart';

class ExploreViewModel extends BaseViewModel{

  //  setting uo services
  final _fetchPostServices = locator<FetchPostService>();
  late final Future<List<Article>> posts ;

  fetch(){
   posts = _fetchPostServices.fetchPosts();
   return posts;

  }

}


