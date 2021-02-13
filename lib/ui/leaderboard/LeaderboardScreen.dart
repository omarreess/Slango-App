


import 'package:Slango/model/User.dart';
import 'package:Slango/networking/Cloud.dart';
import 'file:///E:/Dart/Projects/slango/slango/lib/model/Constants.dart';
import 'package:Slango/ui/home/HomeScreen.dart';
import 'package:Slango/ui/slangs/SlangsScreen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LeaderboardScreen extends StatelessWidget {
   List <User> userScoreList  = List() ;


  @override
  Widget build(BuildContext context)
  {
    double sizeWidth = MediaQuery.of(context).size.width.toDouble();
    double sizeHeight = MediaQuery.of(context).size.height.toDouble();




    Widget userScoreListItemUi (int index , double width)
    {
     return Container(
         width: double.infinity,
         height: 44,
         child:

         Row(
           //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             Text('${index+1}') ,
             VerticalDivider (width: width*0.059 , endIndent: double.infinity,indent: double.infinity,),
             CircleAvatar(

                 radius: 20,backgroundColor: Colors.transparent,
                 child :
                 ClipOval(
                   child: CachedNetworkImage(
                       imageUrl: "nFTLRBfrzwtzpvU2oqRLwtw3I-A",
                       placeholder: (context, url) =>  Center(child: Container (width: 40,height: 40 ,child: CircularProgressIndicator(backgroundColor: Colors.white,) )),
                       errorWidget: (context, url, error) => SvgPicture.asset(logoPath,height: 125,width: double.infinity, fit: BoxFit.fill,)),
                 )


             ),
             VerticalDivider (width: width*0.03 , endIndent: double.infinity,indent: double.infinity,),

             Container( width:width*0.27  ,child: Text('${  userScoreList[index].name[0].toUpperCase()  +userScoreList[index].name.substring(1)} ', style: TextStyle(fontSize: 16),)) ,

             VerticalDivider (width: width*0.1 , endIndent: double.infinity,indent: double.infinity,),

             Container(width:30 , height :42 , child: (index==0)?Text('🥇' , style: TextStyle(fontSize: 28),):(index==1)?Text('🥈' , style: TextStyle(fontSize: 28)):(index==2)?Text('🥉', style: TextStyle(fontSize: 28)):Text(' ') ,),
             VerticalDivider (width: width*0.1 , endIndent: double.infinity,indent: double.infinity,),

             Text('${userScoreList[index].score}',style: TextStyle(fontSize: 20)) ,

           ],)


     )
     ;
   }
    Widget userScoreListUi ()
    {
      return ListView.separated(
        separatorBuilder: (context, index) => Divider(
          thickness: 0.03,
        ),
        itemCount: userScoreList.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(left: 5 , right: 5 , bottom: 10),
          child: userScoreListItemUi(index, sizeWidth),
        ),
      );
    }

    Widget slangsBody (){

    //slang[0].toUpperCase() +slang.substring(1)
      final userFirstName =
          HomeScreen.user.name[0].toUpperCase()  +HomeScreen.user.name.substring(1,HomeScreen.user.name.indexOf(' ', 0));

      return Container(
        decoration: BoxDecoration(gradient: gradient),
        child: Stack(
           children: [
             Container(width: double.infinity,
               height:sizeHeight*0.25 ,child:
               Container(
                   child: Column(

                 children: [
                   AppBar(
                     actions: <Widget>[
                       profileHead(context)

                     ],
                     automaticallyImplyLeading : false ,

                     backgroundColor: Colors.transparent,
                     title: Text('Leaderboard' , style: TextStyle(fontSize: 30,color: Colors.white), ),
                     elevation: 0.0,
                   ),
                   Container(margin: EdgeInsets.only(top: sizeHeight*0.06),child:
                   Text("${userFirstName}'s Score is ${HomeScreen.user.score}"
                     , style: TextStyle(color: Colors.white,fontSize: 28),)),
                 ],
               )),),
             Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height:sizeHeight*0.68,
          width: double.infinity,
          padding: EdgeInsets.only(right: 20, left: 20 , top:0 , bottom: 9),
          decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft:Radius.circular(29.0),topRight:Radius.circular(29.0)),color: Colors.white,)
          ,child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top:10),
                  child: Text ('Top Weekly 🏆' ,textAlign:TextAlign.center , style: TextStyle(fontSize: 30),)),
              Container(
              height:sizeHeight*0.60,

              child:(userScoreList.isEmpty)?
              FutureBuilder(
                future: CloudDb().getUsersScoreList(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error');
                  }
                  if (snapshot.hasData) {
                    List<QueryDocumentSnapshot> usersMap = snapshot.data.docs;
                    usersMap.forEach(
                            (item) {
                               userScoreList.add(User(name: item['name'],score:item['score'] )) ;

                    }
                    );
                     return userScoreListUi();
                  }
                   return Center(
                    child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),),
                      child: CircularProgressIndicator(

                         valueColor: AlwaysStoppedAnimation(kPrimaryColor),
                         backgroundColor: Colors.transparent,
                      ),
                    ),
                  );
                }
              ) :
              userScoreListUi()
              ),
            ],
          ),

        )),

           ],

        ),
      );

    }

    return Scaffold(

      body:  slangsBody(),
    );


  }


}
