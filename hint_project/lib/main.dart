import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'StartPage.dart';
import 'constant.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Registry(),
    );
  }
}
class Registry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        color: Colors.white,
        child: Stack(
            children:[
              Image.asset('images/scan main.png',
                width: double.infinity,
                height: double.infinity,
              ),
              Stack(
                  children: [Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        color: Color(0xff131A22).withOpacity(0.7),
                        shape: BoxShape.rectangle
                    ),
                  ),
                  ]
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Registry App',
                      style:GoogleFonts.roboto(
                          textStyle: TextStyle(

                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 36
                          ) )
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text('A contact-less Visitors Register service which help to keep track of your visitors'
                        ,
                        style:GoogleFonts.roboto(
                            textStyle: TextStyle(

                                color: Color(0xffE5E5E5),
                                fontWeight: FontWeight.w400,
                                fontSize: 18
                            ) )
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom:30.0),
                    child: FlatButton(
                      onPressed:() {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) {
                          return StartPage();
                        }));
                      },
                      child: BlackContainer(text: 'Start',width: 200,colour: Color(0xff131A22),),
                    ),
                  )
                ],
              )
            ]
        ),
      ),
    );
  }
}

class BlackContainer extends StatelessWidget {
  BlackContainer({this.text,this.width,this.colour});
  String text;
  double width;
  Color colour;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 45,
      decoration: BoxDecoration(
        color: colour,
        boxShadow: blackshadow,
        borderRadius: BorderRadius.circular(30),

      ),
      child: Center(
        child: Stack(
          children: [
            Text(text
                ,
                style:GoogleFonts.roboto(
                    textStyle: TextStyle(

                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ) )
            )
          ],
        ),
      ),
    );
  }
}