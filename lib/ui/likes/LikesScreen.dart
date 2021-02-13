


import 'package:Slango/database/DbHelper.dart';
import 'package:Slango/model/Slang.dart';
import 'package:Slango/model/User.dart';
import 'file:///E:/Dart/Projects/slango/slango/lib/model/Constants.dart';
import 'package:Slango/ui/home/HomeScreen.dart';
import 'package:Slango/ui/slangs/SlangsScreen.dart';
import 'package:flutter/material.dart';

class LikesScreen extends StatelessWidget {
  User user = User();


  @override
  Widget build(BuildContext context)   {

    // ignore: deprecated_member_use
    List <Slang> slangsList =List<Slang>.empty(growable: true);

    // //getting likes from db
    // DbHelper .getData().then((list) =>list.
    // forEach((item)
    // {  slangsList.add(Slang(
    //     slang: item['slang'],
    //     ex: item['ex'],
    //     def: item['def']),    );
    // print('zek $item') ;})

        // ) ;

     Widget likesBody (){

      double sizeWidth = MediaQuery.of(context).size.width.toDouble();
      double sizeHeight = MediaQuery.of(context).size.height.toDouble();

      return Padding(
         padding:   EdgeInsets.only(bottom: 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            AppBar(
              actions: <Widget>[
                profileHead(context)

              ],
              automaticallyImplyLeading : false ,

              backgroundColor: Colors.transparent,
              title: Text('Likes' , style: TextStyle(fontSize: 30,color: Colors.white), ),
              elevation: 0.0,
            ),
            Expanded(
             child : FutureBuilder<List<Map<String, dynamic>>>(
            future: DbHelper .getData(HomeScreen.user.uid) , // asyncdownloadData  work
            builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
            switch (snapshot.connectionState) {
            case ConnectionState.waiting: return LinearProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColorLight),
              minHeight: 2.5,
              backgroundColor: Colors.transparent,
            );
            case ConnectionState.done: {
              //getting Data from db
              if(snapshot.data.isEmpty){return Align(alignment: Alignment.center,child: Container( width: 300,height: 200,child: Center(child: Text ('No Likes',textAlign:TextAlign.center , style: TextStyle(fontSize: 35 ,fontWeight:FontWeight.w300 , color: Colors.black54),))));}
              snapshot.data.
              forEach((item)
              {  slangsList.add(Slang(
                  slang: item['slang'],
                  ex: item['ex'],
                  def: item['def']),    );
               });

             return Container(
                width: double.infinity,
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    thickness: 0.1,
                  ),
                  itemCount: slangsList.length,
                  itemBuilder: (context, index) => Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ) ,
                    margin:EdgeInsets.only(right: 10 , left: 10) ,
                    child: ListTile(
                      visualDensity: VisualDensity(horizontal: -4, vertical: 0),
                      trailing:  GestureDetector(onTap:(){speakWord(slangsList[index].slang);},child: Icon(Icons.volume_up,color:Colors.black54,) , ),

                      leading: const Icon(Icons.hdr_weak),
                      contentPadding: EdgeInsets.all(17),
                      title:  Text(slangsList[index].slang[0].toUpperCase() +slangsList[index].slang.substring(1) ),
                      subtitle:  Text(slangsList[index].def, maxLines: 3,),
                      // onTap: () => print("")
                    ),
                  ),
                ),
              );

            }
            default:
            if (snapshot.hasError)
            return Text('Error: ${snapshot.error}');
            else
            return Text('Result: ${snapshot.data}');
            }
            },
            )


            ),

             // Container(color: Colors.pink,width: double.infinity,height: 70,),
            Divider (height: sizeHeight*0.095 , endIndent: double.infinity,indent: double.infinity,),


          ],
        ),
      );
    }

    return Scaffold(
    body:  Container( decoration : BoxDecoration(gradient: gradient),child: likesBody()),
    );

  }

}
