import 'package:Organiser/pages/user/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 80.0),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(36, 243, 33, 243),
                Color.fromARGB(0, 175, 112, 76),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "Welcome!",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Create a new account:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                _buildRoundedTextField(
                  controller: _usernameController,
                  labelText: 'Username',
                  myIcon: Icons.person,
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
                SizedBox(height: 16.0),
                _buildRoundedTextField(
                  controller: _confirmPasswordController,
                  labelText: 'Confirm Password',
                  obscureText: true,
                  myIcon: Icons.lock_clock_sharp,
                ),
                SizedBox(height: 30.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ElevatedButton(
                        style: ButtonStyle(
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
                          // Add your registration logic here
                          String username = _usernameController.text;
                          String email = _emailController.text;
                          String password = _passwordController.text;
                          String confirmPassword =
                              _confirmPasswordController.text;
                          // Perform registration validation or authentication
                          // For simplicity, let's just print the values for now
                          print('Username: $username');
                          print('Email: $email');
                          print('Password: $password');
                          print('Confirm Password: $confirmPassword');
                        },
                        child: Text('Register'),
                      ),
                      Text('OR'),
                      OutlinedButton(
                        onPressed: () {
                           Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      LoginScreen(),
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
                        child: Text('Login'),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(
                                horizontal: 50.0, vertical: 15.0),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Theme.of(context)
                                      .primaryColor), // Customize the border color
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 150.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildIconButton(
                      onPressed: () {
                        // Add your Google registration logic here
                        print('Google registration pressed');
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
                        // Add your Apple registration logic here
                        print('Apple registration pressed');
                      },
                      icon: FaIcon(
                        FontAwesomeIcons.apple,
                        size: 40,
                      ),
                      label: 'Apple',
                    ),
                    _buildIconButton(
                      onPressed: () {
                        // Add your Microsoft registration logic here
                        print('Microsoft registration pressed');
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
