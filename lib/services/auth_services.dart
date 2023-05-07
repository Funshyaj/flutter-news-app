import 'package:hive/hive.dart';
import '../models/user.dart';

abstract class AuthenticationService {
  login(username, password);
}

class AuthenticationServiceImpl extends AuthenticationService {

  Box box = Hive.box('otherData');
  Box users = Hive.box<UserModel>('userdatabase');


  @override
  login(username, password) {

    //getting the username and password from the database
    String username0 = users.get(username).userName;
    String password0 = users.get(username).password;

print('passowrd is => $password0');

    if(username0==username && password0==password){
      print('correct and ready to login');
      box.put('currentUser', username0);
      return true;
    }
    else{
      print('incorrect password');
      return false;
    }
  }

}

