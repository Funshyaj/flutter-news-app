import 'package:demo_app/services/fetch_post_services.dart';
import 'package:stacked/stacked.dart';
import '../../../app/app.locator.dart';

class HomeViewModel extends BaseViewModel{

//  setting uo services
final _fetchPostServices = locator<FetchPostService>();


fetch(){
_fetchPostServices.fetchPosts();

}


}