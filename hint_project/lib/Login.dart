import 'package:flutter/material.dart';
//import 'package:hint_project/Registration.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hint_project/QrGenerate.dart';
import 'package:hint_project/constant.dart';
import 'package:hint_project/StartPage.dart';
import 'package:hint_project/registration.dart';
import 'package:hint_project/visitorPage.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool isvisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 30),
          child: Column(
            children: [
              Heading(
                heading: 'Log in',
              ),
              SizedBox(
                height: 30,
              ),
              Visibility(
                visible: isvisible,
                child: Column(
                  children: [
                    Inputfield(
                      input: "Mobile",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Inputfield(
                      input: "Password",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: FlatButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return GeneratePage();
                                  }));
                            },
                            child: GreenContainer(
                              text: 'Log in',
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
                                  return RegisterPage();
                                }
                                ));
                          },
                          child: Text(
                            'Register',
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(color: Colors.green)),
                          ),
                        )
                      ],
                    ),

                  ],
                ),
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