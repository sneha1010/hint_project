import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:hint_project/Registration.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hint_project/QrGenerate.dart';
import 'package:hint_project/constant.dart';
import 'package:hint_project/StartPage.dart';
import 'package:hint_project/registration.dart';
import 'package:hint_project/visitorPage.dart';
import 'services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool isvisible = true;
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 30),
            child: Form(
              key: _formKey,
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
                        TextFormField(
                          onChanged: (v){
                            email=v;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(

                            //border: InputBorder.none,
                              border: OutlineInputBorder(),
                              hintText: 'email'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          onChanged: (v){
                            password=v;
                          },
                          decoration: InputDecoration(

                            //border: InputBorder.none,
                              border: OutlineInputBorder(),
                              hintText: password),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                            child: FlatButton(
//                            onPressed: () {
//
//                              Navigator.push(context,
//                                  MaterialPageRoute(builder: (context) {
//                                    return GeneratePage();
//                                  }));
//                            }
                                onPressed: () async {
                                  if (email == null || password == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text("Enter all details"),
                                    ));
                                  } else {
                                    try {
                                      AuthService  auth = AuthService();
                                      auth.signInWithEmailAndPassword(email,password);
//                          UserCredential userCredential = await FirebaseAuth
//                              .instance
//                              .signInWithEmailAndPassword(
//                                  email: email, password: password);
                                      Navigator.pushReplacement(context, MaterialPageRoute(
                                        builder: (context) {
                                          return GeneratePage();
                                        },
                                      ));
                                    } on FirebaseAuthException catch (e) {
                                      if (e.code == 'user-not-found') {
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                          content: Text("No user found for that email."),
                                        ));
                                      } else if (e.code == 'wrong-password') {
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                            content: Text("Wrong password provided.")));
                                      }
                                    } catch (e) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text("Some error occured.")));
                                    }
                                  }
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
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Inputfield extends StatelessWidget {
  Inputfield({this.input,this.changed});
  String input;
  String changed;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (v){
        changed=v;
      },
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