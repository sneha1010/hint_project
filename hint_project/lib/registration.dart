import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hint_project/Login.dart';
import 'package:hint_project/QrGenerate.dart';
import 'package:hint_project/constant.dart';
//import 'package:hint_project/main.dart';
import 'services/auth.dart';
import 'package:hint_project/StartPage.dart';
import 'package:hint_project/visitorPage.dart';
import 'services/db.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthService _auth = AuthService();
  String name, phoneNo, email, password,location;
  String error='';
  TextEditingController nameController = TextEditingController();
  bool isvisible = true;
  bool _validate = false;
  @override
  Widget build(BuildContext context) {
    Future<void> adddetails(String phone,String loc,String nam){
      var user=Provider.of<User>(context,listen: false);
      DatabaseService _db =DatabaseService(user.uid);
      print('here 2 ${user.uid}');
      return _db.addUser(loc,nam,phone,user.email).then((value) async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => VisitorPage(name)),
        );
      }).catchError(
            (error) => print("Some error occured while registering"),
      );
    }
    final _formKey = GlobalKey<FormState>();


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
                    heading: 'Registration',
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Visibility(
                    visible: isvisible,
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: nameController,
                          validator: (v)=>v.isEmpty?'enter the name':null,
                          decoration: InputDecoration(

                            //border: InputBorder.none,
                              border: OutlineInputBorder(),
                              errorText: _validate ? 'Value Can\'t Be Empty' : null,
                              hintText: 'Name'),

                      onChanged: (value){
                            name=value;
                      },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (v)=>v.isEmpty?'Please provide phone number':null,
                      onChanged: (value){
                        phoneNo=value;

                      },
                      decoration: InputDecoration(

                        //border: InputBorder.none,
                          border: OutlineInputBorder(),
                          hintText: 'mobile'),

                    ),
                        SizedBox(
                          height: 10,
                        ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (v)=>v.isEmpty?'Please provide an email ':null,
                      onChanged: (value){
                        email=value;

                      },
                      decoration: InputDecoration(

                        //border: InputBorder.none,
                          border: OutlineInputBorder(),
                          hintText: 'email'),

                    ),
                        SizedBox(
                          height: 10,
                        ),
                    TextFormField(

                      onChanged: (value){
                        location=value;

                      },
                      decoration: InputDecoration(

                        //border: InputBorder.none,
                          border: OutlineInputBorder(),
                          hintText: 'location'),

                    ),
                        SizedBox(
                          height: 10,
                        ),
                    TextFormField(
                      validator: (v)=>v.isEmpty?'enter the password':null,
                      onChanged: (value){
                        password=value;
                      },
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
                          onPressed: () async{
                          print(email);
                            if (_formKey.currentState.validate()) {

                              dynamic result = await _auth
                                  .registerWithEmailAndPassword(email, password);
                              if (result == 'email') {
                                setState(() {
                                  error='The account already exists for that mail.\nTry different email account or use Login page.';
                                });
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                        error)));
                              } else if (result == null) {
                                setState(() {
                                  error='Some thing went wrong try again';
                                });
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(

                                    content: Text(
                                        error)));
                              } else {
                                print('i am here');
                                adddetails(phoneNo, location, name);
//                                registerUser(phoneNo: phoneNo,name: name,location: location,);
                              }
                            }else{
                              print('hi');
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      "Fill all the fields, phone number of ten digits and a strong password")));
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
        ),
      ),
    );
  }
}

// ignore: must_be_immutable

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

//class registerUser extends StatelessWidget {
//final String phoneNo;
//final String name;
//final String location;
//
//  const registerUser({Key key, this.phoneNo, this.name, this.location}) : super(key: key);
//  @override
//  Widget build(BuildContext context) {
//
//    var user=Provider.of<User>(context);
//    DatabaseService _db =DatabaseService(user.uid);
////    _db.addUser();
//    print('sdfg                       ${user.uid}');
//    Future<void> registerUser() {
//      return _db.addUser({
//        'name': name??'',
//        'phoneNumber':phoneNo??'',
//        'uid': user.uid ?? '',
//        'email': user.email ?? '',
//
//      }).then((value) async {
////        SharedPreferences prefs = await SharedPreferences.getInstance();
////        prefs.setString('uid', user.uid);
//        Navigator.pushReplacement(
//          context,
//          MaterialPageRoute(builder: (context) => VisitorPage(name)),
//        );
//      }).catchError(
//
//            (error) => print("Some error occured while registering"),
//      );
//    }
//
//
//
//
//     registerUser();
//
//    return null;
//  }
//}/**/
