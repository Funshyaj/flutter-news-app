import 'package:hive/hive.dart';
import '../models/user.dart';

abstract class SignUpService {
  Future<bool> signUpLogic(fullName, username, email, password);
  setNonFirstTime();
}

class SignUpServiceImpl extends SignUpService {
  Box box = Hive.box('otherData');
  Box users = Hive.box<UserModel>('userdatabase');

  @override
  Future<bool> signUpLogic(fullName, username, email, password) async {
    //check if user with that username exist
    if (users.containsKey(username)){
      return false;
    }
    //adding new user object to Hive
    await users.put(
        username,
        UserModel(
            fullName: fullName,
            userName: username,
            email: email,
            password: password));

    // setting the current user
    await box.put('currentUser', username);

    //letting me know its done saving and ready to navigate
    if (users.containsKey(username)){
      return true;
    }
    else {
      return false;
    }
  }

  @override
  setNonFirstTime() async {
    await box.put('firstTime', false);
  }
}
