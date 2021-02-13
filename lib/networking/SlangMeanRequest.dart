




  import 'dart:convert';

import 'package:Slango/model/Slang.dart';
import 'package:http/http.dart';

class SlangMean {

    Slang slang = Slang();


    final headers = {"x-rapidapi-key": "9c02043f1bmsh93142affc502ca3p1b04fdjsn9dc9469a24f7" ,
      "x-rapidapi-host": "mashape-community-urban-dictionary.p.rapidapi.com"   } ;

    Future<Slang> getSlangMeanHttp(String word ) async
    {    final url = 'https://mashape-community-urban-dictionary.p.rapidapi.com/define?term=$word';

    slang.slang=word ;
      Response res = await get(url  , headers: headers);
      if (res.statusCode == 200) {
        Map<String , dynamic> body = jsonDecode(res.body);
        Map<String , dynamic> slangMap  = body["list"][0];
        slang..ex = slangMap["example"]
        ..def =  slangMap["definition"] ;
        print (slang.def);
        print('a7a');

         }

         return slang ;




    }

  }