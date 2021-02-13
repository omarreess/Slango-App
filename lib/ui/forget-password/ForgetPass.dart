


import 'package:Slango/networking/Auth.dart';
import 'file:///E:/Dart/Projects/slango/slango/lib/model/Constants.dart';
import 'package:Slango/ui/login/rounded_button.dart';
import 'package:Slango/ui/login/rounded_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgetPassScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController mailController = TextEditingController() ;

    return Scaffold(resizeToAvoidBottomInset :false ,

      body: Container(
       // padding: EdgeInsets.only(top: 60, left: 40, right: 40),

        color: backroundLogoColour,
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 130,
                  child: AppBar(
centerTitle: true,
                    title:
                    Text('Reset Password',textAlign: TextAlign.center , style: TextStyle( color: Colors.black54,fontWeight: FontWeight.bold, fontSize: 18.5),),
                    backgroundColor: backroundLogoColour,elevation: 0,
                     leading: IconButton(
                      icon: Icon(Icons.arrow_back_ios_rounded),
                      color: Colors.black54,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),

                Center(child: Icon(Icons.lock_outline, size: 150 , color: kPrimaryColor, )),
                Container(
                  margin:   EdgeInsets.only(top: 45 , left: 20),
                  child: Text(
                    "Type your mail",textAlign:TextAlign.start ,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black38,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  height: 65,
                  padding: const EdgeInsets.only(right: 10 , left: 10),

                  child: Card(elevation: 2,
                   // color: Colors.black54,
                    shape:RoundedRectangleBorder( borderRadius: BorderRadius.circular(28) ) ,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 15),
                      child: TextField(
                        controller:  mailController,
                         cursorColor: kPrimaryColor,
                        decoration: InputDecoration(


                          icon: Icon(
                            Icons.mail,
                            color: kPrimaryColor,
                          ),
                          hintText: 'example@domain.com',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
            Container(
              margin:   EdgeInsets.only(bottom: 45),
              child:Builder(builder: (BuildContext context){
               return Align(
                  alignment:Alignment.bottomCenter ,
                  child: Container(
                   // margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(29),
                      child: Container(
                        decoration: BoxDecoration(gradient: gradient),
                        child: FlatButton(
                          padding:EdgeInsets.all(20) ,


                          color: kPrimaryColor,
                          onPressed:()=> sentCode(mailController.text , context)   ,


                          child: Text(
                            'Reset Password',

                            style: TextStyle( color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),

                );
              },)
            )
          ],
        ),
      ),
    );
  }
  void sentCode (String mail , BuildContext ctx) async
  { if (mail.isNotEmpty&& mail.endsWith('.com')) {
    Auth auth = Auth();
    await auth.initFb().then((value) => auth.forgetPass(mail));
  }
    //snackbar
    Scaffold.of(ctx).showSnackBar(
      SnackBar(
        content:   Text((mail.isNotEmpty&& mail.endsWith('.com'))?'Check Your Mail':'Mail is unvalid', style: TextStyle(fontSize: 15),),backgroundColor: kPrimaryColor,)

    );

  }
}


