import 'dart:math';

import 'package:demo_app/custom%20components/profile_deets_row.dart';
import 'package:demo_app/screens/main/profile/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';


class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ViewModelBuilder<ProfileViewModel>.reactive(
        viewModelBuilder: ()=> ProfileViewModel(),
        onViewModelReady: (model)=>model.fetchUserInfo(),
        disposeViewModel: false,
        fireOnViewModelReadyOnce: true,
        builder:(context, model ,child)=>  Scaffold(
          backgroundColor: Colors.indigo[50],
          drawer: Container(
            decoration: BoxDecoration(
              color: Colors.indigoAccent.shade200
            ),
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.all(10),
            width: width * 0.4,
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
          drawerEdgeDragWidth: 70,
          body: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
Container(
  padding: EdgeInsets.only(top:40),
  height: height * 0.4,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children:[
      Container(
        padding:EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.indigo[100],
              borderRadius: BorderRadius.all(Radius.circular(100),)),
        child: Icon(Icons.person_outline,size: 120,color: Colors.indigo[800],),),
SizedBox(height: 10,),
  Text(model.username,
    style: TextStyle(fontWeight: FontWeight.bold,
        color: Colors.indigo[900],
        fontSize: 30),),
  ])),


                  const SizedBox(height: 20,),


                  Container(
                    height: height * 0.49,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))
                    ),
                    padding: const EdgeInsets.only(top: 50 , bottom: 0,left: 40,right: 40),
                    child: Column(
                      children: [
                        DeetsRow(icon: Icons.person_rounded,
                            text: model.fullName,
                            themeColor: Colors.indigoAccent.shade100,),

                        DeetsRow(icon: Icons.email,
                            text: model.email,
                            themeColor: Colors.indigoAccent.shade400),

                        DeetsRow(icon: Icons.settings,
                            text: 'Settings',
                            themeColor: Colors.blueAccent.shade100),

                        GestureDetector(
                          onTap: (){
                            model.logOut();
                          },
                          child: DeetsRow(icon: Icons.logout,
                              text: 'Logout',
                              themeColor: Colors.redAccent.shade100),
                        ),


                      ],
                    ),


                  ),

                ],
              ),
            ),
          )));
  }
}
