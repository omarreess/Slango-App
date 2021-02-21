# Slango App
Slango is for English Slangs with its Meaning , Examples & Pronunciation. Build with Flutter SDK

App Published on Google Play : https://play.google.com/store/apps/details?id=com.omaressam.slango

 <p float="left">
 <img src="https://github.com/omarreess/Slango-App/blob/master/imgs/1.png" width="185" />
 <img src="https://github.com/omarreess/Slango-App/blob/master/imgs/2.png" width="185" /> 
 <img src="https://github.com/omarreess/Slango-App/blob/master/imgs/3.png" width="185" />
 <img src="https://github.com/omarreess/Slango-App/blob/master/imgs/4.png" width="185" />
 </p>

App Features :

- Splash & Intro for the App
 <p float="left">
 <img src="https://github.com/omarreess/Slango-App/blob/master/imgs/intro0.jpg" width="185" />
 <img src="https://github.com/omarreess/Slango-App/blob/master/imgs/intro1.jpg" width="185" /> 
 <img src="https://github.com/omarreess/Slango-App/blob/master/imgs/intro2.jpg" width="185" />
 <img src="https://github.com/omarreess/Slango-App/blob/master/imgs/intro3.jpg" width="185" />
 </p>
 
 
 - Authentication Login , Signup , Reset Password using Firebase Auth Service & Google Auth 
 - User Data saved Globaly by Firebase Cloud Database 
 - Layout Made Adaptive with Mediaquery Sizes
 - Firebase messaging for Pushig notification 
 <p float="left">
  <img src="https://github.com/omarreess/Slango-App/blob/master/imgs/auth1.jpg" width="230" />
  <img src="https://github.com/omarreess/Slango-App/blob/master/imgs/auth2.jpg" width="230" /> 
  <img src="https://github.com/omarreess/Slango-App/blob/master/imgs/auth3.jpg" width="230" />
</p>
 
 
 - Slangs Defination & Examples feature are bringed from Restful API by Http Networking request
 - Pronunce word using gooole speach
 - Saved Slangs loacaly using Sqflite 
 - Leaderboard for users that earned points
  <p float="left">
  <img src="https://github.com/omarreess/Slango-App/blob/master/imgs/home2.jpg" width="230" />
  <img src="https://github.com/omarreess/Slango-App/blob/master/imgs/home0.jpg" width="230" /> 
  <img src="https://github.com/omarreess/Slango-App/blob/master/imgs/home1.jpg" width="230" />
</p>
 
 
 - User Profile Features , Share & Rate app
 - Proguard Rules applied and Spliting App apk versions for Decreasing App's size
 - Fonts used from Google Fonts library
  <p float="left">
  <img src="https://github.com/omarreess/Slango-App/blob/master/imgs/profile0.jpg" width="230" />
  <img src="https://github.com/omarreess/Slango-App/blob/master/imgs/profile1.jpg" width="230" /> 
  <img src="https://github.com/omarreess/Slango-App/blob/master/imgs/profile2.jpg" width="230" />
</p>
 
 
- Code Architecture 
- Organized by Pacakge by feature concept 
- Provider State Mangement is used  
- Widget Splits from UI Screens to be more Readable & Clean


![alt text](https://github.com/omarreess/Slango-App/blob/master/imgs/arch.png)

Network Requests Management :
- only 1 Get request per app lanuch for leaderboard getting 50 node each node containe two values String and integer
- only one Get Reqest in app launch for getting User info that conatine string and integer value 
- Post Request per tap on NEW SLANG Button with only intger value 


Used libraries :

 -  Firebase Authentication , Cloud & Messaging Firestore , Admob
 -  Sqflite
 -  Google Fonts & Nav Bar
 -  Http
 -  Provider 
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
