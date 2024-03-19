import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Organiser/models/user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class SignInController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  Future<Either<String, UserModel?>> signIn(
      BuildContext context, String email, String password) async {
    try {
      isLoading.value = true; // Show loading indicator
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
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      // Fetch additional user data from Firestore
      UserModel? user = await getUserData(userCredential.user!.uid);

      isLoading.value = false; // Hide loading indicator
      Navigator.pop(context); // Dismiss the loading dialog
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Sign in successful.")),
      );
      return Right(user);
    } on FirebaseAuthException catch (e) {
      isLoading.value = false; // Hide loading indicator
      Navigator.pop(context); // Dismiss the loading dialog

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
          errorMessage = 'An unexpected error occurred.';
          break;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );

      return Left(errorMessage);
    } catch (e) {
      isLoading.value = false;
      Navigator.pop(context);

      print('Login error: $e');
      return Left('An unexpected error occurred.');
    }
  }

  Future<UserModel?> getUserData(String uid) async {
    try {
      DocumentSnapshot userSnapshot =
          await _firestore.collection('users').doc(uid).get();

      if (userSnapshot.exists) {
        Map<String, dynamic> userData =
            userSnapshot.data() as Map<String, dynamic>;

        UserModel user = UserModel(
          id: uid,
          email: userData['email'],
          username: userData['username'],
          fname: userData['fname'],
          lname: userData['lname'],
          gender: userData['gender'],
          dob: userData['dob'] != null
              ? (userData['dob'] as Timestamp).toDate()
              : null,
          profilePhotoUrl: userData['profilePhotoUrl'],
        );

        return user;
      } else {
        print('User not found in Firestore');
        return null;
      }
    } catch (e) {
      print('Error fetching user data: $e');
      return null;
    }
  }
}
