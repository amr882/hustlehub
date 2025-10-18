// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountCreation {
  createAccount(String emailAddress, password, BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
    } on FirebaseAuthException catch (e) {
      if (!RegExp(
            "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]",
          ).hasMatch(emailAddress) ||
          emailAddress.isEmpty) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("enter valid email")));
        return;
      }

      if (password.isEmpty) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("not valid.")));
        return;
      }
      print(e);
    }
  }
}
