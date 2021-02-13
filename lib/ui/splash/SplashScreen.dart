
import 'package:Slango/model/Constants.dart';
import 'package:Slango/ui/offline/OfflineScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';


    //  introduction_screen: ^1.0.7


class SplashScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return  FutureBuilder(
       future: _initialization,
      builder: (context, snapshot) {
         if (snapshot.hasError) {
          return OfflineScreen();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done ||snapshot.connectionState == ConnectionState.waiting) {
          Future.delayed(const Duration(milliseconds: 3000), () {


            //1st time
            checkPref().then(
                    (firstTime) {
              if(firstTime) {
                 Navigator.pushReplacementNamed(context, 'intro');}
              else {

                //not 1st time
                Navigator.pushReplacementNamed(context, 'login');              }
            });
           });

          return splashBody();

        }


        // return SplashScreen();

      },
    )  ;
  }
  Widget splashBody (){
    return Container(
      color:backroundLogoColour,

      child: Padding(
        padding: const EdgeInsets.only(top: 200),
        child: SafeArea(
          child: Column(
            children: [

              Container(  decoration: BoxDecoration(borderRadius: BorderRadius.circular(35.0),),
                  child: Hero(tag: 'logoSplash',child: SvgPicture.asset(logoPath,height: 250,width: double.infinity,))),
              Divider(indent: double.infinity, height: 110,endIndent: double.infinity,) ,
              Text(appName,style:appNameStyle,),
              Container( padding: EdgeInsets.all(15),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.0),),
                child: LinearProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(progressbarColour),
                  minHeight: 2.5,
                  backgroundColor: Colors.transparent,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> checkPref() async{
    final prefs = await SharedPreferences.getInstance();

     bool checked = prefs.getBool('1st time') ?? true;
     if (checked)  prefs.setBool('1st time', false);

    return checked;
  }
}

