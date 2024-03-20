// bool _isSuccess = false;
// // ignore: unused_field
// String _message = '';

// Future<void> resetPassword() async {
//   try {
//     await FirebaseAuth.instance
//         .sendPasswordResetEmail(email: _emailController.text.trim());
//     setState(() {
//       _isSuccess = true;
//       _message = 'Email sent successfully';
//     });
//   } on FirebaseAuthException catch (e) {
//     setState(() {
//       _isSuccess = false;
//       _message = 'Error: ${e.message}';
//     });
//   } catch (e) {
//     setState(() {
//       _isSuccess = false;
//       _message = 'Error: Something went wrong';
//     });
//   }
// }
