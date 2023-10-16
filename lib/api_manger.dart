import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_project/api_constants.dart';
import 'package:news_project/model/NewsResponse.dart';
import 'package:news_project/model/SourceResponse.dart';

class ApiManager{
   static Future<Source> getSources() async {
     Uri url = Uri.https(ApiConstants.baseURL,ApiConstants.sourceAPI,{
       'apiKey':'91e601f0ab4c4c0b87a436ae0e9a5e72'
     });
     try{
       var response = await http.get(url);
       var bodyString = response.body;
       var json = jsonDecode(bodyString);
       return Source.fromJson(json);
     }catch(e){
      throw e ;
     }
   }

   static Future<NewsResponse> getNewsBySourceId(String sourceId)async{
     ///https://newsapi.org/v2/everything?q=bitcoin&apiKey=91e601f0ab4c4c0b87a436ae0e9a5e72
     Uri url = Uri.https(ApiConstants.baseURL,ApiConstants.newsAPI,{
       'apiKey' : '91e601f0ab4c4c0b87a436ae0e9a5e72',
       'sources' : sourceId
     });
     try{
     var response = await http.get(url);
     var bodyString = response.body;
     var json = jsonDecode(bodyString);
     return NewsResponse.fromJson(json);
     }catch(e){
       throw e ;
     }
   }
}