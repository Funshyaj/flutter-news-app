import 'package:hive/hive.dart';
import 'package:stacked/stacked.dart';
import '../../../models/user.dart';

class ProfileViewModel extends BaseViewModel{


//will run all logic and services here

late String username;
late String fullName;
late String email;

  Box box = Hive.box('otherData');
  Box users = Hive.box<UserModel>('userdatabase');


 fetchUserInfo(){
    String currentUser = box.get('currentUser');
    UserModel userDetails = users.get(currentUser);
    username = userDetails.password;
    fullName = userDetails.fullName;
    email = userDetails.email;
  }

}

