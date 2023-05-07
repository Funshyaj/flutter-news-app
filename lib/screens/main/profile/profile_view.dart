import 'package:demo_app/screens/main/profile/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';


class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
        viewModelBuilder: ()=> ProfileViewModel(),
        onViewModelReady: (model)=>model.fetchUserInfo(),
        disposeViewModel: false,
        fireOnViewModelReadyOnce: true,
        builder:(context, model ,child)=>  Scaffold(
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(model.fullName),
                  Text(model.email),
                  Text(model.username)
                ],
              ),
            ),
          )));
  }
}
