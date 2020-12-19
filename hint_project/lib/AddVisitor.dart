import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hint_project/constant.dart';
import 'package:hint_project/main.dart';

import 'package:hint_project/StartPage.dart';
import 'package:hint_project/visitorPage.dart';
import 'package:qr_flutter/qr_flutter.dart';
class AddVisitorPage extends StatefulWidget {
  String name;
  AddVisitorPage(this.name);
  @override

  _AddVisitorPageState createState() => _AddVisitorPageState();
}

class _AddVisitorPageState extends State<AddVisitorPage> {


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

              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Inputfield(
                    input: "Visitor Name",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Inputfield(
                    input: "Visitor Mobile",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Inputfield(
                    input: "Visitor Location",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: GreenContainer(
                      text: 'Add',
                      //width: 176,
                     // colour: Color(0xff497661),
                    ),
                  )
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}

