import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? name;
  String? email;

  UserModel({this.name, this.email});

  // Create a UserModel from Firestore document snapshot
  UserModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    name = snapshot['name'];
    email = snapshot['email'];
  }
}