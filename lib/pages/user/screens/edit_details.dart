import 'package:Organiser/models/collections/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class EditAcountDetails extends StatefulWidget {
  @override
  _EditAcountDetailsState createState() => _EditAcountDetailsState();
}

class _EditAcountDetailsState extends State<EditAcountDetails> {
  late Future<UserModel> _user;
  final user = FirebaseAuth.instance.currentUser!;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _fnameController = TextEditingController();
  TextEditingController _lnameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _user = _loadUserData();
  }

  Future<UserModel> _loadUserData() async {
    String userId = user.uid;
    DocumentSnapshot userSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    if (userSnapshot.exists) {
      setState(() {
        _user = Future.value(
            UserModel.fromMap(userSnapshot.data() as Map<String, dynamic>));
      });
      return _user;
    }

    return _user;
  }

  String? selectedGender;
  bool isDataChanged = false;

  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  Widget buildAppBarTitle() {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            Icons.cancel_outlined,
            size: 25,
          ),
          onPressed: () {
            // Handle notification icon tap
          },
        ),
        SizedBox(
          width: 40,
        ),
        SizedBox(width: 8),
        Text('Update Details'),
      ],
    );
  }

  Widget buildSaveButton() {
    return IconButton(
      icon: Icon(
        Icons.check_circle_outlined,
        size: 25,
      ),
      onPressed: isDataChanged
          ? () {
              // Handle save icon tap
              _saveChanges();
            }
          : null, // Disable the button if no changes
    );
  }

  void _saveChanges() {
    // Implement logic to save changes to Firestore
    // Only update fields that have changed

    // Set isDataChanged to false after saving changes
    setState(() {
      isDataChanged = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        foregroundColor: Theme.of(context).primaryColor,
        title: buildAppBarTitle(),
        actions: [
          buildSaveButton(),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Profile Image:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w100,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Theme.of(context)
                            .primaryColor, // Use the theme primary color
                        width: 4.0, // Set the border width
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 35,
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
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 50.0, vertical: 25.0),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Text('Create Avatar'),
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
              canEdit: false,
              controller: _usernameController,
            ),
            SizedBox(height: 16.0),
            _buildRoundedTextField(
              labelText: 'Email',
              myIcon: Icons.mail_outlined,
              canEdit: false,
              controller: null, // No controller for email
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
              canEdit: true,
              controller: _fnameController,
            ),
            SizedBox(height: 16.0),
            _buildRoundedTextField(
              labelText: 'Last Name',
              myIcon: Icons.person_2_outlined,
              canEdit: true,
              controller: _lnameController,
            ),
            // Existing code...
          ],
        ),
      ),
    );
  }

  Widget _buildRoundedTextField({
    required String labelText,
    required IconData myIcon,
    required bool canEdit,
    required TextEditingController? controller,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      readOnly: !canEdit,
      onChanged: (value) {
        // Handle changes and enable the save button
        setState(() {
          isDataChanged = true;
        });
      },
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
