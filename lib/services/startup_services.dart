import 'package:hive/hive.dart';

abstract class StartUpService {
 Future<bool> userFirstTimeChecker();
}

class StartUpServiceImpl extends StartUpService {

  Box box = Hive.box('otherData');

  @override
  Future<bool>  userFirstTimeChecker() async{
    bool firstTime = await box.get('firstTime', defaultValue: true);
    return firstTime ;
  }
}

