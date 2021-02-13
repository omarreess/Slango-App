import 'file:///E:/Dart/Projects/slango/slango/lib/model/Constants.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

//firebase_admob: ^0.11.0+1



class AdmobAds{
  BannerAd slangsBanner  ;
  BannerAd likesBanner  ;
  InterstitialAd slangsInterstitial = InterstitialAd(

    adUnitId: adHomeInitir,

  );


  // final adsAppId = 'ca-app-pub-6808778866074990~3162970335';
  // final adHomeBanner = 'ca-app-pub-6808778866074990/9153663617' ;
  // final adLikesBanner = 'ca-app-pub-6808778866074990/1095210197' ;
  // final adHomeInitir = 'ca-app-pub-6808778866074990/1658316971' ;
  // final testBanner = 'ca-app-pub-3940256099942544/8865242552' ;
  //  final testInitir = 'ca-app-pub-3940256099942544/7049598008' ;

  void initAdmob()
  {
     FirebaseAdMob.instance.initialize(appId: adsAppId);

  }

  void showSlangsBanner (BuildContext ctx  ){
    slangsBanner = BannerAd(

      adUnitId: adHomeBanner,
      size: AdSize.smartBanner,

    );

    slangsBanner
    // typically this happens well before the ad is shown
      ..load()
      ..show(
        // Positions the banner ad 60 pixels from the bottom of the screen
        anchorOffset: MediaQuery.of(ctx).size.height * 0.13,
        // Positions the banner ad 10 pixels from the center of the screen to the right
        //horizontalCenterOffset: 10.0,
        // Banner Position

        anchorType: AnchorType.top,
      );
  }
  void showLikesBanner (BuildContext ctx  ){
    likesBanner = BannerAd(

      adUnitId: adLikesBanner,
      size: AdSize.smartBanner,

    );


    likesBanner
    // typically this happens well before the ad is shown
      ..load()
      ..show(
        // Positions the banner ad 60 pixels from the bottom of the screen
        anchorOffset: MediaQuery.of(ctx).size.height * 0.10,
        // Positions the banner ad 10 pixels from the center of the screen to the right
        //horizontalCenterOffset: 10.0,
        // Banner Position

        anchorType: AnchorType.bottom,
      ) ;
  }
   void hideSlangsBanner (){
     if(slangsBanner!=null)
     { slangsBanner?.dispose();
     slangsBanner = null;
     }
   }

   void hideLikesBanner (){
     if( likesBanner!=null)
     {likesBanner.dispose();
     likesBanner = null;

     }
   }


   void showSlangsInterstital (){


     slangsInterstitial
      ..load()
      ..show(
        anchorType: AnchorType.bottom,
        anchorOffset: 0.0,
        horizontalCenterOffset: 0.0,
      );

  }



}