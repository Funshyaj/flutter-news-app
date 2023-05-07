import 'package:demo_app/models/post.dart';
import 'package:demo_app/services/fetch_post_services.dart';
import 'package:stacked/stacked.dart';
import '../../../app/app.locator.dart';

class HomeViewModel extends FutureViewModel<List<Post>>{

//  setting up services
final _fetchPostServices = locator<FetchPostService>();


@override
  Future<List<Post>> futureToRun(){
return _fetchPostServices.fetchPosts();
}


}