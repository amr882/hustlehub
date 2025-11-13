import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hustlehub/features/core/keys.dart';

class Rtdb {
  FirebaseDatabase database = FirebaseDatabase.instance;

  final firebaseApp = Firebase.app();
  late final rtdb = FirebaseDatabase.instanceFor(
    app: firebaseApp,
    databaseURL: freelancerDataBaseUrl,
  );
  DatabaseReference ref = FirebaseDatabase.instance.ref();

  test() async {
    final snapshot = await ref.child('categories').get();
    if (snapshot.exists) {
      print(snapshot.value);
    } else {
      print('No data available.');
    }
  }
}
