import 'dart:io';
import 'package:Organiser/models/collection/user.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdditionalSignUpDetailsPage extends StatefulWidget {
  @override
  _AdditionalSignUpDetailsPageState createState() =>
      _AdditionalSignUpDetailsPageState();
}

class _AdditionalSignUpDetailsPageState
    extends State<AdditionalSignUpDetailsPage> {

  bool onSignupComplete = false;

  void detailsSaveSuccess(){

  }

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _fnameController = TextEditingController();
  TextEditingController _lnameController = TextEditingController();
  TextEditingController _dobController = TextEditingController();

  DateTime? selectedDate;

  String? selectedGender;
  File? _image;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _dobController.text = "${selectedDate!.toLocal()}".split(' ')[0];
      });
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  Future<void> _saveUserDetails(User? user) async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
    if (user != null) {
      try {
        UserModel userModel = UserModel(
          id: user.uid,
          email: user.email!,
          username: _usernameController.text,
          fname: _fnameController.text,
          lname: _lnameController.text,
          gender: selectedGender,
          dob: selectedDate,
          profilePhotoUrl: _image != null ? _image!.path : null,
        );

        // Set the document ID to the user's UID
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .set(userModel.toMap());

       Navigator.pop(context);
       onSignupComplete = true;

      } catch (error) {
        // Handle different types of errors and show a Snackbar
        String errorMessage = "An error occurred. Please try again.";

        if (error is FirebaseException) {
          errorMessage = error.message ?? errorMessage;
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _fnameController.dispose();
    _lnameController.dispose();
    _usernameController.dispose();
    _dobController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text('Finish Setting Up Your Account:',
              style: TextStyle(
                fontSize: 25, color: Theme.of(context).primaryColor
              ),),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 4.0,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 55,
                          backgroundImage:
                              _image != null ? FileImage(_image!) : null,
                          child: _image == null
                              ? Icon(
                                  Icons.camera_alt,
                                  size: 40,
                                )
                              : null,
                        ),
                      ),
                      Positioned(
                        top: 5.0,
                        right: 5.0,
                        child: InkWell(
                          onTap: () {
                            // Add your edit logic here
                          },
                          child: Container(
                            padding: EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).secondaryHeaderColor,
                            ),
                            child: Icon(
                              Icons.edit,
                              size: 20,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Account Details:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w100,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            _buildRoundedTextField(
              labelText: 'Username',
              myIcon: Icons.person,
              controller: _usernameController,
            ),
            SizedBox(height: 16.0),
            _buildRoundedTextField(
              labelText: 'Email',
              myIcon: Icons.mail_outlined,
              controller: TextEditingController(text: user?.email),
              canEdit: false,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Personal Information:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w100,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            _buildRoundedTextField(
              labelText: 'First Name',
              myIcon: Icons.person_2_outlined,
              controller: _fnameController,
            ),
            SizedBox(height: 16.0),
            _buildRoundedTextField(
              labelText: 'Last Name',
              myIcon: Icons.person_2_outlined,
              controller: _lnameController,
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField(
              decoration: InputDecoration(
                labelText: "Gender",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              ),
              value: selectedGender,
              items: [
                DropdownMenuItem(
                  value: "Rather not say",
                  child: Text("Rather not say"),
                ),
                DropdownMenuItem(
                  value: "Male",
                  child: Text("Male"),
                ),
                DropdownMenuItem(
                  value: "Female",
                  child: Text("Female"),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
              },
              onTap: () {
                FocusScope.of(context).unfocus();
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              readOnly: true,
              onTap: () => _selectDate(context),
              decoration: InputDecoration(
                labelText: "Date Of Birth",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              validator: (value) {
                if (selectedDate == null) {
                  return 'Please pick a date of birth.';
                }
                return null;
              },
              controller: _dobController,
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                width: 400,
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  onPressed: () => _saveUserDetails(user),
                  child: Text(
                    'Save and Continue',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoundedTextField({
    required String labelText,
    required IconData myIcon,
    TextEditingController? controller,
    bool canEdit = true,
  }) {
    return TextField(
      controller: controller,
      readOnly: !canEdit,
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: Icon(myIcon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
