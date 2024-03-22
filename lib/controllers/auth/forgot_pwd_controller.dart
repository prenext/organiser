import 'package:Organiser/views/widgets/common/snack_bar.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetPasswordController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  Future <Either<String, bool?>> resetPassword(
    BuildContext context,
    String email,
  ) async {
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

      // Send a password reset email
      await _auth.sendPasswordResetEmail(
        email: email.trim(),
      );

      isLoading.value = false;
      Navigator.pop(context);
      CustomSnackbar.show(context, 'success', 'Email sent succesfully.');

      return Right(true);
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      Navigator.pop(context);
      print('FirebaseAuthException: ${e.code}');
      String errorMessage;
      switch (e.code) {
        case 'invalid-credential':
          errorMessage = 'Email not registered.';
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
