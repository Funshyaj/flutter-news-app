import 'package:demo_app/custom%20components/box.dart';
import 'package:demo_app/custom%20components/spacers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LandingScreen  extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    const double padding = 25;
    // creating a safe area removes the overflow to the notch
    return SafeArea(
        //a scaffold is a general wrapper
        child: Scaffold(
      //    the scaffolds body returns a sizedBox
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children:  [
           // header buttons
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding, vertical: padding),
           child: Row(
             // padding:EdgeInsets.all(9.0),
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children:  [
               GestureDetector(
                 onTap: () {
                   if (kDebugMode) {
                     print("menu was clicked");
                   }
                 },
                 child: const Box(padding:EdgeInsets.all(8.0), height:50, width:50, child: Icon(Icons.menu, color: Colors.black,)),
               ),
               GestureDetector(
                 onTap: () {
                   if (kDebugMode) {
                     print("settings was clicked");
                   }
                 },
                 child: const Box(padding:EdgeInsets.all(8.0), height:50, width:50, child: Icon(Icons.settings, color: Colors.black,)),
               ),
             ],
           ),
      ),
            verticalSpace(),


        //text heads
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children:  [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text('Welcome to Disney land',
                    style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontFamily: 'sans'),),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text('We are very good,fdjnskurfbdsufsdffsmk'),
                ),
              ]
            ),
            verticalSpace(),

          ],
        ),
        ),


          //  image test
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Image(
                image: AssetImage('assets/images/copy.jpg'),height:300,width: 400,
              ),
            ),
          ],
        ),
      ),
    )
    );
  }
}