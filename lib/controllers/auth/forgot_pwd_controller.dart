import 'package:firebase_auth/firebase_auth.dart';

class PasswordResetController {
  Future<String> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.trim());
      return 'Email sent successfully';
    } on FirebaseAuthException catch (e) {
      return 'Error: ${e.message}';
    } catch (e) {
      return 'Error: Something went wrong';
    }
  }
}
