import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class EditAcountDetails extends StatefulWidget {
  // final String uid;
  // final String username;
  // final String email;
  // final String lname;
  // final String fname;
  // final int age;
  // final String gender;
  // final String joindate;
  // final String profilepic;

  // EditAcountDetails({
  //   required this.uid,
  //   required this.username,
  //   required this.email,
  //   required this.lname,
  //   required this.fname,
  //   required this.age,
  //   required this.gender,
  //   required this.joindate,
  //   required this.profilepic,
  // });

  @override
  _EditAcountDetailsState createState() => _EditAcountDetailsState();
}

class _EditAcountDetailsState extends State<EditAcountDetails> {
  // TextEditingController _usernameController = TextEditingController();
  // TextEditingController _fnameController = TextEditingController();
  // TextEditingController _lnameController = TextEditingController();
  String? selectedGender;

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

  @override
  void initState() {
    super.initState();
    // // Initialize text controllers with existing user details
    // _usernameController.text = widget.username;
    // _fnameController.text = widget.fname;
    // _lnameController.text = widget.lname;
  }

  Widget buildAppBarTitle() {
    return Row(
      children: [
         IconButton(
              icon: Icon(Icons.cancel_outlined, size: 25,),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).secondaryHeaderColor,
          foregroundColor: Theme.of(context).primaryColor,
          title: buildAppBarTitle(),
          actions: [
            IconButton(
              icon: Icon(
                Icons.check_circle_outlined,
                size: 25,
              ),
              onPressed: () {
                // Handle notification icon tap
              },
            ),
          ]),
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
              ),
              SizedBox(height: 16.0),
              _buildRoundedTextField(
                labelText: 'Email',
                myIcon: Icons.mail_outlined,
                canEdit: false,
              ),
              SizedBox(height: 16.0),
              _buildRoundedTextField(
                labelText: 'Password',
                obscureText: true,
                myIcon: Icons.lock_clock_outlined,
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
                canEdit: true,
              ),
              SizedBox(height: 16.0),
              _buildRoundedTextField(
                labelText: 'Last Name',
                myIcon: Icons.person_2_outlined,
                canEdit: true,
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
                  FocusScope.of(context)
                      .unfocus(); // Close keyboard when dropdown is tapped
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Age",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) {
                  // Handle the onChanged event if needed
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your age.';
                  }
                  // You can add additional validation if needed
                  return null;
                },
              )
            ],
          )),
    );
  }

  Widget _buildRoundedTextField({
    required String labelText,
    required IconData myIcon,
    required bool canEdit,
    bool obscureText = false,
  }) {
    return TextField(
      obscureText: obscureText,
      readOnly: !canEdit,
      canRequestFocus: canEdit,
      onTap: () {
        if (!canEdit) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Field is Read Only! Cannot Be Edited."),
              duration: Duration(milliseconds: 1000),
              backgroundColor: Theme.of(context).primaryColor,
            ),
          );
        }
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
