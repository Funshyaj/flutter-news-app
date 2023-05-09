import 'package:demo_app/models/bPost.dart';
import 'package:demo_app/services/fetch_post_services.dart';
import 'package:stacked/stacked.dart';
import '../../../app/app.locator.dart';
import '../../../models/post.dart';

class HomeViewModel extends FutureViewModel<List<Article>>{

//  setting up services
final _fetchPostServices = locator<FetchPostService>();

// String name = 'funsho';


@override
  Future<List<Article>> futureToRun()async{

return await _fetchPostServices.fetchPosts();

}


}