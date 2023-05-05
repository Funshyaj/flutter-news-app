import 'package:hive/hive.dart';

abstract class StartUpService {
  userFirstTimeChecker();
}

class StartUpServiceImpl extends StartUpService {

  Box box = Hive.box('otherData');

  @override
  userFirstTimeChecker() async{
    bool firstTime =  box.get('firstTime', defaultValue: true);
    return firstTime ;
  }


}

