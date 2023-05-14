import 'package:demo_app/models/sPost.dart';
import 'package:stacked/stacked.dart';
import '../../../app/app.locator.dart';
import '../../../models/bPost.dart';
import '../../../services/api_servies.dart';
import '../../../services/fetch_post_services.dart';

class ExploreViewModel extends BaseViewModel{

//  setting up services
  final _fetchPostServices = locator<ApiService>();

  List<StartUpArticle> startUpPosts = [];
  List<Article> businessPosts = [];


  getStartUpPosts()async {
    startUpPosts =  await _fetchPostServices.getStartUpPosts();
    notifyListeners();
  }

  getBusinessPosts()async{
    businessPosts =  await _fetchPostServices.getBusinessPosts();
    notifyListeners();
  }

  getDiffPosts(){
getStartUpPosts();
getBusinessPosts();
  notifyListeners();
}



}






