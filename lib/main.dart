import 'package:Slango/model/Constants.dart';
import 'package:Slango/UI/splash/SplashScreen.dart';
import 'package:Slango/ui/forget-password/ForgetPass.dart';
import 'package:Slango/ui/home/HomeScreen.dart';
import 'package:Slango/ui/intro/IntroSliderScreens.dart';
import 'package:Slango/ui/leaderboard/LeaderboardScreen.dart';
import 'package:Slango/ui/likes/LikesScreen.dart';
import 'package:Slango/ui/offline/NetworkCheckUtill.dart';
import 'package:Slango/ui/offline/OfflineScreen.dart';
import 'package:Slango/ui/profile/ProfileScreen.dart';
import 'package:Slango/ui/register/SignupScreen.dart';
import 'package:Slango/ui/slangs/SlangsScreen.dart';
 import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ui/login/LoginScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) {
    runApp(new MyApp());
  });}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
         debugShowCheckedModeBanner: false,
        initialRoute: 'splash',

      routes: appRoutes,



    );
  }
}


final appRoutes =   {
   'intro': (context) => IntroSliderScreens(),
  'splash': (context) => SplashScreen(),
  'offline': (context) => SplashScreen(),
  'login': (context) => LoginScreen(),
  'forget': (context) => ForgetPassScreen(),
  'register': (context) => SignUpScreen(),
  'home': (context) => HomeScreen(),
  'slangs': (context) => SlangsScreen(),
  'likes': (context) => LikesScreen(),
  'leaderboard': (context) => LeaderboardScreen(),
  'profile': (context) => ProfileScreen(),
};





