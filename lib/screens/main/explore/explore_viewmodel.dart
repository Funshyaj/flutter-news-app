import 'package:stacked/stacked.dart';
import '../../../app/app.locator.dart';
import '../../../models/post.dart';
import '../../../services/api_services.dart';

class ExploreViewModel extends FutureViewModel<List<List<Article>>>{

//  setting up services
  final _fetchNewsServices = locator<ApiService>();

  // final streamController = StreamController<List<Article>>();

  List<List<Article>> allNewsCategories = [] ;

  @override
  Future <List<List<Article>>> futureToRun()async {

    allNewsCategories.add(await _fetchNewsServices.getHeadlines()); // 0
    allNewsCategories.add(await _fetchNewsServices.getBusinessNews()); // 1
    allNewsCategories.add(await _fetchNewsServices.getSportsNews()); // 2
    allNewsCategories.add(await _fetchNewsServices.getAfricaNews()); // 3
    allNewsCategories.add(await _fetchNewsServices.getStartUpNews()); // 4
    notifyListeners();
    return allNewsCategories;
  }



}






