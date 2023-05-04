import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../app/app.router.dart';

class SignUpViewModel extends BaseViewModel{


  final _navigationService = locator<NavigationService>();
void NavToLogin(){
  _navigationService.navigateTo(Routes.loginView);
}

}


