import 'package:stacked/stacked.dart';
import '../../../app/app.locator.dart';
import '../../../services/fetch_post_services.dart';

class ExploreViewModel extends BaseViewModel{

  //  setting uo services
  final _fetchPostServices = locator<FetchPostService>();


  fetch(){
    _fetchPostServices.fetchPosts();

  }

}


