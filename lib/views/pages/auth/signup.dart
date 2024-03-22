import 'package:Organiser/controllers/auth/signup_controller.dart';
import 'package:Organiser/views/pages/auth/add_user_info.dart';
import 'package:Organiser/views/widgets/common/auth/social_signin.dart';
import 'package:flutter/material.dart';
import 'package:Organiser/views/widgets/common/auth/decorate.dart';
import 'package:Organiser/views/widgets/common/auth/custom_text_field.dart';
import 'package:Organiser/views/widgets/common/auth/auth_buttons.dart';
import 'package:Organiser/views/widgets/common/auth/greet.dart';

import 'signin.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  SignUpController _signUpController = SignUpController();
  String? _errorText;

  // Add listeners to the text controllers
  void initState() {
    super.initState();

    _emailController.addListener(() {
      setState(() {
        _errorText = null;
      });
    });

    _passwordController.addListener(() {
      setState(() {
        _errorText = null;
      });
    });

    _confirmPasswordController.addListener(() {
      setState(() {
        _errorText = null;
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  String? _validatePasswords(String? value) {
    if (_passwordController.text != value) {
      return 'Passwords do not match';
    }
    return null;
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final result = await _signUpController.signUp(
        context,
        _emailController.text,
        _passwordController.text,
      );
      result.fold(
        (errorMessage) {
          setState(() {
            _errorText = errorMessage;
          });
        },
        (user) {
          if (user != null) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AddAccountInfo(user: user)),
            );
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            AuthPageDecoration(),
            Center(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 500.0,
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(30.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GreetUser(
                          title: 'Create Account',
                          subtitle: 'Sign Up to Get Started',
                        ),
                        SizedBox(height: 25.0),
                        CustomTextField(
                          labelText: 'Email',
                          controller: _emailController,
                          trailingIcon: Icons.mail_outlined,
                          inputType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 16.0),
                        CustomTextField(
                          labelText: 'Password',
                          controller: _passwordController,
                          obscureText: true,
                          trailingIcon: Icons.lock_clock_outlined,
                          inputType: TextInputType.visiblePassword,
                        ),
                        SizedBox(height: 16.0),
                        CustomTextField(
                          labelText: 'Confirm Password',
                          controller: _confirmPasswordController,
                          obscureText: true,
                          trailingIcon: Icons.lock_clock_outlined,
                          inputType: TextInputType.visiblePassword,
                          validator: _validatePasswords,
                          autovalidate: true,
                        ),
                        SizedBox(height: 40.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            AuthButtonPrimary(
                              text: 'Sign Up',
                              onPressed: _submitForm,
                            ),
                            Text('OR'),
                            AuthButtonSecondary(
                              text: 'Sign In',
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignInScreen()),
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        if (_errorText != null)
                          Text(
                            (_errorText! + " Please try again."),
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 14.0,
                            ),
                          ),
                        SizedBox(height: 20.0),
                        SizedBox(height: 20.0),
                        Text(
                          'Or Sign Up with',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1),
                        SocialSignIn(
                          onGoogleSignInPressed: () {
                            // Call method to sign in with Google
                          },
                          onIOSSignInPressed: () {
                            // Call method to sign in with Apple
                          },
                          onMicrosoftSignInPressed: () {
                            // Call method to sign in with Microsoft
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
