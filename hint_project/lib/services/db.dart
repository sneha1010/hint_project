import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:hint_project/model/user.dart';
import 'package:hint_project/model/visitor.dart';

class DatabaseService {
  final String uid;
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  DatabaseService(this.uid);

  Future<users> getUsers(String id) async {
    var snap = await userCollection.doc(id).get();

    return users.fromMap(snap.data());
  }

  /// Get a stream of a single document
  Stream<users> streamUser(String id) {
    return userCollection.doc(id)
        .snapshots()
        .map((snap) => users.fromMap(snap.data()) );
  }

  //Query a subcollection   giftList
  Stream<List<Visitor>> streamvisitors() {
    var ref = userCollection.doc(uid).collection('visitors');

    return ref.snapshots().map((list) =>
        list.docs.map((doc) => Visitor.fromFirestore(doc)).toList());
  }



  Future<void> addUser(dynamic user ) {
    return userCollection
        .doc(uid)
        .set(user);
  }

  Future<void> addvisitor( {String phoneNo,String name,String location}) {
    return userCollection
        .doc(uid)
        .collection('visitors')
        .add({
      'phoneNo':phoneNo??'',
      'location':location??'',
      'name':name??'',
    });
  }




  Future<void> removevisitor( String id) {
    return userCollection
        .doc(uid)
        .collection('visitors')
        .doc(id)
        .delete();
  }


}

