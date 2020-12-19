import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hint_project/Login.dart';
import 'package:hint_project/QrGenerate.dart';
import 'package:hint_project/constant.dart';
//import 'package:hint_project/main.dart';

import 'package:hint_project/StartPage.dart';
import 'package:hint_project/visitorPage.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  bool isvisible = true;
  bool _validate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 30),
          child: Column(
            children: [
              Heading(
                heading: 'Registration',
              ),
              SizedBox(
                height: 30,
              ),
              Visibility(
                visible: isvisible,
                child: Column(
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(

                        //border: InputBorder.none,
                          border: OutlineInputBorder(),
                          errorText: _validate ? 'Value Can\'t Be Empty' : null,
                          hintText: 'Name'),

                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Inputfield(
                      input: "Mobile",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Inputfield(

                      input: "Location",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                TextField(
                  decoration: InputDecoration(

                    //border: InputBorder.none,
                      border: OutlineInputBorder(),
                      hintText: 'password'),
                  autofocus: false,
                  obscureText: true,
                ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                  child: FlatButton(
                      onPressed: () {
                        setState(() {
                          nameController.text.isEmpty ? _validate = true : _validate = false;
                        });
                        if(_validate==false) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return VisitorPage(nameController.text);
                              }));
                        }
                      },
                      child: GreenContainer(
                        text: 'Register',
                      ))),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(color: Colors.black)),
                  ),
                  SizedBox(width: 10,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return LogIn();
                          }
                          ));
                    },
                    child: Text(
                      'Login',
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(color: Colors.green)),
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
