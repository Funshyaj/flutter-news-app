import 'package:demo_app/custom%20components/post_card.dart';
import 'package:demo_app/models/post.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../custom components/padded.dart';
import '../../../models/bPost.dart';
import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      viewModelBuilder: () => HomeViewModel(),
        builder: (context, model, child) =>
          Scaffold(
             body:model.isBusy ?
             Center(
               child: Column(
                 mainAxisSize: MainAxisSize.max,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: <Widget>[
                   CircularProgressIndicator(
                     valueColor: AlwaysStoppedAnimation(Colors.purple[200]),
                   ),
                   const Text(
                     'Loading Posts',
                     style: TextStyle(color: Colors.white),
                   )
                 ],
               ),
             )
             : !model.hasError ?
             // SingleChildScrollView(
             //   child:
             SingleChildScrollView(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                   children: [

                     //recommended for you text
                    const Padded( widget: Text('Recommended news for you',
                         style: TextStyle(
                             fontWeight: FontWeight.bold,
                             fontSize: 24,
                         ),),
                     ),

                   const Padded(widget: Text('Business headlines',
                         style: TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 24,
                         ),
                         textAlign: TextAlign.left,
                       ),
                     ),
                     ListView.separated(
                       shrinkWrap: true,
                       key: const PageStorageKey('storage-key'),
                         //this is what will be the separator among the mapped items
                         separatorBuilder: (context, index)=> const SizedBox(height: 10,),
                         itemCount: 3/*model.data?.length??0*/,
                       itemBuilder: (context,index) {
                         Article article = model.data![index];
                         return PostCard(
                             article.author,
                             article.title,
                             article.description,
                             article.url,
                             article.urlToImage,
                             article.publishedAt.toString(),
                             article.content);
                       }),

                 const Padded(widget: Text('News on tech startups',
                         style: TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 24,
                         ),),
                     ),

                     ListView.separated(
                         shrinkWrap: true,
                         // key: const PageStorageKey('storage-key'),
                         //this is what will be the separator among the mapped items
                         separatorBuilder: (context, index)=> const SizedBox(height: 10,),
                         itemCount: 3/*model.data?.length??0*/,
                         itemBuilder: (context,index) {
                           Article article = model.data![index];
                           return PostCard(
                               article.author,
                               article.title,
                               article.description,
                               article.url,
                               article.urlToImage,
                               article.publishedAt.toString(),
                               article.content);
                         }),




                      const Padded(widget: Text('News in Africa',
                         style: TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 24,
                         ),),
                     ),

            // model.data!.map((e){ return  Text('2').toList();




                   ],
          ),
             )
             // )


           :  Container(
               color: Colors.red,
               alignment: Alignment.center,
               child: Text(
                 model.error.toString(),
                 textAlign: TextAlign.center,
                 style: const TextStyle(color: Colors.white),
               ),
             ),

           ),
        );
  }
}

//
// Container(
// margin: const EdgeInsets.only(top: 30),
// padding: const EdgeInsets.all(10),
// child: Column(
// children: const [Padding(
// padding: EdgeInsets.symmetric(vertical: 8.0),
// child: Text('Tech news recommended for you',
// style: TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 24,
// ),),
// ),
// ]
// ),
// )