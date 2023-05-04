import 'package:hive/hive.dart';

import '../models/user.dart';

abstract class AuthenticationService {
  userLoggedIn();
  setNonFirstTime();
  userFirstTimeChecker();
  signUpLogic(fullName,username,email,password);
  login(username, password);
}

class AuthenticationServiceImpl extends AuthenticationService {

  Box box = Hive.box('otherData');
  Box users = Hive.box<UserModel>('userdatabase');
  
  @override
  userFirstTimeChecker() async{
    bool firstTime =  box.get('firstTime', defaultValue: true);
    return firstTime ;
  }

  @override
    setNonFirstTime() async{
     await box.put('firstTime', false);
  }

  @override
   userLoggedIn() {
    // TODO: implement userLoggedIn
    throw UnimplementedError();
  }

  @override
  signUpLogic(fullName,username, email, password)async {
    //get users
    //adding new user
    await users.put(username,
        UserModel(fullName: fullName,
            userName: username,
            email: email,
            password: password));

  }

  @override
  login(username, password) async{
    //getting the username and passsword from the database

    String _username = users.get(username).userName;
    String _password = users.get(username).password;

print(_password);

    if(_username==username && _password==password){
      print('correct and ready to login');
    }
    else{
      print('incorrect password');
    }
  }


}

