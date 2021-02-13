




 import 'package:Slango/database/DbHelper.dart';
import 'package:Slango/model/User.dart';
import 'package:Slango/networking/Auth.dart';
import 'package:Slango/ui/home/HomeScreen.dart';
import 'package:Slango/ui/login/rounded_button.dart';
import 'package:Slango/ui/offline/NetworkCheckUtill.dart';
import 'package:Slango/ui/offline/OfflineScreen.dart';
import 'package:Slango/ui/rate/RateApp.dart';
import 'package:Slango/ui/share/ShareScreen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
 import 'package:flutter_svg/flutter_svg.dart';

import '../../model/Constants.dart';

class ProfileScreen extends StatelessWidget {
   Auth auth ;

   @override
   Widget build(BuildContext context) {
     //init auth fb
     auth = Auth(ctx: context);
     auth.initFb();
     //

     return Scaffold(
       appBar: AppBar(


          centerTitle: true,
           backgroundColor: Colors.transparent,
          title: Text('Profile' , style: TextStyle(color: Colors.black), ),
          elevation: 0.0, // Elevation Shadow
          leading: IconButton(
            color: Colors.black,
           icon: new Icon(Icons.arrow_back_ios_rounded),
            onPressed: () { Navigator.pop(context); },
         ),

       ) ,
       body: Container(
         width: double.infinity,
         child: StreamBuilder(
           stream: networkStatusStream(),
           builder: (context, snapshot) {
             if ( snapshot.hasData) {
               checkNetworkStatus(snapshot.data);
             }
             if( netState){return SafeArea(
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Column(
                     crossAxisAlignment: CrossAxisAlignment.center ,
                     children: [
                       Divider (height: 10 , endIndent: double.infinity,indent: double.infinity,),
                       profileHead(),
                       Divider (height: 20 , endIndent: double.infinity,indent: double.infinity,),
                       Text(HomeScreen.user.name .toUpperCase(),textAlign: TextAlign.center, style: TextStyle(fontWeight:FontWeight.w400 , fontSize: 20, wordSpacing: 2.5 , color: Colors.black87),) ,
                       Divider (height: 50 , endIndent: double.infinity,indent: double.infinity,),

                       Card(
                         child: ListTile(
                             leading: const Icon(Icons.favorite , color: Colors.pink,),
                             trailing: Text(
                                 '${HomeScreen.user.likes}',style: TextStyle(fontSize: 15),),
                             title: const Text("Likes"),
                             onTap: () => print("ListTile")
                         ),),
                       Card(
                         child: ListTile(
                             leading: const Icon(Icons.leaderboard , color: Colors.orangeAccent,),
                             trailing: Text(HomeScreen .user.score.toString(),style: TextStyle(fontSize: 15),),
                             title: const Text("Score"),
                             onTap: () => print("ListTile")
                         ),),
                       Card(
                         child: ListTile(
                             leading: const Icon(Icons.share , color: kPrimaryColor,),
                             title: const Text("Share App"),
                             onTap: () => showShareSc(context)
                         ),),
                       Card(
                         child: ListTile(
                             leading: const Icon(Icons.star_half , color: Colors.yellow,),
                             title: const Text("Rate App"  ),
                             onTap: () => showRateApp(context)
                         ),),
                       // Divider (height: 180 , endIndent: double.infinity,indent: double.infinity,),
                       Container(
                         margin: EdgeInsets.only(top: 64),
                         child: Expanded(
                           child: OutlineButton(
                             padding:EdgeInsets.all(12),
                             child: Text("Logout", style: TextStyle(color: Colors.black54),  ),
                             highlightedBorderColor: Colors.pink,

                             shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(100)),
                             onPressed:  auth.logout  ,
                           ),
                         ),
                       ),


                       // onBackgroundImageError: (_,__){} ,
                     ]
                 ),
               ),


             );}
             else {
               return  OfflineScreen();
             }

           }
         ),
         ),
       );

   }
  Widget profileHead(){
    return CircleAvatar(
        radius: 70,backgroundColor: Colors.white,
        child :
        ClipOval(
          child: CachedNetworkImage(
              imageUrl: "nFTLRBfrzwtzpvU2oqRLwtw3I-A",
              placeholder: (context, url) =>  Center(child: Container (width: 40,height: 40, child: CircularProgressIndicator(backgroundColor: Colors.white,) )),
              errorWidget: (context, url, error) => SvgPicture.asset(logoPath,height: 250,width: double.infinity, fit: BoxFit.fill,)),
        )


    );
  }
   Future<int> getLikesNumber() async{
     int count ;
     DbHelper.databaseInit().then((value) { DbHelper.getData(HomeScreen .user.uid).then((list) =>  count = list.length);
     return count ;
     });
   }

}

