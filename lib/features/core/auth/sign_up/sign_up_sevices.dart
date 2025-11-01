// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountCreation {
  createAccount(String emailAddress, password, BuildContext context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      Navigator.of(
        context,
      ).pushNamedAndRemoveUntil("continue_as", (context) => false);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
