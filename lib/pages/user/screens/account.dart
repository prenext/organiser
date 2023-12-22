import 'package:Organiser/models/collections/user.dart';
import 'package:Organiser/widgets/DialogBoxes/logout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  late UserModel _user;
  final user = FirebaseAuth.instance.currentUser!;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _fnameController = TextEditingController();
  TextEditingController _lnameController = TextEditingController();
  TextEditingController _dobController = TextEditingController();

  DateTime? selectedDate;

  Future<void> _showConfirmationDialog(BuildContext context) async {
    await LogoutDialog.show(context);
  }

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    String userId = user.uid;
    DocumentSnapshot userSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    if (userSnapshot.exists) {
      setState(() {
        _user = UserModel.fromMap(userSnapshot.data() as Map<String, dynamic>);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Account'),
          backgroundColor: Theme.of(context).secondaryHeaderColor,
          foregroundColor: Theme.of(context).primaryColor,
          actions: [
            IconButton(
              icon: Icon(Icons.settings, size: 30),
              onPressed: () {},
            ),
          ],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
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
                    SizedBox(height: 20),
                    Column(
                      children: [
                        Text(
                          _user.fname + " " + _user.lname,
                          style: TextStyle(
                            fontSize: 35,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      "My Statistics:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.calendar_month,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      // Add your logic to handle the time range selection
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildStatisticCard(Icons.check_circle, 'Tasks', '10/20'),
                  buildStatisticCard(Icons.flag, 'Goals', '5/23'),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildStatisticCard(Icons.event, 'Events', '3/4'),
                  buildStatisticCard(Icons.schedule, 'Schedules', '2/4'),
                ],
              ),
              SizedBox(height: 30),
              SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                      'Update Details',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
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
      onChanged: (value) {},
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: Icon(myIcon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  Widget buildStatisticCard(IconData icon, String title, String value) {
    return Card(
      child: SizedBox(
        height: 150,
        width: 190, // Set a fixed height for all cards
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(fontSize: 20, color: Theme.of(context).hintColor),
              ),
              SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(fontSize: 16, color: Theme.of(context).hintColor),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int _calculateAge(DateTime? dob) {
    if (dob == null) {
      return 0; // Handle the case where the date of birth is not available
    }

    DateTime currentDate = DateTime.now();
    int age = currentDate.year - dob.year;

    // Check if the birthday has occurred this year
    if (currentDate.month < dob.month ||
        (currentDate.month == dob.month && currentDate.day < dob.day)) {
      age--;
    }

    return age;
  }
}

class StyledContainer extends StatelessWidget {
  final List<Widget> children;

  StyledContainer({required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: children
          .map(
            (child) => Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: child,
            ),
          )
          .toList(),
    );
  }
}
