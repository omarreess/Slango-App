# Slango App
Slango is for English Slangs with its Meaning , Examples & Pronunciation


 <p float="left">
 <img src="https://github.com/omarreess/Slango-App/blob/master/imgs/1.png" width="250" />
 <img src="https://github.com/omarreess/Slango-App/blob/master/imgs/2.png" width="250" /> 
 <img src="https://github.com/omarreess/Slango-App/blob/master/imgs/3.png" width="250" />
 <img src="https://github.com/omarreess/Slango-App/blob/master/imgs/4.png" width="250" />
 </p>

App Features :

- Splash & Intro for the App
 <p float="left">
 <img src="https://github.com/omarreess/Slango-App/blob/master/imgs/intro0.jpg" width="230" />
 <img src="https://github.com/omarreess/Slango-App/blob/master/imgs/intro1.jpg" width="230" /> 
 <img src="https://github.com/omarreess/Slango-App/blob/master/imgs/intro2.jpg" width="230" />
 <img src="https://github.com/omarreess/Slango-App/blob/master/imgs/intro3.jpg" width="230" />
 </p>
 
 
 - Authentication Login , Signup , Reset Password
 <p float="left">
  <img src="https://github.com/omarreess/Slango-App/blob/master/imgs/auth1.jpg" width="230" />
  <img src="https://github.com/omarreess/Slango-App/blob/master/imgs/auth2.jpg" width="230" /> 
  <img src="https://github.com/omarreess/Slango-App/blob/master/imgs/auth3.jpg" width="230" />
</p>
 
 
 - Slangs Meaning feature , Saved Slangs & Leaderboard
  <p float="left">
  <img src="https://github.com/omarreess/Slango-App/blob/master/imgs/home2.jpg" width="230" />
  <img src="https://github.com/omarreess/Slango-App/blob/master/imgs/home0.jpg" width="230" /> 
  <img src="https://github.com/omarreess/Slango-App/blob/master/imgs/home1.jpg" width="230" />
</p>
 
 
 - User Profile Features
  <p float="left">
  <img src="https://github.com/omarreess/Slango-App/blob/master/imgs/profile0.jpg" width="230" />
  <img src="https://github.com/omarreess/Slango-App/blob/master/imgs/profile1.jpg" width="230" /> 
  <img src="https://github.com/omarreess/Slango-App/blob/master/imgs/profile2.jpg" width="230" />
</p>
 
 
Code Architecture : 

![alt text](https://github.com/omarreess/Slango-App/blob/master/imgs/arch.png)


Code Features :

 - Navigation graph for fragments Screens
 - Applied The single-responsibility principle  of OOD
 - Tried to make it  clean and readable code 
 - The Code orginized by classifying it  into  3 packages :  Network layer , UI , Logic and  Data 
 - Network layer contains Authencticon and Request of Bringing data from Firebase Real-time Database
 - Logic package contaings Adapters for data  , Data Package contains models and some static data
 - Sort Button have three sorting Simple algorthims 
 - App intro slider for Introduce app features 
 - Drawables used with difreent densities to fit with more screens
 - 80% of Drawables are SVG to minimize app size
 - User Signin and Signup using Firebase Authentication 
 - Binding views using butterknife
 - Most of Layouts made with constraint layout and guidelines
 - Icons  from matriel.io
 
 

Used libraries :

 -  Firebase Authentication , Cloud & Messaging Firestore , Admob
 -  Sqflite
 -  Google Fonts & Nav Bar
 -  Http
 -  Path Provider 
 -  Data Connection Checker
 -  Path
 -  Cached Network Image
 -  Flutter Svg
 -  Introduction Screen
 -  Shared Preferences: 
 -  Flutter tts
 -  Flutter Automation
 -  Rate My App
 -  Toast
