


import 'package:Slango/ui/login/or_divider.dart';
import 'package:Slango/ui/share/socialIconShare.dart';
 import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:share/share.dart';
 import 'package:toast/toast.dart';

import 'Bar.dart';

class ShareScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(      color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight:Radius.circular(30) )),
      height: size.height*0.42,
      width: double.infinity,
       child: Column(
         children: [    BtmSheetBar(),

           Padding(
             padding: const EdgeInsets.fromLTRB(18, 7, 15, 5),
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider (height: size.height*0.015, endIndent: double.infinity,indent: double.infinity,),


                Text('App Link', style:shareHeadTextStyle ,) ,
                Divider (height: size.height*0.025, endIndent: double.infinity,indent: double.infinity,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Container(width: size.width*0.755 ,

                      padding:EdgeInsets.all(13),
                      decoration:
                  BoxDecoration(shape: BoxShape.rectangle ,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                    width: 0.5,
                    color: Colors.black45,
                  ), ) ,
                      child: SingleChildScrollView(scrollDirection: Axis.horizontal,
                          child: GestureDetector(onTap: (){copyLink(context);},child: Text(url,maxLines: 1,overflow: TextOverflow.ellipsis  , style: shareLinkTextStyle, )))) ,

                  Material(
                  color: Colors.transparent,
                    shape: CircleBorder(),
                    clipBehavior: Clip.hardEdge,



                     child: IconButton(icon: Icon(Icons.copy), onPressed: (){copyLink(context);},iconSize: size.width*0.076,
                      color: Colors.black54,
                      ),
                  )
                ],),
                Divider (height: size.height*0.005, endIndent: double.infinity,indent: double.infinity,),
                Center(child: OrDivider()),
                 Text('Share Via', style:shareHeadTextStyle ),
                Divider (height: size.height*0.020, endIndent: double.infinity,indent: double.infinity,),
                SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    SocalIconShare(
                      iconSrc: "assets/messenger.svg",
                      press: shareToApps,
                    ),
                    SocalIconShare(
                      iconSrc: "assets/whatsapp.svg",
                      press: shareToApps,
                    ),
                    SocalIconShare(
                      iconSrc: "assets/instagram.svg",
                      press: shareToApps,
                    ),
                    SocalIconShare(
                      iconSrc: "assets/twitter.svg",
                      press: shareToApps,
                    ),
                  ],),
                ),







              ],
      ),
           ),
         ],
       ),
    );
  }
}


 var shareHeadTextStyle = TextStyle(fontSize: 18 , fontWeight: FontWeight.bold , color: Colors.black54);
 var shareLinkTextStyle = TextStyle(fontSize: 14 , fontWeight: FontWeight.normal , color: Colors.black54);
 var url = 'https://play.google.com/store/apps/details?id=com.omaressam.a2oleh';

 void showShareSc(BuildContext context){

   showModalBottomSheet(

      backgroundColor: Colors.transparent,
       context: context,
       builder: (context) =>
       ShareScreen()
   );

 }
 void copyLink (BuildContext ctx){
   Clipboard.setData(ClipboardData(text: url));
   Toast.show("Copied", ctx, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);





 }

 void shareToApps(){   Share.share('Check that lovely app $url');
 }


 Widget shareBtm(BuildContext ctx)
 {
   return   FloatingActionButton.extended(

     label: Text('Share'),
 icon: Icon(Icons.share),
    backgroundColor: Colors.white60,
        onPressed: () => showShareSc(ctx)
   ) ;
 }
