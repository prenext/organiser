import 'package:Organiser/controllers/auth/signin_controller.dart';
import 'package:Organiser/views/pages/auth/forgot_pwd.dart';
import 'package:Organiser/views/pages/home/home_page.dart';
import 'package:Organiser/views/widgets/common/auth/decorate.dart';
import 'package:Organiser/views/widgets/common/auth/social_signin.dart';
import 'package:flutter/material.dart';
import 'package:Organiser/views/widgets/common/auth/custom_text_field.dart';
import 'package:Organiser/views/widgets/common/auth/auth_buttons.dart';
import 'package:Organiser/views/widgets/common/auth/greet.dart';

import 'signup.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  SignInController _signInController = SignInController();

  String? _errorText;
  @override
  void initState() {
    super.initState();

  // Add listeners to the text controllers
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
  }

 // Method to submit the form
  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final result = await _signInController.signIn(
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
        (signedIn) {
          if (signedIn == true) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          }
        },
      );
    }
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
                          title: 'Welcome Back!',
                          subtitle: 'Sign In to your Account',
                        ),
                        SizedBox(height: 25.0),
                        CustomTextField(
                          labelText: 'Email',
                          controller: _emailController,
                          trailingIcon: Icons.mail_outlined,
                          inputType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 25.0),
                        CustomTextField(
                          labelText: 'Password',
                          controller: _passwordController,
                          obscureText: true,
                          trailingIcon: Icons.lock_clock_outlined,
                          inputType: TextInputType.visiblePassword,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            AuthButtonPrimary(
                              text: 'Sign In',
                              onPressed: _submitForm,
                            ),
                            Text('OR'),
                            AuthButtonSecondary(
                              text: 'Sign Up',
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreen()),
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        TextButton(
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ForgotPasswordScreen()),
                              );
                            }),
                        SizedBox(height: 20.0),
                        Text(
                          'Or Sign In with',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.08),
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
