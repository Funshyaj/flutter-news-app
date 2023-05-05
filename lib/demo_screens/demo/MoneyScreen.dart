import 'package:demo_app/custom%20components/demo/box.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../custom components/demo/circle.dart';

class MoneyScreen  extends StatelessWidget {
  const MoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    const double margin = 15;
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
                  padding: const EdgeInsets.symmetric(horizontal: margin, vertical: 10),
                  child: Row(
                    // padding:EdgeInsets.all(9.0),
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Expanded(child: Text("Business...", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                     ),

                      GestureDetector(
                        onTap: () {
                          if (kDebugMode) {
                            print("help button was clicked");
                          }
                        },
                        child: const  Circle(padding: EdgeInsets.all(4.0), height: 50, width: 50, child: Icon(Icons.help, color: Colors.white,))
                      ),

                      GestureDetector(
                        onTap: () {if (kDebugMode) {
                            print("settings was clicked");
                          }
                        },
                        child: const Box(padding:EdgeInsets.all(8.0), height:50, width:50, child: Icon(Icons.settings, color: Colors.black,)),
                      ),
                    ],
                  ),
                ),


                //box content
               Container(
                 height: 120,
                 margin: const EdgeInsets.only( bottom: 10,left:margin, right:margin),
                 padding: const EdgeInsets.all(15),
                 //decoration and styling
                 decoration: BoxDecoration(color: Colors.blue[700],
                    borderRadius: BorderRadius.circular(15),
                    ),
                    child:  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                   const Icon(Icons.verified_user
                        , size: 50, color: Colors.green,),
                      Column(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(right: 10, bottom: 5),
                              child: Text('We are very good,fdjnskurfbdsufsdffsmk'
                              ,style: TextStyle(color: Colors.white),),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 10, bottom: 5),
                              child: Text('We are very good,fdjnskurfbdsufsdffsmk'),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 10, bottom: 5),
                              child: Text('We are very good,fdjnskurfbdsufsdffsmk'),
                            ),
                          ]
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal:margin,vertical: 5),
                  padding: const EdgeInsets.all(5),
                  height: 120,
                  //decoration and styling
                  decoration: BoxDecoration(color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child:  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:  [

                      IconButton(onPressed: (){}, icon:const Icon(Icons.verified_user
                        , size: 50, color: Colors.green,)),
                     Expanded(
                         child: Padding(
                             padding: const EdgeInsets.only(top: 5,left: 20),
                             child:Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 7),
                              child: Text('Claim your Kippa account',
                              style:TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 17,
                              )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Text('Upload your ID to increase your limits and get a secure business account',
                              style: TextStyle(color: Colors.grey[600]),),
                            ),
                            Padding(
                              padding:  const EdgeInsets.only(bottom: 0),
                              child: Text('Get Started  >' ,
                              style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.blue[700])),
                            ),
                          ]
                             ) 
                         )
                     ),
                    ],
                  ),
                ),


                Container(
                    margin: const EdgeInsets.symmetric(horizontal:margin,vertical: 5),
                    padding: const EdgeInsets.all(5),

                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      SizedBox(
                        height: 140,
                        width: 180,

                        child: DecoratedBox(
                          // decoration and styling
                          decoration: BoxDecoration(color: Colors.lightBlue[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                         Icon(Icons.mark_email_unread_outlined, size: 70,),
                            Text('Request Money',
                            style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 15),)
                          ],
                        ),
                      )
                      ),
                      SizedBox(
                        height: 140,
                        width: 180,
                        child: DecoratedBox(
                          // decoration and styling
                          decoration: BoxDecoration(color: Colors.lightGreen[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.send,size: 70,),
                            Text('Send Money',
                              style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 15),)
                          ],
                        ),
                      ),
                      ),
                    ],
                )
                ),

                Container(
                    margin: const EdgeInsets.symmetric(horizontal:margin,vertical: 5),
                    padding: const EdgeInsets.all(5),

                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        SizedBox(
                            height: 140,
                            width: 180,

                            child: DecoratedBox(
                              // decoration and styling
                              decoration: BoxDecoration(color: Colors.lightBlue[100],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child:Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.phone_iphone_rounded, size: 70,),
                                  Text('Airtime and Data',
                                    style: TextStyle(fontWeight: FontWeight.bold,
                                        fontSize: 15),)
                                ],
                              ),
                            )
                        ),
                        SizedBox(
                          height: 140,
                          width: 180,
                          child: DecoratedBox(
                            // decoration and styling
                            decoration: BoxDecoration(color: Colors.lightGreen[100],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.receipt_long_rounded,size: 70,),
                                Text('Pay Bills',
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 15),)
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                ),


                //  image test
                // const Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 20),
                //   child: Image(
                //     image: AssetImage('assets/images/copy.jpg'),height:300,width: 400,
                //   ),
                // ),
              ],
            ),
          ),
        )
    );
  }
}