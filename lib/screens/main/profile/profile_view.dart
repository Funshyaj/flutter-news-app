import 'package:demo_app/screens/main/profile/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';


class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
        viewModelBuilder: ()=> ProfileViewModel(),
        builder:(context, model ,child)=> const Scaffold(
          body: Center(
            child:
            Text('test')
          ),
        ));
  }
}
