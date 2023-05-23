import 'package:hive/hive.dart';
import '../models/user.dart';

abstract class AuthenticationService {
  Future<String> login(String username, String password);
}

class AuthenticationServiceImpl extends AuthenticationService {

  Box box = Hive.box('otherData');
  Box users = Hive.box<UserModel>('userdatabase');


  @override
  Future<String> login(String username, String password) async{

    if (users.containsKey(username) == false){
      return 'User does not exist';
    }

    //getting the username and password from the database when there is a username
    String username0 = await users.get(username).userName;
    String password0 = await users.get(username).password;

   if(username0==username && password0==password){
      await box.put('currentUser', username0);
      return 'Welcome $username0';
    }
    else {
      return 'Wrong password';
    }
  }
}

