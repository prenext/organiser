import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RestPasswordScreen extends StatefulWidget {
  @override
  _RestPasswordScreenState createState() => _RestPasswordScreenState();
}

class _RestPasswordScreenState extends State<RestPasswordScreen> {
  TextEditingController _emailController = TextEditingController();
  bool _isSuccess = false;
  // ignore: unused_field
  String _message = '';

  Future<void> resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      setState(() {
        _isSuccess = true;
        _message = 'Email sent successfully';
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        _isSuccess = false;
        _message = 'Error: ${e.message}';
      });
    } catch (e) {
      setState(() {
        _isSuccess = false;
        _message = 'Error: Something went wrong';
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 80.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).secondaryHeaderColor,
              Theme.of(context).scaffoldBackgroundColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Center(
              child: _isSuccess
                  ? Column(
                      children: [
                        Icon(
                          Icons.check_circle,
                          size: 50,
                          color: Colors.green,
                        ),
                        SizedBox(height: 10),
                         Text(
                          "Email Sent Successifully",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "A reset email was sent to " + _emailController.text.trim(),
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Forgot Password",
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "You will receive an email to reset your password.",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
            ),
              SizedBox(
                height: 50,
              ),
              _buildRoundedTextField(
                controller: _emailController,
                labelText: 'Email',
                myIcon: Icons.mail_outlined,
              ),
              SizedBox(height: 40.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
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
                        resetPassword();
                      },
                      child: Text('Reset Password'),
                    ),
                    Text('OR'),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Go Back'),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(
                              horizontal: 50.0, vertical: 15.0),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            side: BorderSide(
                                color: Theme.of(context).primaryColor),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(height: 100.0)
            ]),
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
