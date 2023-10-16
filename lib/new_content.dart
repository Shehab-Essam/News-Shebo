import 'package:flutter/material.dart';
import 'package:news_project/my_theme.dart';
import 'model/NewsResponse.dart';

class NewsContent extends StatelessWidget {
   static const String routeName='NewsContent';
    News? news;
   @override
  Widget build(BuildContext context) {
     var args =ModalRoute.of(context)?.settings.arguments as NewsArgs;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(args.title,
          style:Theme.of(context).textTheme.titleLarge ,),
      ),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
         Center(
           child: Column(
             children: [
               const SizedBox(height: 10,),
               ClipRRect(
                 borderRadius: BorderRadius.circular(18),
                 child: Image.network(args.path,
                   width:  double.infinity,
                   height: MediaQuery.of(context).size.height*0.3,fit:BoxFit.fill,),),
               const SizedBox(height: 20,),
               Row(
                 children: [Container(padding: EdgeInsets.all(10),
                   child: Text('Content : ',style:Theme.of(context).textTheme.titleMedium!.copyWith(color: MyTheme.black,
                   fontWeight:FontWeight.bold,),textAlign: TextAlign.start,),
                 ),],),
               const SizedBox(height: 2,),
               Container(padding: const EdgeInsets.all(12),
                 child: Text(args.content,style: Theme.of(context).textTheme.titleMedium!.copyWith(color: MyTheme.darkBlue,
           fontWeight:FontWeight.bold,)
                 ),
               ),
             const SizedBox(height: 20,),
             Text('For More Click Here :',textAlign: TextAlign.left,style: Theme.of(context).textTheme.titleMedium!.copyWith(color: MyTheme.black,
           fontWeight:FontWeight.bold,)),
             Container(padding: const EdgeInsets.all(12),
               child: InkWell(
                 child: Text(args.url,style: Theme.of(context).textTheme.titleSmall!.copyWith(color: MyTheme.blue,
                   fontWeight:FontWeight.normal,)
                 ),
               ),
             )],
           ),
         )
        ],
      ),
    );
  }
}
class NewsArgs
{
  String title ;
  String path;
  String content ;
  String url ;
  int index ;
  NewsArgs({required this.title,required this.path,required this.content,required this.index,required this.url});
}

