import 'package:demo_app/app/app.locator.dart';
import 'package:demo_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../services/startup_services.dart';

class StartUpViewModel extends BaseViewModel {

  // Setup NavigationService
  final _navigationService = locator<NavigationService>();

  //set up startup service
  final _startUpService = locator<StartUpService>();


  firstTimeLogic() async {
    // run checker from service
    if (await _startUpService.userFirstTimeChecker()) {
      //navigate to welcome if the value for firstTime is true
      return _navigationService.navigateTo(Routes.welcomeView);
    }
    else {
      //navigate to login if false
      return _navigationService.navigateTo(Routes.loginView);
    }
  }

}