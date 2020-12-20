import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hint_project/main.dart';



class dahboard extends StatefulWidget {



  @override
  _dahboardState createState() => _dahboardState();
}

class _dahboardState extends State<dahboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
        ),
         body: Container(
//           color: Colors.green,
           padding: EdgeInsets.all(8),
           child: Column(

             children: [
               Text('Dashoard',
               textAlign: TextAlign.center,
               style: TextStyle(
                 color: Colors.black,
                 fontSize: 30,
                 fontWeight: FontWeight.w700
               ),),
               Text(
                 'Here is your visitors list'
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   Text('name'),
                   Text('Mobile no.'),
                   Text('Address'),
                   Text('Date & Time'),
                 ],
               ),
               ListView(
                 children: [
                   ListTile(
                     leading: Text('hello'),
                     trailing: Text('Thu Dec 12 2020 14:54'),
                     title: Text('location'),
                     subtitle: Text('787654358'),
                   ),


                 ],
               ),
               SizedBox(
                 height: 20,
               ),
               FlatButton(
                 onPressed: (){
                   Navigator.pop(context);
                 },
                 child: BlackContainer(
                   text: 'Hide Visitors',
                   width: 260,
                   colour: Color(0xff131A22),
                 ),
               )
             ],
           ),

         ),
      ),
    );
  }
}
