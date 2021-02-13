
import 'package:Slango/database/DbHelper.dart';
import 'package:Slango/model/User.dart';
import 'package:Slango/networking/Auth.dart';
import 'package:Slango/networking/Cloud.dart';
import 'package:Slango/networking/AdmobAds.dart';
import 'file:///E:/Dart/Projects/slango/slango/lib/model/Constants.dart';
import 'package:Slango/ui/leaderboard/LeaderboardScreen.dart';
import 'package:Slango/ui/likes/LikesScreen.dart';

import 'package:Slango/ui/offline/NetworkCheckUtill.dart';
import 'package:Slango/ui/offline/OfflineScreen.dart';
 import 'package:Slango/ui/slangs/SlangsScreen.dart';
import 'package:flutter/material.dart';
 import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  static User user = User();
  static bool  initFirstTime = true ;
  static AdmobAds admobAds = AdmobAds();


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

     Size size = MediaQuery.of(context).size;

    Widget body(){
      return    homeScreens[_selectedIndex];
    }

    return Scaffold(
        bottomNavigationBar:btnNavGoole() ,
        extendBody: true        ,
      body:   Container(
      //  color: backroundLogoColour,
       // decoration: BoxDecoration(gradient: gradient),
        width: double.infinity,
        height: size.height,
        child:StreamBuilder(
          stream: networkStatusStream(),
          builder: (BuildContext context, snapshot) {
            if ( snapshot.hasData) {
              checkNetworkStatus(snapshot.data);
            }
            if( netState){return body();}
            else {
              return  OfflineScreen();
            }

          },       ),
      ),
    );
  }

  //Btn Nav Settings
   //Screens List
   List<Widget> homeScreens = [
     LikesScreen(),
     SlangsScreen(),
     LeaderboardScreen()
  ];
  int _selectedIndex=1;
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;

      switch(index){
        case 0 : {
           HomeScreen.admobAds.showLikesBanner(context);
           HomeScreen.admobAds.hideSlangsBanner();

         break;
        }
        case 1 :  {
          HomeScreen.admobAds.showSlangsBanner(context);
          HomeScreen.admobAds.hideLikesBanner();


          

          break;
        }
        case 2 :  {
          HomeScreen.admobAds.hideSlangsBanner();
          HomeScreen.admobAds.hideLikesBanner();
          //
          // if(HomeScreen.admobAds.slangsBanner!=null)HomeScreen.admobAds.slangsBanner.dispose();
          // if(HomeScreen.admobAds.likesBanner!=null)HomeScreen.admobAds.likesBanner.dispose();

          break;
        }
      }
    });
  }
  Widget btnNavGoole(){
    return  Container(
      //color: Colors.transparent,
       //margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration( color: Colors.white, borderRadius: BorderRadius.circular(20.0),
             boxShadow: [
               
              BoxShadow( blurRadius: 20, color: Colors.black.withOpacity(.1))
            ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 11),
            child: GNav(

              gap: 8,
              activeColor: Colors.white,
              //activeColor: (_selectedIndex==0)?  Colors.pink:(_selectedIndex==1)?Colors.deepPurpleAccent:Colors.orangeAccent,
              iconSize: 24,

              //tabBackgroundGradient: gradient,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              //duration: Duration(milliseconds: 200),
              // tabBackgroundColor: Colors.grey[800],
              tabBackgroundColor: (_selectedIndex==0)?  Colors.pink:(_selectedIndex==1)?Colors.deepPurpleAccent:Colors.orangeAccent,
              tabs: [
                GButton(
                  icon: Icons.favorite_outline,
                  text: 'Likes',
                  iconColor:Colors.pink ,

                ),
                GButton(
                  icon: Icons.home_outlined,
                  iconColor:gradient.colors[1] ,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.leaderboard_outlined,
                  iconColor:Colors.orangeAccent ,
                  text: 'Leaderboard',
                ),

              ],
              selectedIndex: _selectedIndex,
              onTabChange: _onItemTap ,
            ),
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
     if (HomeScreen.initFirstTime){
      HomeScreen.admobAds.initAdmob();
        HomeScreen.initFirstTime=false ;
      //int fb user
      Auth().getUserUid().then(

              (uid) {
            HomeScreen.user.uid = uid;
            //get user score + name
            CloudDb().getUser(HomeScreen.user.uid).then(
                    (userMap) {
                      HomeScreen.user.name=userMap['name'];
                      HomeScreen.user.score=userMap['score'];
                    }
            );

            //init db + get likes count
            DbHelper.databaseInit().then((value) { DbHelper.getData(HomeScreen.user.uid).then((list) {
              HomeScreen.user.likes = list.length ;
            });});

            //leaderboard get score list only

    }
                           );


      Future.delayed(Duration.zero,() {
        HomeScreen.admobAds.showSlangsBanner(context);
      });

    }




  }

  @override
  void didChangeDependencies() {
    context;
  }
}
