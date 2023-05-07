import 'package:demo_app/models/post.dart';
import 'package:demo_app/services/fetch_post_services.dart';
import 'package:stacked/stacked.dart';
import '../../../app/app.locator.dart';

class HomeViewModel extends FutureViewModel<List>{
// <List<Post>>{

//  setting up services
final _fetchPostServices = locator<FetchPostService>();

String name = 'funsho';

@override
  // Future<List<Post>>
futureToRun(){
// Future<List<Post>>
return _fetchPostServices.fetchPosts();


}


}