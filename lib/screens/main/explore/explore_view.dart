import 'package:demo_app/custom%20components/home_post_card.dart';
import 'package:demo_app/models/sPost.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../custom components/explore_post_card.dart';
import '../../../custom components/padded.dart';
import 'explore_viewmodel.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ExploreViewModel>.reactive
      (viewModelBuilder: () => ExploreViewModel(),
        onViewModelReady: (model)=> model.getDiffPosts(),
        disposeViewModel: false,

      builder: (context, model, child) =>
      Scaffold(
        body: model.startUpPosts.isEmpty ?
        Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.indigo[200]),
          ),
        )
            : model.startUpPosts.isNotEmpty ?
        SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padded(
                      widget: Text('Business news',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),),
                    ),
                    //
                    ListView.separated(
                        shrinkWrap: true,
                        key: const PageStorageKey('storage-key'),
                        //this is what will be the separator among the mapped items
                        separatorBuilder: (context, index)=> const SizedBox(height: 10,),
                        itemCount: 10,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context,index) {
                          var article = model.businessPosts[index];
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
                      widget: Text('News on start ups',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),),
                    ),

                    ListView.separated(
                        shrinkWrap: true,
                        // key: const PageStorageKey('storage-key1'),
                        //this is what will be the separator among the mapped items
                        separatorBuilder: (context, index)=> const SizedBox(height: 10,),
                        itemCount: 10,
                        key: const PageStorageKey('storage-key1'),
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context,index) {
                          StartUpArticle article = model.startUpPosts[index];
                          return ePostCard(
                              article.author,
                              article.title,
                              article.description,
                              article.url,
                              article.urlToImage,
                              article.publishedAt.toString(),
                              article.content);

                        }),

                    const Padded(
                      widget: Text('More on start ups',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),),
                    ),

                    ListView.separated(
                        shrinkWrap: true,
                        // key: const PageStorageKey('storage-key1'),
                        //this is what will be the separator among the mapped items
                        separatorBuilder: (context, index)=> const SizedBox(height: 10,),
                        itemCount: 10,
                        key: const PageStorageKey('storage-key2'),
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context,index) {
                          StartUpArticle article = model.startUpPosts[index+11];
                          return ePostCard(
                              article.author,
                              article.title,
                              article.description,
                              article.url,
                              article.urlToImage,
                              article.publishedAt.toString(),
                              article.content);

                        }),
                  ],
                ),
              ),
            )
        //recommended for you text

            :  Container(
          color: Colors.red,
          alignment: Alignment.center,
          child: Text(
            model.error.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
          ),
        ),

      )
    );
  }
}