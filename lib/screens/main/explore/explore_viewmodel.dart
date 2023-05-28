import 'package:stacked/stacked.dart';
import '../../../app/app.locator.dart';
import '../../../models/post.dart';
import '../../../services/api_services.dart';

class ExploreViewModel extends BaseViewModel{

//  setting up services
  final _fetchPostServices = locator<ApiService>();

  List<Article> startUpPosts = [];
  List<Article> businessPosts = [];

  getStartUpPosts()async {
    startUpPosts =  await _fetchPostServices.getStartUpNews();
    notifyListeners();
  }

  getBusinessPosts()async{
    businessPosts =  await _fetchPostServices.getBusinessNews();
    notifyListeners();
  }

  getDiffPosts()async{
getStartUpPosts();
getBusinessPosts();
  notifyListeners();

}



}






