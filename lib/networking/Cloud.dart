import 'package:Slango/model/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class CloudDb {


  FutureBuilder initFire() {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Text('Error');
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return cloudCallStream();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Text('Loading');
      },
    );
  }

  StreamBuilder cloudCallStream() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('list');

    return StreamBuilder<QuerySnapshot>(
      stream: users.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        return Text('${snapshot.data.docs[0].data()}');
        // return new ListView(
        //   children: snapshot.data.documents.map((DocumentSnapshot document) {
        //     return new ListTile(
        //       title: new Text(document.data()['full_name']),
        //       subtitle: new Text(document.data()['company']),
        //     );
        //   }).toList(),
        // );
      },
    );
  }

  void postUserName(User user) async {
    FirebaseFirestore firestore = await FirebaseFirestore.instance;
    firestore.collection('Users').doc(user.uid).set({
      'name': user.name,
      'score': user.score,

    });
  }
  void postUserScore(User user) async {
    FirebaseFirestore firestore = await FirebaseFirestore.instance;
    firestore.collection('Users').doc(user.uid).update({
       'score': user.score,

    });
  }

   Future<Map<String,dynamic >> getUser(String uid) async    {
    var userData ;
     CollectionReference users = await FirebaseFirestore.instance.collection('Users');
      await  users.doc(uid).get().then((response) {
           userData= response.data();
        } );
      return userData;
  }

  Future<QuerySnapshot> getUsersScoreList() async    {
     CollectionReference users = await FirebaseFirestore.instance.collection('Users');
         return  users .orderBy('score', descending: true).limit(50).get();
     //       .then((response) =>  userData =  response.docs);
     //   var  k ;
     // userData.forEach((element) { k = element.data();});
    //    List<QueryDocumentSnapshot> userData ;
     //      return userData;
  }

}