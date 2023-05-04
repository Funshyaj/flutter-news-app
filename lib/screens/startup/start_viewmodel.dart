import 'package:demo_app/app/app.locator.dart';
import 'package:demo_app/app/app.router.dart';
import 'package:hive/hive.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../services/auth_service.dart';

class StartUpViewModel extends BaseViewModel {

  // Setup Authentication and NavigationService
  final _authenticationService = locator<AuthenticationService>();
  final _navigationService = locator<NavigationService>();


  firstTimeLogic()async{
   if(_authenticationService.userFirstTimeChecker()){
     _navigationService.navigateTo(Routes.startUpView);
   }
   else {
     _navigationService.navigateTo(Routes.loginView);
   }
  }

  navToSignUp(){
    _authenticationService.setNonFirstTime();
    _navigationService.navigateTo(Routes.signUpView);
  }

}