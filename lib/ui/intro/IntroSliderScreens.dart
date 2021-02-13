






 import 'file:///E:/Dart/Projects/slango/slango/lib/model/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:introduction_screen/introduction_screen.dart';

 class IntroSliderScreens extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    //Pages
    var listPagesViewModel = [PageViewModel(
      title: "English Slangs",
      body: "Check daily english slangs with their Meaning , Examples and Pronunciation ",
      image:   Center(child: SvgPicture.asset(
        'assets/logosvg.svg',width: 200 , height: 250,
      )),
      decoration: introPageDecoration[0]
    ),

    PageViewModel(
    title: "Save your Favorite",
    body: "Save your favorite slangs \n to study it well",
    image:   Center(child: SvgPicture.asset(
      'assets/heart.svg',height: 200,width: 200,
    )),
    decoration: introPageDecoration[1],
    ),

    PageViewModel(
    title: "Leaderboard",
    body: "Get a Point with Every Slang \n Rank with your Daily Score ",
    image:   Center(child:
    SvgPicture.asset(
        'assets/leaderboard.svg',width: 235 , height: 235,
     )),
    decoration:introPageDecoration[2]
    )
    ];


    //Viewpager
    return Scaffold(
      body: IntroductionScreen(
        pages: listPagesViewModel,
        onDone: () {
          Navigator.pushReplacementNamed(context, 'login');

        },
          onSkip: (){
            Navigator.pushReplacementNamed(context, 'login');


          },
    showSkipButton: true,
    skip: const Text("Skip"),
    done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
    ));
  }
}

/*
  introduction_screen: ^1.0.7

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

 */
