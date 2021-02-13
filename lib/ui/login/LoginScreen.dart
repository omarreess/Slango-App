
import 'package:Slango/networking/Auth.dart';
import 'file:///E:/Dart/Projects/slango/slango/lib/model/Constants.dart';
import 'package:Slango/ui/login/rounded_button.dart';
import 'package:Slango/ui/login/rounded_input_field.dart';
import 'package:Slango/ui/login/rounded_password_field.dart';
import 'package:Slango/ui/login/social_icon.dart';
import 'package:Slango/ui/offline/NetworkCheckUtill.dart';
import 'package:Slango/ui/offline/OfflineScreen.dart';
import 'package:Slango/ui/register/SignupScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'already_have_an_account_acheck.dart';
import 'or_divider.dart';

class LoginScreen extends StatelessWidget {
  Auth auth ;
  TextEditingController mailController = TextEditingController() ;
  TextEditingController passController = TextEditingController() ;


  @override
  Widget build(BuildContext context) {
    //init auth fb
    auth = Auth(ctx: context , firstCheck: true);
    auth.initFb();
    //

    void toSignupScreen()
    {Navigator.pushNamed(context, 'register');

    }
    void toForgetPassScreen()
     { Navigator.pushNamed(context, 'forget');

    }
    Size size = MediaQuery.of(context).size;
    Widget body(){
      return Stack(

        alignment: Alignment.center,
        children: <Widget>[


          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "LOGIN",
                    style: TextStyle(fontSize: 15.5,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Hero(tag: 'logoSplash',child: SvgPicture.asset(logoPath, height: size.height * 0.30,width: size.width * 0.35,))

                  ,
                  SizedBox(height: size.height * 0.03),
                  RoundedInputField(controller: mailController,

                    hintText: "Your Email",
                    onChanged: (value) {},
                  ),
                  RoundedPasswordField(
                    controller: passController,

                    onChanged: (value) {},
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(

                        child: GestureDetector(

                          child: Text(
                            "Forget Password",textAlign: TextAlign.end,
                            style: TextStyle(fontSize: 11.5, color: kPrimaryColor,fontWeight: FontWeight.normal),
                          ),
                        onTap:toForgetPassScreen ,),
                        padding: EdgeInsets.symmetric(horizontal: 50),margin: EdgeInsets.only(bottom: 10),

                       ),
                    ],
                  ),
                  RoundedButton(

                    text: "LOGIN",
                    press: ()=>auth.login(mailController.text, passController.text),
                  ),
                  SizedBox(height: size.height * 0.03),
                  AlreadyHaveAnAccountCheck(
                    press: toSignupScreen,
                  ),
                  OrDivider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SocalIcon(
                        iconSrc: "assets/facebook.svg",
                        press: () {},
                      ),

                      SocalIcon(
                        iconSrc: "assets/google.svg",
                        press: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      );
    }
    return Scaffold(
      body:   Container(
        color: backroundLogoColour,
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

}

