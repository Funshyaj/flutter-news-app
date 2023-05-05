import 'package:demo_app/app/app.locator.dart';
import 'package:demo_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class WelcomeViewModel extends BaseViewModel {

  // Setup NavigationService
  final _navigationService = locator<NavigationService>();


  navToSignUp(){
    _navigationService.navigateTo(Routes.signUpView);
  }

}