import 'package:flutter/material.dart';
import 'package:news_project/api_manger.dart';
import 'package:news_project/model/NewsResponse.dart';
import 'package:news_project/model/SourceResponse.dart';
import 'package:news_project/news_item.dart';

class NewsContainer extends StatefulWidget {
  Sources source ;
  NewsContainer({required this.source});

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
        future: ApiManager.getNewsBySourceId(widget.source.id??''),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          }else if(snapshot.hasError){
            return Center(
              child: Column(
                children: [
                  const Text('something went wrong'),
                  ElevatedButton(onPressed:(){ApiManager.getNewsBySourceId(widget.source.id??'');
                  setState(() {});} ,
                      child: const Text('Try Again'))
                ],
              ),
            );
          }
          if(snapshot.data?.status!='ok'){
            return Center(
              child:Text(snapshot.data?.message??''),
            );
          }
          var newList = snapshot.data?.articles??[];
          return ListView.builder(
              itemBuilder:(context,index){
                return NewsItem(news: newList[index],index:index,);
              },
              itemCount: newList.length,
          );
        }
    );
  }
}
