import 'package:flutter/material.dart';
import 'package:news_project/api_manger.dart';
import 'package:news_project/my_theme.dart';
import 'package:news_project/tab_container.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName='category';

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('News App',
          style:Theme.of(context).textTheme.titleLarge ,),
      ),
      body: FutureBuilder(
          future:ApiManager.getSources(),
          builder:(context,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),
              );
            }else if(snapshot.hasError){
              return Center(
                child: Column(
                  children: [
                    const Text('something went wrong'),
                    ElevatedButton(onPressed:(){ApiManager.getSources();
                      setState(() {});} ,
                        child: const Text('Try Again'))
                  ],
                ),
              );
            }
            if(snapshot.data?.status!='ok'){
              return Center(
                child: Column(
                  children: [
                    Text(snapshot.data?.message??''),
                    ElevatedButton(
                        onPressed:(){} , child: const Text('Try Again'))
                  ],
                ),
              );
            }
            var sourceList = snapshot.data?.sources??[];
            return TabContainer(sourceList: sourceList);
          }
      ),
    );
  }
}
