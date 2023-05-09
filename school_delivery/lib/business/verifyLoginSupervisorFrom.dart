import 'package:cloud_firestore/cloud_firestore.dart';

class VerifyLoginFrom{
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('StudentsG');

  Future<bool> verifyLogin(String email, String password) async {
    // Get a reference to the user document with the given email
    QuerySnapshot snapshot = await usersCollection.where('email', isEqualTo: email).get();

    // Check if a document with the given email exists and if the password matches
    if (snapshot.docs.length > 0 && snapshot.docs[0]['password'] == password) {
      // Email and password are correct, log the user in
      return true;
    } else {
      // Email or password is incorrect, reject the login
      return false;
    }
  }
}