import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hint_project/main.dart';
import 'package:hint_project/registration.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //  mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Heading(
                heading: 'Covid 19 Visitor Register',
              ),
              Center(child: Image.asset('images/scan 1.png')),
              SizedBox(
                height: 50,
              ),
              Center(
                  child: FlatButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return RegisterPage();
                            }));
                      },
                      child: BlackContainer(
                        text: 'Create Registry',
                        width: 260,
                        colour: Color(0xff131A22),
                      ))),
              SizedBox(
                height: 50,
              ),
              Text(
                'By creating your Register you will be provided with a QR code and scanning this QR code let your customers to give some information and that imformation will be available on your dashboard.',
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(color: Colors.black)),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Lets fight together against Covid19 :)',
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Heading extends StatelessWidget {
  Heading({this.heading});
  String heading;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(heading,
          // textAlign: TextAlignVertical.center,
          style: GoogleFonts.roboto(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24))),
    );
  }
}