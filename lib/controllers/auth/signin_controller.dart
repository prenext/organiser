import 'package:Organiser/views/widgets/common/snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class SignInController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  Future<Either<String, bool?>> signIn(
      BuildContext context, String email, String password) async {
    try {
      isLoading.value = true;
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );

      // Sign in with email and password
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      isLoading.value = false;
      Navigator.pop(context); 
      CustomSnackbar.show(context, 'success', 'Sign in successful.');

      return Right(true);
    } on FirebaseAuthException catch (e) {
      isLoading.value = false; 
      Navigator.pop(context);
      print(
          'FirebaseAuthException: ${e.code}'); // Print the error code (e.g., 'user-not-found'

      String errorMessage;
      switch (e.code) {
        case 'invalid-credential':
          errorMessage = 'Invalid email or password.';
          break;
        case 'network-request-failed':
          errorMessage = 'No network connection.';
          break;
        default:
          errorMessage = 'An unexpected auth error occurred.';
          break;
      }

     CustomSnackbar.show(context, 'error', errorMessage);

      return Left(errorMessage);
    } catch (e) {
      isLoading.value = false;
      Navigator.pop(context);

      print('Login error: $e');
      return Left('An unexpected error occurred.');
    }
  }
}
