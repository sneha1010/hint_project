import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:hint_project/Login.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  String finalDate = '';
  String _timeString;
  void _getTime() {
    final String formattedDateTime =
    DateFormat('yyyy-MM-dd \n kk:mm:ss').format(DateTime.now()).toString();
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  getCurrentDate() {
    var date = new DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";

    setState(() {
      finalDate = formattedDate.toString();
    });
  }
    String qrCodeResult = "Not Yet Scanned";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
         // mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top:16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(
                        Icons.arrow_back)
                ),
                Icon(Icons.check,
                ),

              ],
            ),
          ),
          //  Text("Date = $finalDate", style: TextStyle(fontSize: 20), textAlign: TextAlign.center,),
            SizedBox(height: 200,),
           Center(
             child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: [
                 Text(_timeString.toString(),
                     style: TextStyle(fontSize: 20),
                     textAlign: TextAlign.center),
                 SizedBox(height: 20,),
                 Text(
                   qrCodeResult,
                   style: TextStyle(
                     fontSize: 20.0,
                   ),
                   textAlign: TextAlign.center,
                 ),
                 SizedBox(
                   height: 20.0,
                 ),
                 FlatButton(
                     padding: EdgeInsets.all(15.0),
                     onPressed: () async {


                       String codeSanner = await FlutterBarcodeScanner.scanBarcode("#ff6666", "Cancel", false, ScanMode.DEFAULT);    //barcode scnner
                       setState(() {
                         qrCodeResult = codeSanner;
                         //  _getTime();
                       }
                       );

                       // try{
                       //   BarcodeScanner.scan() ;  // this method is used to scan the QR code
                       // }catch (e){
                       //   // BarcodeScanner.CameraAccessDenied;  // we can print that user has denied for the permisions
                       //   // BarcodeScanner.UserCanceled;  // we can print on the page that user has cancelled
                       // }


                     },
                     child: GreenContainer(text: 'Open Scanner',)
                 )
               ],
             ),
           ),
            // Text(
            //   "Result",
            //   style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            //   textAlign: TextAlign.center,
            // ),

          ],
        ),
      ),
    );
  }

//its quite simple as that you can use try and catch staatements too for platform exception
}