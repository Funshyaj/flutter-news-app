import 'package:demo_app/app/app.router.dart';
import 'package:hive/hive.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../models/user.dart';

class ProfileViewModel extends BaseViewModel{


  //set up for navigation
  final _navigationService = locator<NavigationService>();

//will run all logic and services here

late String username;
late String fullName;
late String email;

  Box box = Hive.box('otherData');
  Box users = Hive.box<UserModel>('userdatabase');


 fetchUserInfo(){
    String currentUser = box.get('currentUser');
    UserModel userDetails = users.get(currentUser);
    username = userDetails.userName;
    fullName = userDetails.fullName;
    email = userDetails.email;
  }

  logOut(){
    _navigationService.clearStackAndShow(Routes.loginView);
  }

}

