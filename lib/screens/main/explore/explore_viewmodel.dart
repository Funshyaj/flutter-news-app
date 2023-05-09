import 'package:demo_app/models/sPost.dart';
import 'package:stacked/stacked.dart';
import '../../../app/app.locator.dart';
import '../../../services/fetch_post_services.dart';

class ExploreViewModel extends FutureViewModel<List<StartUpArticle>> {

//  setting up services
  final _fetchPostServices = locator<FetchPostService>();


  @override
  Future<List<StartUpArticle>> futureToRun()async{
    return await _fetchPostServices.fetchStartUpPosts();
  }

}






