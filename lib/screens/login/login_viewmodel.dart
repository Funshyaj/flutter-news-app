import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  String title = 'not updated';
  late TextEditingController email;
  late String password;

  void doSomething() {
    title += ' updated ';
    // this will call the builder defined in the view file and rebuild the ui using
    // the update version of the model.
   rebuildUi();
  }
}