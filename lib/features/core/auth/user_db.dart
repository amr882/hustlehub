// user_db.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDb {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<String?> getUserState() async {
    final User? user = _firebaseAuth.currentUser;
    if (user == null) {
      return null;
    }

    try {
      final querySnapshot = await _firebaseFirestore
          .collection('freelancer')
          .where('freelancer_id', isEqualTo: user.uid)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.first.data()['user_role'] as String?;
      }

      return 'client';
    } catch (e) {
      print("Error fetching user state: $e");
      return null;
    }
  }
}
