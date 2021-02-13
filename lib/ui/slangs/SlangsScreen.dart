


import 'dart:math';

import 'file:///E:/Dart/Projects/slango/slango/lib/model/SlangsWords.dart';
import 'package:Slango/database/DbHelper.dart';
import 'package:Slango/model/Slang.dart';
import 'package:Slango/networking/AdmobAds.dart';
import 'package:Slango/networking/Cloud.dart';
import 'package:Slango/networking/SlangMeanRequest.dart';
import 'package:Slango/ui/home/HomeScreen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 import 'package:flutter_tts/flutter_tts.dart';
import 'package:http/http.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toast/toast.dart';

import '../../model/Constants.dart';
import 'package:http/http.dart' as http ;

class SlangsScreen extends StatefulWidget {
  @override
  _SlangsScreenState createState() => _SlangsScreenState();
}

class _SlangsScreenState extends State<SlangsScreen> {
  Slang slang = Slang();
  bool liked = false;
  ValueKey adKey;
  DateTime oldTime , newTime;


  @override
  void initState() {
   }

  @override
  Widget build(BuildContext context) {

          Widget slangsBody (){
            //getting Random Slang with checking not null
        if(!liked) { slang.slang = slangsWords[ Random().nextInt(3200)];
         (slang.slang.isEmpty)?slang.slang= slangsWords[ Random().nextInt(3200)]:null;}




       double sizeWidth = MediaQuery.of(context).size.width.toDouble();
      double sizeHeight = MediaQuery.of(context).size.height.toDouble();
      Widget slangMeanBody ( )
      {
        return  Column(
          children: [

            Padding(padding: EdgeInsets.all(35) ,
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),

                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                    Divider (height: sizeHeight*0.02 , endIndent: double.infinity,indent: double.infinity,),
                    Row(mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                      children: [
                        Container(width :sizeWidth*0.55 ,  child: Text(slang.slang[0].toUpperCase() +slang.slang.substring(1),style: TextStyle(color:Colors.white,fontSize: 45), )),
                       //  VerticalDivider (  width: sizeWidth*0.02 ),
                        GestureDetector(onTap:(){speakWord(slang.slang);},child: Icon(Icons.volume_up,color:Colors.white,) , ),
                        // VerticalDivider (width: sizeWidth*0.1 ),
                        GestureDetector(onTap:likeTap,
                            child: Icon(Icons.favorite , color:(liked)? Colors.pink :Colors.white,))


                      ],),

                    Divider (height: sizeHeight*0.04 , endIndent: double.infinity,indent: double.infinity,),
                    Text('Definition.' , style: TextStyle(color:Colors.white,fontSize:18 ,fontWeight:FontWeight.w200 )),
                    Divider (height: sizeHeight*0.004 , endIndent: double.infinity,indent: double.infinity,),

                    Text(slang.def, maxLines: 3,style: TextStyle(color:Colors.white,fontSize:19 ,fontWeight: FontWeight.w300 )),
                    Divider (height: sizeHeight*0.03 , endIndent: double.infinity,indent: double.infinity,),

                    Text('Ex.', style: TextStyle(color:Colors.white,fontSize:18 ,fontWeight:FontWeight.w200 )),
                    Divider (height: sizeHeight*0.004 , endIndent: double.infinity,indent: double.infinity,),

                    Text(slang.ex, maxLines: 3,style: TextStyle(color:Colors.white,fontSize:19 ,fontWeight: FontWeight.w300 )),
                  ],),
              ),),


          ],
        );
      }

      return Stack(
        children: [
           Column(
             children: [
               AppBar(
                actions: <Widget>[
                  profileHead(context)

                ],

                automaticallyImplyLeading : false ,
                //centerTitle: true,
                backgroundColor: Colors.transparent,
                title: Text('Slango' , style: TextStyle(fontSize: 30, color: Colors.white), ),
                elevation: 0.0, // Elevation Shadow
          ),

          Container( color: Colors.transparent,width: double.infinity,height: 68,),


                (!liked)? FutureBuilder<Slang>(
        future:   SlangMean().getSlangMeanHttp(slang.slang)          ,
            // asyncdownloadData  work
        builder: (BuildContext context, AsyncSnapshot<Slang> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting: return Container(
              padding: EdgeInsets.all(25),
              margin: EdgeInsets.only(top: 100),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),),
              child: LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColorLight),
                minHeight: 2.5,
                backgroundColor: Colors.transparent,
              ),
            )	  		;

            case ConnectionState.done: {
              (snapshot.data==null)?WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {})) : slang =snapshot.data;
              return slangMeanBody();}
            default:
              if (snapshot.hasError)
                return Text('Error: ${snapshot.error}');
              else
                return Text('Result: ${snapshot.data}');
          }
        },


           ) : slangMeanBody(),
             ],

           ),
          Align(alignment: Alignment.bottomCenter,

            child: Container(
            width: 200,

            margin: EdgeInsets.only(bottom: sizeHeight*0.12),
            child: FloatingActionButton(
              backgroundColor: gradient.colors[1],
              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(35) ),
              onPressed: newslangBtn,
              child: Container(width:double.infinity, height: double.infinity,decoration:BoxDecoration(  borderRadius: BorderRadius.circular(35) ,),child: Center(child: Text('NEW SLANG' , textAlign:TextAlign.center , style: TextStyle(wordSpacing: 5,fontSize: 16),))),),
          ) ,)
        ],
      );
    }

    return Scaffold(


    body:Container(decoration: BoxDecoration(gradient: gradient),child: slangsBody()) ,

      // floatingActionButton:Container(
      //   width: 200,
      //
      //   child: FloatingActionButton(
      //     backgroundColor: gradient.colors[1],
      //     shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(35) ),
      //     onPressed: newslangBtn,
      //      child: Container(width:double.infinity, height: double.infinity,decoration:BoxDecoration(  borderRadius: BorderRadius.circular(35) ,),child: Center(child: Text('NEW SLANG' , textAlign:TextAlign.center , style: TextStyle(wordSpacing: 5,fontSize: 16),))),),
      // ) ,
      //
      // floatingActionButtonLocation:FloatingActionButtonLocation.centerFloat ,
    );
  }


  void newslangBtn (){

    if (liked){
      liked=false;

    }
      newTime = DateTime.now();

    //if null so it's 1st time
     if(oldTime!= null){
     var timeDiff =   newTime.subtract(Duration(seconds: 7)).compareTo(oldTime);
      if(timeDiff>0 || timeDiff==0){
        //time passed , Post new score
        HomeScreen.user.score++;
        CloudDb().postUserScore(HomeScreen.user);
       }
      else{
        //lessThan reqired time
        Toast.show("Only 1 Point in 7 seconds", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
      }
     }
    oldTime = newTime;
    setState((){
      if( HomeScreen.user.score%3 == 0 ){
        print('divide ysta');
        HomeScreen.admobAds.showSlangsInterstital();
      }

    }) ;


  }
   void likeTap (){

     //to avoid like tap on same word

    if (!liked){
      liked=true;
      //inset likes in Db
      DbHelper .insert({'slang':slang.slang , 'def':slang.def , 'ex':slang.ex , 'uid':HomeScreen.user.uid});
      HomeScreen.user.likes++;

      setState((){}) ;
    }

  }





}
Widget profileHead(BuildContext ctx){
  return Padding(
      padding: EdgeInsets.only( top:7 ,bottom:5 , right: 22   ),
      child: GestureDetector(
        onTap: () {
          HomeScreen.admobAds.hideSlangsBanner();
          HomeScreen.admobAds.hideLikesBanner();
          Navigator.pushNamed(ctx, 'profile');
         },

        child: Hero(tag: 'profileHead',
          child: CircleAvatar(

              radius: 23,backgroundColor: Colors.transparent,
              child :
              ClipOval(
                child: CachedNetworkImage(
                    imageUrl: "nFTLRBfrzwtzpvU2oqRLwtw3I-A",
                    placeholder: (context, url) =>  Center(child: Container (width: 40,height: 40 ,child: CircularProgressIndicator(backgroundColor: Colors.white,) )),
                    errorWidget: (context, url, error) => SvgPicture.asset(logoPath,height: 125,width: double.infinity, fit: BoxFit.fill,)),
              )


          ),
        ),

      )
  );
}

 Future<void> speakWord (String word) async  {
  FlutterTts flutterTts = FlutterTts();


  await flutterTts.setLanguage("en-US");
 await flutterTts.setSpeechRate(0.7);

  await flutterTts.setVolume(5.0);

   await flutterTts.setPitch(1.0);
  await flutterTts.speak(word);



}


