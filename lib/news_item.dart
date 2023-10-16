import 'package:flutter/material.dart';
import 'package:news_project/new_content.dart';
import 'model/NewsResponse.dart';
 class NewsItem extends StatelessWidget {
   News news;
   int index;
   NewsItem({required this.news,required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           InkWell(
             onTap: (){Navigator.of(context).pushNamed(NewsContent.routeName,
             arguments: NewsArgs(title:news.title??'',path:news.urlToImage??'', content: news.content??'',index:index,url:news.url??'')
             );},
             child: Container(
               width:  double.infinity,
               height: MediaQuery.of(context).size.height*0.3,
               child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.network(news.urlToImage??'',
                    width:  double.infinity,
                    height: MediaQuery.of(context).size.height*0.3,fit:BoxFit.fill,),),
             ),
           ),
           const SizedBox(height: 10,),
           Text(news.author??'',
               style: Theme.of(context).textTheme.titleSmall!.copyWith(
             fontSize: 14,color: Colors.grey
           )),
           const SizedBox(height: 10,),
           Text(news.title??'',
             style: Theme.of(context).textTheme.titleMedium!.copyWith(
               fontWeight:FontWeight.w400
             )),
           const SizedBox(height: 10,),
           Text(news.publishedAt??'',textAlign: TextAlign.end,
             style: Theme.of(context).textTheme.titleSmall!.copyWith(
               fontSize: 14,color: Colors.grey),)
        ],
      ),
    );
  }
}


//ClipRRect(
//           borderRadius: BorderRadius.circular(18),
//          child:CachedNetworkImage(imageUrl: news.urlToImage??'',
//            placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
//            errorWidget: (context, url, error) => const Icon(Icons.error),
//          )
//         )