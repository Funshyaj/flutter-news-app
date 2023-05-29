import 'package:News_Daily/custom%20components/post_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../app/app.locator.dart';
import '../../../custom components/headerText.dart';
import '../../../custom components/pad.dart';
import '../../../custom components/padded.dart';
import '../../../custom components/shimmer_row_card.dart';
import '../../../models/post.dart';
import 'explore_viewmodel.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ExploreViewModel>.reactive
      (viewModelBuilder: () => locator<ExploreViewModel>(),
        disposeViewModel: false,
        initialiseSpecialViewModelsOnce: true,
      builder: (context, model, child) =>
      Scaffold(
        body:
        SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padded(
                      widget: HeaderText(text: "Business News"),
                    ),

                    model.isBusy ?
                    Pad(
                      hor: 16,
                      widget: Column(
                        children: const [
                          ShimmerRowCard(),
                          SizedBox(height: 20,),
                          ShimmerRowCard(),
                          SizedBox(height: 20,),
                          ShimmerRowCard(),
                          SizedBox(height: 20,),
                          ShimmerRowCard()
                        ],
                      ),
                    )

                  : model.hasError ?

                    SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Pad( ver:5 ,widget: Text('Something went wrong')),
                            const Pad( ver:5 ,widget: Text('Check your network connection')),
                            IconButton(onPressed: (){
                              model.initialise();
                            }, icon: const Icon(CupertinoIcons.refresh))
                          ],
                        )
                    )

                        :
                    Column(
                      children :[
                    ListView.separated(
                        shrinkWrap: true,
                        key: const PageStorageKey('storage-key'),
                        //this is what will be the separator among the mapped items
                        separatorBuilder: (context, index)=> const SizedBox(height: 10,),
                        itemCount: 10,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context,index) {
                          var article = model.allNewsCategories[1][index];
                          return PostCard(
                              article.author,
                              article.title,
                              article.description,
                              article.url,
                              article.urlToImage,
                              article.publishedAt.toString(),
                              article.content);
                        }),

                    const Padded(
                      widget: HeaderText(text: "News on Start ups"),
                    ),

                    ListView.separated(
                        shrinkWrap: true,
                        //this is what will be the separator among the mapped items
                        separatorBuilder: (context, index)=> const SizedBox(height: 10,),
                        itemCount: 10,
                        key: const PageStorageKey('storage-key1'),
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context,index) {
                          Article article = model.allNewsCategories[4][index];
                          return PostCard(
                              article.author,
                              article.title,
                              article.description,
                              article.url,
                              article.urlToImage,
                              article.publishedAt.toString(),
                              article.content);

                        }),

          const Padded(
            widget: HeaderText(text: "Sports News"),
          ),

                    ListView.separated(
                        shrinkWrap: true,
                        //this is what will be the separator among the mapped items
                        separatorBuilder: (context, index)=> const SizedBox(height: 10,),
                        itemCount: 10,
                        key: const PageStorageKey('storage-key2'),
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context,index) {
                          Article article = model.allNewsCategories[2][index];
                          return PostCard(
                              article.author,
                              article.title,
                              article.description,
                              article.url,
                              article.urlToImage,
                              article.publishedAt.toString(),
                              article.content);

                        })  ,


                        const Padded(
            widget: HeaderText(text: "Africa News"),
          ),

                    ListView.separated(
                        shrinkWrap: true,
                        //this is what will be the separator among the mapped items
                        separatorBuilder: (context, index)=> const SizedBox(height: 10,),
                        itemCount: 10,
                        key: const PageStorageKey('storage-key3'),
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context,index) {
                          Article article = model.allNewsCategories[3][index];
                          return PostCard(
                              article.author,
                              article.title,
                              article.description,
                              article.url,
                              article.urlToImage,
                              article.publishedAt.toString(),
                              article.content);

                        }),
                      ])
                  ],
                ),
              ),
            )

      )
    );
  }
}