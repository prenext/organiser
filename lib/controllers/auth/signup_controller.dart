import 'package:Organiser/views/widgets/common/snack_bar.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  Future<Either<String, User?>> signUp(
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

      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      isLoading.value = false;
      Navigator.pop(context);
      CustomSnackbar.show(context, 'success', 'Sign up successful.');

      return Right(userCredential.user);
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      Navigator.pop(context);
      // print('FirebaseAuthException: ${e.code}');

      String errorMessage;
      switch (e.code) {
        case 'email-already-in-use':
          errorMessage = 'Email already in use.';
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
      // print('Error: $e');
      CustomSnackbar.show(context, 'error', 'An unexpected error occurred.');

      return Left('An unexpected error occurred.');
    }
  }

  //TODO: Implement email verification
}
