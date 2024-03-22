import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FileController {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadFile(
      BuildContext context, File file, String folderName) async {
    try {
      // Get the current timestamp in milliseconds
      String timestamp = DateTime.now().millisecondsSinceEpoch.toString();

      // Concatenate the timestamp with the original file name
      String fileName = '$timestamp-${file.path.split('/').last}';

      // Create a reference to the file location in Firebase Storage
      Reference ref = _storage.ref().child('$folderName/$fileName');

      // Upload the file to Firebase Storage
      UploadTask uploadTask = ref.putFile(file);

      // Show a snackbar indicating that the upload has started
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Uploading file...'),
      ));

      // Wait for the upload to complete
      await uploadTask.whenComplete(() {
        // Show a snackbar indicating that the upload is complete
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('File uploaded successfully'),
        ));
      });

      // Get the download URL
      String downloadURL = await ref.getDownloadURL();

      return downloadURL;
    } catch (e) {
      // Show a snackbar indicating that an error occurred during the upload
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error uploading file: $e'),
      ));
      // Handle any errors
      print(e);
      return '';
    }
  }
}
