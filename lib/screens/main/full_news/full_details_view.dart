import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../custom components/pad.dart';

class FullDetails extends StatelessWidget {
  const FullDetails({Key? key, required this.title, this.author, this.description, this.url, this.urlToImage, this.publishedAt, this.content}) : super(key: key);

  final String ? author; //used
  final String ? title;//used
  final String ? description;//used
  final String ? url;
  final String ? urlToImage;//used
  final String ? publishedAt; //used
  final String ? content; //used
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
            Pad(hor: 10, ver: 20,
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed:(){
                    Navigator.pop(context);
                  }, icon: const Icon(CupertinoIcons.back,weight:20,)
                  ),
                  Row(
                    children: [
                      IconButton(onPressed:(){}
                       , icon: const Icon(CupertinoIcons.bookmark,weight:20,)
                      ),

                      IconButton(onPressed:(){
                     }, icon: const Icon(CupertinoIcons.share,weight:20,)
                      ),
                    ],
                  )
                ],
              ),),


             Pad(ver: 10,hor: 10,
                 widget: Text(title??'No Title',
                 style: const TextStyle(
                   fontSize: 22,
                   fontWeight: FontWeight.bold,
                 ),
                   textAlign: TextAlign.justify,
                 )),

              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(image:NetworkImage(urlToImage??'https://picsum.photos/200/300')
                      ,fit: BoxFit.fill
                  ),
                ),
              ),

              Pad(ver: 10,hor: 5,
                  widget: Text(description??'No description',
                  textAlign: TextAlign.justify,)),

              SizedBox(
                height: 60,
                child: Pad(hor: 5,
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                    Expanded(
                      child: Text(author??'Unknown author',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(publishedAt??'Today')
                    ]),
                ),
              ),

              Pad(ver: 10,hor: 5,
                  widget: Text(content??'No content available',
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),
                  )),

              const Pad(ver: 10,hor: 5,
                  widget: Text('view full news at...'))




            ]
          ),
        )
      ),
    );
  }
}
