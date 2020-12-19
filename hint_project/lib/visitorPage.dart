import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hint_project/constant.dart';
import 'package:hint_project/main.dart';

import 'package:hint_project/StartPage.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:hint_project/AddVisitor.dart';
class VisitorPage extends StatefulWidget {
  String name;
  VisitorPage(this.name);
  @override

  _VisitorPageState createState() => _VisitorPageState();
}

class _VisitorPageState extends State<VisitorPage> {


// String qrData=widget.name ;
       // already generated qr code when the page opens

 bool isvisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 30),
          child: Column(
            children: [
              Heading(
                heading:widget.name,

              ),
              QrImage(
                //plce where the QR Image will be shown
                data: widget.name,
              ),
              Text(
                'Scan QR code',
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(color: Colors.black)),
              ),
              SizedBox(
                height: 59,
              ),
              FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return AddVisitorPage(widget.name);
                        }
                        ));
                  },
                  child: GreenContainer(
                    text: 'Add Visitor',
                  )),
              SizedBox(
                height: 30,
              ),
             
             
              BlackContainer(
                text: 'Show Visitor',
                width: 260,
                colour: Color(0xff131A22),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Inputfield extends StatelessWidget {
  Inputfield({this.input});
  String input;
  @override
  Widget build(BuildContext context) {
    return TextField(

      decoration: InputDecoration(

        //border: InputBorder.none,
          border: OutlineInputBorder(),
          //errorText: _validate ? 'Value Can\'t Be Empty' : null,
          hintText: input),
    );
  }
}

// ignore: must_be_immutable
class GreenContainer extends StatelessWidget {
  GreenContainer({this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      height: 45,
      decoration: BoxDecoration(
        color: Color(0xff24B873),
        boxShadow: greenshadow,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Stack(
          children: [
            Text(text,
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)))
          ],
        ),
      ),
    );
  }
}