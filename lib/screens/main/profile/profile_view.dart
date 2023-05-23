import 'package:demo_app/custom%20components/headerText.dart';
import 'package:demo_app/custom%20components/padded.dart';
import 'package:demo_app/custom%20components/profile_deets_row.dart';
import 'package:demo_app/screens/main/profile/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import '../../../custom components/pad.dart';


class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ViewModelBuilder<ProfileViewModel>.reactive(
        viewModelBuilder: ()=> ProfileViewModel(),
        onViewModelReady: (model)=>model.fetchUserInfo(),
        builder:(context, model ,child)=>  Scaffold(
          backgroundColor: Colors.indigo[50],
          body: SingleChildScrollView(
//             child: SizedBox(
//               width: double.infinity,
//               height: getValueForScreenType<double>(
//                 context: context,
//                 mobile: height *0.89,
//                 tablet: height,
//                 desktop: height,
//               ),
//               child: Column(
//                 children: [
// Container(
//   padding: const EdgeInsets.only(top:40),
//     height: getValueForScreenType<double>(
//       context: context,
//       mobile: height * 0.4, //40%
//       tablet: height * 0.6,
//       desktop: height * 0.4,
//     ),
//   child: Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     crossAxisAlignment: CrossAxisAlignment.center,
//     children:[
//       Container(
//         padding: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//             color: Colors.indigo[100],
//               borderRadius: const BorderRadius.all(Radius.circular(100),)),
//         child: Icon(Icons.person_outline,size: 120,color: Colors.indigo[800],),),
//  const SizedBox(height: 10,),
//   Text(model.username,
//     style: TextStyle(fontWeight: FontWeight.bold,
//         color: Colors.indigo[900],
//         fontSize: 30),),
//   ])),
//
//
//                   const SizedBox(height: 20,),
//
//
//                   Expanded(
//                     child: Container(
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(50),
//                             topRight: Radius.circular(50))
//                       ),
//                       padding: const EdgeInsets.only(top: 50 , bottom: 0,left: 40,right: 40),
//                       child: Column(
//                         children: [
//                           DeetsRow(icon: Icons.person_rounded,
//                               text: model.fullName,
//                               themeColor: Colors.indigoAccent.shade100,
//                               addPaddingBottom: true,),
//
//                           DeetsRow(icon: Icons.email,
//                               text: model.email,
//                               themeColor: Colors.indigoAccent.shade400,
//                               addPaddingBottom: true,),
//
//                           DeetsRow(icon: Icons.settings,
//                               text: 'Settings',
//                               themeColor: Colors.blueAccent.shade100,
//                               addPaddingBottom: true,),
//
//                           GestureDetector(
//                             onTap: (){
//                               model.logOut();
//                             },
//                             child: DeetsRow(icon: Icons.logout,
//                                 text: 'Logout',
//                                 themeColor: Colors.redAccent.shade100,
//                               addPaddingBottom: false,
//                             ),
//                           ),
//
//
//                         ],
//                       ),
//
//
//                     ),
//                   ),
//
//                 ],
//               ),
//             ),




          child: Column(
            children: [
              Pad(
                  ver:15, hor:10,
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const HeaderText(text: "Breaking News"),
                  TextButton(onPressed: (){
                    print('see more pressed');
                  }, child: const Text('View all'))
                ],
              )),

              SizedBox(
                height: 200,
                child: ListView.separated(
                    separatorBuilder: (context, index)=> const SizedBox(width: 10,),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder:  (context,index) {
                    return Container(
                      width: width * 0.8,
                      // color: Colors.indigo[500],
                      decoration:  const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(
                            20)),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffDDDDDD),
                            blurRadius: 10.0,
                            spreadRadius: 10.0,
                            offset: Offset(0.0, 40.0),
                          )
                        ],

                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/welcome.jpg"),
                            fit: BoxFit.cover),
                      ),

                      child: const Center(child: Text('Item 2', style: TextStyle(fontSize: 18, color: Colors.white),)),
                    );
                  })
              )],
              ),

          )


            ),
          );
  }
}
