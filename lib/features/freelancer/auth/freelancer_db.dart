import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FreelancerDb {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  addFreelancer() async {
    try {
      await _firebaseFirestore.collection("freelancer").add({
        "freelancer_email": _firebaseAuth.currentUser!.email,
        "freelancer_id": _firebaseAuth.currentUser!.uid,
        "user_role": "freelancer",
      });
    } catch (e) {
      print("Error adding user to db : $e");
      return Stream.value(null);
    }
  }
}
