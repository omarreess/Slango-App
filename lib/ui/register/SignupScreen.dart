
import 'package:Slango/networking/Auth.dart';
import 'package:Slango/ui/login/already_have_an_account_acheck.dart';
import 'package:Slango/ui/login/or_divider.dart';
import 'package:Slango/ui/login/rounded_button.dart';
import 'package:Slango/ui/login/rounded_input_field.dart';
import 'package:Slango/ui/login/rounded_password_field.dart';
import 'package:Slango/ui/login/social_icon.dart';
import 'package:Slango/ui/offline/NetworkCheckUtill.dart';
import 'package:Slango/ui/offline/OfflineScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../model/Constants.dart';

class SignUpScreen extends StatelessWidget {
  TextEditingController mailController=TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    void toLoginScreen()
    {
       Navigator.pushNamed(context, 'login');

    }

    void signupTap(BuildContext ctx){
      Auth auth = Auth(ctx: ctx);
      auth.initFb().then((value) => {
        auth.signup(mailController.text, passController.text, nameController.text).then((showSnack) {if (showSnack)  //snackbar
        Scaffold.of(ctx).showSnackBar(
            SnackBar(
              content: const Text('Check Your Mail For Verification ' , style: TextStyle(fontSize: 15),),backgroundColor: kPrimaryColor,)


        );
        Future.delayed(const Duration(milliseconds: 850), () {
toLoginScreen();
        });
        })
      });

      
      
      
    }

    Size size = MediaQuery.of(context).size;
    Widget body(){return Stack(
      alignment: Alignment.center,
      children: <Widget>[

        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "SIGNUP",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.03),
                Hero(tag: 'logoSplash',
                  child: SvgPicture.asset(
                    "assets/logosvg.svg",
                    height: size.height * 0.30,
                  ),
                ),
                RoundedInputField(
                  controller: mailController,
                  hintText: "Email",
                  onChanged: (value) {},
                ),RoundedInputField(
                  controller: nameController,
                  hintText: "Full Name",
                  onChanged: (value) {},
                ),
                RoundedPasswordField(
                  controller: passController,
                  onChanged: (value) {},
                ),
                Builder(builder: (BuildContext context){
                  return  RoundedButton(
                    text: "SIGNUP",
                    press: ()=>signupTap(context),
                  ); }			 ,

                ),
                SizedBox(height: size.height * 0.03),
                AlreadyHaveAnAccountCheck(
                  login: false,
                  press: toLoginScreen,

                ),

              ],
            ),
          ),
        ),
      ],
    );}
    return Scaffold(
      body: Container(
        color: backroundLogoColour,
        height: size.height,
        width: double.infinity,
        // Here i can use size.width but use double.infinity because both work as a same
        child: StreamBuilder(
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
