import 'package:demo_app/custom%20components/post_card.dart';
import 'package:demo_app/screens/main/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../custom components/shimmer_box_card.dart';
import '../../../custom components/shimmer_row_card.dart';
import '../../../models/post.dart';
import '../full_news/full_details_view.dart';
import 'home_viewmodel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo_app/custom%20components/headerText.dart';
import '../../../custom components/category_selection_button.dart';
import '../../../custom components/pad.dart';
import 'package:flutter/cupertino.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) =>
          Scaffold(
              key: model.scaffoldState,
             drawer: Drawer(
               child: ListView(
                 children: <Widget>[
                   Container(
                       height: 30.0
                   ),
                   ListTile(
                     title: Text('Explore'),
                     leading: Icon(Icons.explore),
    onTap: () {
    // Update the state of the app
    // ...
    // Then close the drawer
    Navigator.pop(context);
    },
                   ),
                   ListTile(
                     title: Text('Saved'),
                     leading: const Icon(Icons.bookmark),
    onTap: () {
    // Update the state of the app
    // ...
    // Then close the drawer
    Navigator.pop(context);
    },
                   ),
                   ListTile(
                     title: Text('Profile'),
                     leading: Icon(Icons.person),
                     onTap: () {
                 // Update the state of the app
                 // ...
                 // Then close the drawer
                 Navigator.pop(context);
          },
                   ),
                   ListTile(
                     title: Text('Settings'),
                     leading: Icon(Icons.settings),
    onTap: () {
    Navigator.pop(context);
    },
                   ),
                   ListTile(
                     title: Text('Logout'),
                     leading: Icon(Icons.logout),
                     onTap: () {
                         // Update the state of the app
                         // ...
                         // Then close the drawer
                         Navigator.pop(context);
                       },
                   ),
                 ],
               ),
             ),
             body:
             SingleChildScrollView(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                   children: [

                     Column(
                       children: [

                         Pad(hor: 10, ver: 10,
                         widget: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             IconButton(onPressed:(){
                               model.scaffoldState.currentState?.openDrawer();
                               }, icon: const Icon(Icons.menu_rounded,weight:20,)
                             ),
                             IconButton(onPressed:(){
                               Navigator.push(context,
                                   MaterialPageRoute(builder: (context) => const ProfileView()
                               ));
                             },
                              icon: const Icon(Icons.person_rounded,weight:20)),
                           ],
                         ),),

                         Pad(hor:10,
                             widget: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 const HeaderText(text: "Breaking News"),
                                 TextButton(onPressed: (){
                                 }, child: const Text('View all'))
                               ],
                             )),

                 model.isBusy ?
                 const ShimmerBoxCard()
                     : model.hasError ?
                 SizedBox(
                   height: 180,
                   width: width * 0.83,
                   // decoration:  BoxDecoration(
                   //   color: Colors.grey[400],
                   //   borderRadius: const BorderRadius.all(Radius.circular(10)),
                   // ),
                     child: Expanded(
                       child: Column(
                         children: [
                          const Pad( ver:5 ,widget: Text('Something went wrong')),
                          const Pad( ver:5 ,widget: Text('Check your network connection')),
                           IconButton(onPressed: (){
                             model.futureToRun();
                           }, icon: const Icon(CupertinoIcons.refresh))
                         ],
                       ),
                     )
                 )
                     :
                         CarouselSlider.builder(
                             itemCount: 15,
                             itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                               Article article = model.data![0][itemIndex];
                               return Stack(
                                 children: <Widget>[
                                   Container(
                                     decoration: BoxDecoration(
                                       borderRadius: const BorderRadius.all(Radius.circular(20)),
                                       image: DecorationImage(image:NetworkImage(article.urlToImage.toString())
                                         ,fit: BoxFit.fill
                                         ),
                                     ),
                                   ),
                                   GestureDetector(
                                     onTap:(){
                                       Navigator.push(context,
                                           MaterialPageRoute(builder: (context) => FullDetails(
                                               title:article.title.toString(),
                                               author : article.author,
                                               description : article.description,
                                               url : article.url.toString(),
                                               urlToImage: article.urlToImage,
                                               publishedAt:  article.publishedAt.toString(),
                                               content: article.content
                                           )));
                                     },
                                     child: Container(
                                       padding: const EdgeInsets.all(5.0),
                                       alignment: Alignment.bottomCenter,
                                       decoration: BoxDecoration(
                                         borderRadius: const BorderRadius.all(Radius.circular(20)),
                                         gradient: LinearGradient(
                                           begin: Alignment.topCenter,
                                           end: Alignment.bottomCenter,
                                           colors: <Color>[
                                             Colors.black.withAlpha(20),
                                             Colors.black45,
                                             Colors.black,
                                           ],
                                         ),
                                       ),
                                       child: Text(article.title.toString(),
                                         textAlign: TextAlign.center,
                                         style: const TextStyle(color: Colors.white, fontSize: 18.0,fontWeight: FontWeight.bold ),

                                       ),
                                     ),
                                   ),
                                 ],
                               );},
                             options: CarouselOptions(
                               aspectRatio: 16/9 ,
                               viewportFraction: 0.83,
                               initialPage: 1,
                               enableInfiniteScroll: false,
                               enlargeCenterPage: true,
                               enlargeFactor: 0.3,
                             )
                         ),


                         Pad(ver: 30, hor:5,
                           widget: SizedBox(
                             height: 45,
                             child: ListView(
                               scrollDirection: Axis.horizontal,
                               children: ['business', 'sports' , 'africa', 'start ups'].asMap().entries.map((entry) {
                                 return Builder(
                                     builder: (BuildContext context) {
                                       return InkWell(
                                           onTap: (){
                                             model.switcher(entry.value);
                                             model.switchColor(entry.key);
                                           },
                                           child: CategorySelectionButton(text: entry.value,
                                              txt: model.colors[entry.key], bg:model.colors[entry.key+1]
                                             ,));
                                     }
                                 );
                               }).toList(),
                             ),
                           ),),



                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 10),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               const HeaderText(text: "Recommendations"),
                               TextButton(onPressed: (){
                               }, child: const Text('View all'))
                             ],
                           ),
                         ),

                         model.isBusy ?
                             Pad(
                               hor: 16,
                               widget: Column(
                                 children: const [
                                   ShimmerRowCard(),
                                   SizedBox(height: 20,),
                                   ShimmerRowCard()
                                 ],
                               ),
                             )
                             : model.hasError ?
                         SizedBox(
                             child: Expanded(
                               child: Column(
                                 children: const [
                                 ],
                               ),
                             )
                         )
                             :
                         ListView.separated(
                             padding: const EdgeInsets.all(6),
                             shrinkWrap: true,
                             separatorBuilder: (context, index)=> const SizedBox(height: 10,),
                             itemCount:5,
                             physics: const BouncingScrollPhysics(),
                             itemBuilder: (context,index) {
                               Article article = model.allNewsCategories[
                               model.categories == 'business' ? 1
                                   :model.categories == 'sports'? 2
                                   :model.categories == 'africa' ? 3
                                   : 4
                               ][index];
                               return InkWell(
                                 highlightColor:Colors.grey[500],
                                 borderRadius: const BorderRadius.all(Radius.circular(20)),
                                 onTap:(){
                                   Navigator.push(context,
                                       MaterialPageRoute(builder: (context) =>FullDetails(
                                         title:article.title.toString(),
                                         author : article.author,
                                         description : article.description,
                                         url : article.url.toString(),
                                         urlToImage: article.urlToImage,
                                         publishedAt:  article.publishedAt.toString(),
                                         content: article.content
                                           )));
                                 },
                                 child: PostCard(
                                     article.author,
                                     article.title.toString(),
                                     article.description,
                                     article.url.toString(),
                                     article.urlToImage,
                                     article.publishedAt.toString(),
                                     article.content)
                               );
                             }),


                       ],
                     ),],
          ),
             )

           ),
        );
  }
}
