import 'package:News_Daily/custom%20components/profile_deets_row.dart';
import 'package:News_Daily/screens/main/profile/profile_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';


class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return ViewModelBuilder<ProfileViewModel>.reactive(
        viewModelBuilder: ()=> ProfileViewModel(),
        onViewModelReady: (model)=>model.fetchUserInfo(),
        builder:(context, model ,child)=>  Scaffold(
          backgroundColor: Colors.indigo[50],
          body: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              height: getValueForScreenType<double>(
                context: context,
                mobile: height *0.89,
                tablet: height,
                desktop: height,
              ),
              child: Column(
                children: [

Container(
  padding: const EdgeInsets.only(top:40),
    height: getValueForScreenType<double>(
      context: context,
      mobile: height * 0.4, //40%
      tablet: height * 0.6,
      desktop: height * 0.4,
    ),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children:[
      Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.indigo[100],
              borderRadius: const BorderRadius.all(Radius.circular(100),)),
        child: Icon(CupertinoIcons.person_fill,size: 120,color: Colors.indigo[800],),),
 const SizedBox(height: 10,),
  Text(model.username,
    style: TextStyle(fontWeight: FontWeight.bold,
        color: Colors.indigo[900],
        fontSize: 30),),
  ])),


                  const SizedBox(height: 20,),


                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))
                      ),
                      padding: const EdgeInsets.only(top: 40 , bottom: 0,left: 30,right: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          DeetsRow(icon: CupertinoIcons.person,
                              text: model.fullName,
                              themeColor: Colors.indigoAccent.shade100,
                              ),

                          DeetsRow(icon: CupertinoIcons.mail_solid,
                              text: model.email,
                              themeColor: Colors.indigoAccent.shade400,),

                          DeetsRow(icon: CupertinoIcons.settings,
                              text: 'Settings',
                              themeColor: Colors.blueAccent.shade100,),

                          GestureDetector(
                            onTap: (){
                              model.logOut();
                            },
                            child: DeetsRow(icon: Icons.logout,
                                text: 'Logout',
                                themeColor: Colors.redAccent.shade100,
                            ),
                          ),


                        ],
                      ),


                    ),
                  ),

                ],
              ),
            ),
          )


            ),
          );
  }
}
