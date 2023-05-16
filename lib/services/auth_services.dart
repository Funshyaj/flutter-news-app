import 'package:hive/hive.dart';
import '../models/user.dart';

abstract class AuthenticationService {
  login(username, password);
}

class AuthenticationServiceImpl extends AuthenticationService {

  Box box = Hive.box('otherData');
  Box users = Hive.box<UserModel>('userdatabase');


  @override
  login(username, password) async{

    if (users.containsKey(username) == false){
      return 'user does not exist';
    }

    //getting the username and password from the database when there is a username
    String username0 = await users.get(username).userName;
    String password0 = await users.get(username).password;

   if(username0==username && password0==password){
      box.put('currentUser', username0);
      return 'Welcome';
    }

    else {
      return 'Wrong password';
    }

  }

}

