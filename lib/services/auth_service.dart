import 'package:hive/hive.dart';

abstract class AuthenticationService {
  userLoggedIn();
  setNonFirstTime();
  userFirstTimeChecker();
}

class AuthenticationServiceImpl extends AuthenticationService {
  @override
  userFirstTimeChecker() async{
    var box = await Hive.openBox('userDatabase');
    bool firstTime =  box.get('firstTime', defaultValue: true);
    return firstTime ;
  }

  @override
    setNonFirstTime() async{
      var box = await Hive.openBox('userDatabase');
      box.put('firstTime', false);
  }



  @override
   userLoggedIn() {
    // TODO: implement userLoggedIn
    throw UnimplementedError();
  }


}

