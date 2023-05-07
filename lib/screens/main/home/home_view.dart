import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
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
             SingleChildScrollView(
               child: Column(
                 children: [
                   //recommended for you text
                   const Padding(
                     padding: EdgeInsets.symmetric(vertical: 8.0),
                     child: Text('Tech news recommended for you',
                       style: TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 24,
                           fontFamily: 'NunitoBold'
                       ),),
                   ),
                   ListView.separated(
                     key: const PageStorageKey('storage-key'),
                       //this is what will be the separator among the mapped items
                       separatorBuilder: (context, int index)=> const SizedBox(height: 20,),
                       itemCount: model.data!.length,
                     itemBuilder: (context,index)=>
                         Container(
                           // width: size.width,
                             padding: const EdgeInsets.all(10),
                             child: Row(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   //post image set a background of this container
                                   Container(
                                     height: 100,width: 100,
                                     decoration: BoxDecoration(
                                       borderRadius: const BorderRadius.all(Radius.circular(10)),
                                       image: DecorationImage(
                                           image: NetworkImage(model.data![index].publishedAt,),
                                           fit: BoxFit.cover),
                                     ),
                                   ),
                                   const SizedBox(width: 10,),
                                   Expanded(
                                     child: Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         mainAxisAlignment: MainAxisAlignment.start,
                                         children:  [
                                           Text(model.data![index].author,
                                             style: const TextStyle(
                                                 color: Colors.grey,
                                                 fontSize: 12
                                             ),),

                                           const SizedBox(height: 10,),

                                           Text(model.data![index].title,
                                               style: const TextStyle(
                                                   fontSize: 12,
                                                   fontWeight: FontWeight.bold,
                                                   color: Colors.black
                                               ),
                                               textDirection: TextDirection.ltr,
                                               textAlign: TextAlign.left),

                                           const SizedBox(height: 20,),

                                           Text(model.data![index].publishedAt,
                                             style: const TextStyle(
                                                 fontSize: 12,
                                                 fontWeight: FontWeight.w500,
                                                 color: Colors.grey
                                             ),),

                                         ] ),
                                   ),
                                 ] )
                         )

                   ),
                 ],
               ),
             )
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