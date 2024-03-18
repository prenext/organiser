import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:Organiser/models/user.dart';
import 'package:Organiser/services/user_provider.dart';
import 'package:Organiser/views/auth/forgot_pwd.dart';
import 'package:Organiser/views/auth/register.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> Signin(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Fetch additional user data from your database and create a UserModel
      UserModel user = await getUserData(userCredential.user!.uid);

      // Update the UserProvider with the user data
      Provider.of<UserProvider>(context, listen: false).setUser(user);
    } catch (e) {
      // Handle login errors here
      print("Login error: $e");
    }

    Navigator.pop(context); // Close the loading dialog
  }

  // Define a function to fetch user data from Firestore
  Future<UserModel> getUserData(String uid) async {
    DocumentSnapshot userSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    // Map the snapshot data to your UserModel
    Map<String, dynamic> userData = userSnapshot.data() as Map<String, dynamic>;

    // Create a UserModel instance
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
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Welocome Back!",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Signin to yout account:",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w100,
                    )),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(height: 16.0),
            _buildRoundedTextField(
              controller: _emailController,
              labelText: 'Email',
              myIcon: Icons.mail_outlined,
            ),
            SizedBox(height: 16.0),
            _buildRoundedTextField(
              controller: _passwordController,
              labelText: 'Password',
              obscureText: true,
              myIcon: Icons.lock_clock_outlined,
            ),
            SizedBox(height: 40.0),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // button to handle user sign in
                      ElevatedButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(15),
                          padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(
                                horizontal: 50.0, vertical: 15.0),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Signin(context);
                        },
                        child: Text('Login'),
                      ),
                      Text('OR'),
      
                      // Button to direct user to the signup page
                      OutlinedButton(
                        onPressed: () {
                          showDialog(
                            useSafeArea: false,
                            context: context,
                            builder: (BuildContext context) {
                              return RegisterScreen();
                            },
                          );
                        },
                        child: Text('Sign Up'),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(
                                horizontal: 50.0, vertical: 15.0),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              side: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.primary),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        ),
                      ),
                    ])),
            SizedBox(
              height: 20,
            ),
            Center(
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RestPasswordScreen()),
                    );
                  },
                  child: Text("Forgot Password?")),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoundedTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData myIcon,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: Icon(myIcon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}
