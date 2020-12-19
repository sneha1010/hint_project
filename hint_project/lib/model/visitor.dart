import 'package:cloud_firestore/cloud_firestore.dart';
class Visitor{
  final String id;
  final String name;
  final String phoneNo;
  final String location;
  final String time;
  Visitor( {this.id,this.name, this.phoneNo, this.location,this.time});
  factory Visitor.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();
    return Visitor(
      id: doc.id,
      name: data['name']??'',
      location: data['location']??'',
      phoneNo: data['phoneNo']??'',
      time: data['time']??'',
    );
  }
}