import 'package:hive/hive.dart';

abstract class AuthenticationService {
  bool userLoggedIn();
}


class AuthenticationServiceImpl extends AuthenticationService {
  @override
   bool userLoggedIn() {
    //   var box = await Hive.openBox('userDatabase');
    // if(1==1) {
      return true;
    // }
  }
}

