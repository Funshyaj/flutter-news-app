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



// StartUpArticle get fetchedStartUpArticle => dataMap![_startUpArticle];
//
// bool get fetchingStartUpArticle => busy(_startUpArticle);
//
// //  setting uo services
// final _fetchPostServices = locator<FetchPostService>();
//
//
// @override
// // TODO: implement futuresMap
// Map<String, Future Function()> get futuresMap =>
//     {
//
//       _startUpArticle: getStartUpArticleAfterDelay()
//
//       // _StringDelayFuture: getStringAfterDelay
//       // throw UnimplementedError();
//
//
//     };
//
//
// Future<StartUpArticle> getStartUpArticleAfterDelay() async {
//   var res = await _fetchPostServices.fetchStartUpPosts();
//   return res;
// }


