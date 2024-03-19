import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Organiser/views/auth/add_account_details.dart';

class AuthController {

  Future<String?> signUp(
      BuildContext context, String email, String password) async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      if (passwordConfirmed()) {
        Navigator.pop(context); // Close the loading dialog
        showDialog(
          useSafeArea: false,
          context: context,
          builder: (BuildContext context) {
            return AdditionalSignUpDetailsPage();
          },
        );
        return null; // Sign-up successful, no error
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = "";

      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
      } else {
        errorMessage = e.message ?? 'Error: Something went wrong';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          duration: Duration(seconds: 3),
        ),
      );

      return errorMessage;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          content: Text('Error: Something went wrong'),
          duration: Duration(seconds: 3),
        ),
      );

      return 'Error: Something went wrong';
    }
    return null;
  }

  bool passwordConfirmed() {
    // Implement your password confirmation logic here
    return true;
  }
}
