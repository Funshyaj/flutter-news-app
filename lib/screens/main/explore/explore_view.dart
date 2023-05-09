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
        disposeViewModel: false,
        initialiseSpecialViewModelsOnce: true,
      builder: (context, model, child) =>
      Scaffold(
        body:model.isBusy ?
        Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.indigo[200]),
          ),
        )
            : !model.hasError ?
        SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padded(
                      widget: Text('StartUps news',
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
                        itemCount: 10/*model.data?.length??0*/,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context,index) {
                          StartUpArticle article = model.data![index];
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
                      widget: Text('Tech news',
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
                        itemCount: 10/*model.data?.length??0*/,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context,index) {
                          StartUpArticle article = model.data![index+11];
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