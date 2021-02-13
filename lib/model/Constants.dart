import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';

const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);
//intro
final introPageDecoration  =const[PageDecoration(
  titleTextStyle: TextStyle(color: kPrimaryColor,fontWeight: FontWeight.w500, fontSize: 36.0),
  bodyTextStyle: TextStyle(wordSpacing: 0.5,color: Colors.black , fontWeight: FontWeight.w300, fontSize: 18.0),
  boxDecoration:BoxDecoration(color:    Color.fromRGBO(213, 211, 234, 1)
  )  ,
),

  PageDecoration(
    titleTextStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w500, fontSize: 36.0),
    bodyTextStyle: TextStyle(wordSpacing: 0.5,color: Colors.black , fontWeight: FontWeight.w300, fontSize: 18.0),
    boxDecoration:BoxDecoration(color:    Color.fromRGBO(255, 138, 128, 1)
    )  ,
  ),
  PageDecoration(
    titleTextStyle: TextStyle(color: Color.fromRGBO(255, 171, 64, 1),fontWeight: FontWeight.w500, fontSize: 36.0),
    bodyTextStyle: TextStyle(wordSpacing: 0.5,color: Colors.black , fontWeight: FontWeight.w300, fontSize: 18.0),
    boxDecoration:BoxDecoration(color:    Color.fromRGBO(255, 224, 178, 1)
    )  ,
  )] ;

//Splash
final logoPath = 'assets/logosvg.svg';
final appName = 'Slango';
final progressbarColour = Colors.indigoAccent;
final backroundLogoColour = Color(int.parse('#D5D3EA'.replaceAll('#', '0xff')));
final gradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    // colors: [Color(int.parse('#473171'.replaceAll('#', '0xff'))),Color(int.parse('#8a417a'.replaceAll('#', '0xff'))) , Color(int.parse('#c05b7a'.replaceAll('#', '0xff'))) ,Color(int.parse('#e78178'.replaceAll('#', '0xff'))), Color(int.parse('#FFAF7B'.replaceAll('#', '0xff')))]);
   // colors: [Color(int.parse('#554474'.replaceAll('#', '0xff'))) , Color(int.parse('#E07264'.replaceAll('#', '0xff')))]);
     colors: [Color(int.parse('#554474'.replaceAll('#', '0xff'))),Color(int.parse('#8a417a'.replaceAll('#', '0xff')))  ,Color(int.parse('#c05b7a'.replaceAll('#', '0xff'))) ,  Color(int.parse('#E07264'.replaceAll('#', '0xff'))) ,Color(int.parse('#e78178'.replaceAll('#', '0xff'))) ]);

final appNameStyle =  GoogleFonts.cairo(color:Colors.white ,decoration: TextDecoration.none ,fontWeight: FontWeight.bold );

//Admob
 final adsAppId = 'ca-app-pub-6808778866074990~3162970335';
 final adHomeBanner = 'ca-app-pub-6808778866074990/9153663617' ;
final adLikesBanner = 'ca-app-pub-6808778866074990/1095210197' ;
final testBanner = 'ca-app-pub-3940256099942544/8865242552' ;
 final testInitir = 'ca-app-pub-3940256099942544/7049598008' ;
 final adHomeInitir = 'ca-app-pub-6808778866074990/1658316971' ;