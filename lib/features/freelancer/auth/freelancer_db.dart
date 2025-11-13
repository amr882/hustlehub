import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FreelancerDb {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  addFreelancer() async {
    try {
      String uid = _firebaseAuth.currentUser!.uid;
      await _firebaseFirestore.collection("freelancer").doc(uid).set({
        "freelancer_email": _firebaseAuth.currentUser!.email,
        "freelancer_id": uid,
        "user_role": "freelancer",
        "account_setup": false,
      });
    } catch (e) {
      print("Error adding user to db : $e");
      return Stream.value(null);
    }
  }
}
