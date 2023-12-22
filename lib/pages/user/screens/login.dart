import 'package:Organiser/pages/user/screens/forgot_pwd.dart';
import 'package:Organiser/pages/user/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // login text contollers fields
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future Signin() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());

    Navigator.pop(context);
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Welocome Back!",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
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
                            Signin();
                          },
                          child: Text('Login'),
                        ),
                        Text('OR'),

                        // Button to direct user to the signup page
                        OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        RegisterScreen(),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  const begin = Offset(1.0, 0.0);
                                  const end = Offset.zero;
                                  const curve = Curves.easeInOut;

                                  var tween = Tween(begin: begin, end: end)
                                      .chain(CurveTween(curve: curve));

                                  var offsetAnimation = animation.drive(tween);

                                  return SlideTransition(
                                      position: offsetAnimation, child: child);
                                },
                              ),
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
                                    color: Theme.of(context).primaryColor),
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
              SizedBox(height: 100.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildIconButton(
                    onPressed: () {
                      // Add your Google login logic here
                      print('Google login pressed');
                    },
                    icon: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          colors: [
                            Color.fromARGB(255, 4, 88, 223),
                            Color.fromARGB(255, 2, 216, 59),
                            Color.fromARGB(255, 236, 178, 1),
                            Color.fromARGB(255, 192, 17, 1),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds);
                      },
                      child: FaIcon(
                        FontAwesomeIcons.google,
                        size: 30,
                        color: const Color.fromARGB(255, 255, 223, 223),
                      ),
                    ),
                    label: "Google",
                  ),
                  _buildIconButton(
                    onPressed: () {
                      // Add your Apple login logic here
                      print('Apple login pressed');
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.apple,
                      size: 40,
                    ),
                    label: 'Apple',
                  ),
                  _buildIconButton(
                    onPressed: () {
                      // Add your Microsoft login logic here
                      print('Microsoft login pressed');
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.microsoft,
                      size: 30,
                      color: Colors.lightBlue,
                    ),
                    label: 'Microsoft',
                  ),
                ],
              )
            ],
          ),
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

  Widget _buildIconButton({
    required VoidCallback onPressed,
    required Widget icon,
    required String label,
  }) {
    return Column(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: icon,
        ),
        SizedBox(height: 4.0),
        Text(
          label,
          style: TextStyle(fontSize: 12.0),
        ),
      ],
    );
  }
}
