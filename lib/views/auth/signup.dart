import 'package:Organiser/widgets/common/auth/social_signin.dart';
import 'package:flutter/material.dart';
import 'package:Organiser/widgets/common/auth/decorate.dart';
import 'package:Organiser/widgets/common/auth/custom_text_field.dart';
import 'package:Organiser/widgets/common/auth/auth_buttons.dart';
import 'package:Organiser/widgets/common/auth/greet.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, proceed with sign-up logic
      //TODO: Implement user sign up
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
                                Navigator.pop(context);
                              },
                            ),
                           
                          ],
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
