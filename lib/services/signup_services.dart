import 'package:hive/hive.dart';
import '../models/user.dart';

abstract class SignUpService {
  bool signUpLogic(fullName,username,email,password);
  setNonFirstTime();
}

class SignUpServiceImpl extends SignUpService {

  Box box = Hive.box('otherData');
  Box users = Hive.box<UserModel>('userdatabase');

  @override
   signUpLogic(fullName,username, email, password){
    //adding new user object to Hive
     users.put(username,
        UserModel(fullName: fullName,
            userName: username,
            email: email,
            password: password));

    // setting the current user
     box.put('currentUser', username);
    //letting me know its done saving and ready to navigate
      return true;



  }

  @override
  setNonFirstTime() async{
    await box.put('firstTime', false);
  }

}

