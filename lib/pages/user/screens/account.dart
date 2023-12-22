import 'package:Organiser/models/collections/user.dart';
import 'package:Organiser/pages/user/screens/edit_details.dart';
import 'package:Organiser/widgets/DialogBoxes/logout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AccountPage extends StatefulWidget {
  final String userid;

  AccountPage({required this.userid});

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  late UserModel _user;
  final user = FirebaseAuth.instance.currentUser!;

  Future<void> _showConfirmationDialog(BuildContext context) async {
    await LogoutDialog.show(context);
  }

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  // Load user data from Firestore
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
              icon: Icon(Icons.edit_note_outlined, size: 30),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditAcountDetails()),
                );
              },
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
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 4.0,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: _user.profilePhotoUrl != null
                            ? Image.network(
                                _user.profilePhotoUrl!,
                                scale: 1.0,
                              ).image
                            : null,
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
                        Text(
                          _user.email,
                          style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          _user.username,
                          style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
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
                      "My Statistics",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      "Personal Information",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditAcountDetails()),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 40),
              Card(
                child: StyledContainer(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("First Name:",
                            style: TextStyle(color: Colors.grey, fontSize: 20)),
                        Text(_user.fname,
                            style: TextStyle(color: Colors.grey, fontSize: 20))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Last Name:",
                            style: TextStyle(color: Colors.grey, fontSize: 20)),
                        Text(_user.lname,
                            style: TextStyle(color: Colors.grey, fontSize: 20))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Age:",
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                        ),
                        Text(
                          _calculateAge(_user.dob).toString(),
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Gender:",
                            style: TextStyle(color: Colors.grey, fontSize: 20)),
                        Text(_user.gender ?? '',
                            style: TextStyle(color: Colors.grey, fontSize: 20))
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    _showConfirmationDialog(context);
                  },
                  child: Text('Log Out'),
                ),
              )
            ],
          ),
        ));
  }

  Widget buildStatisticCard(IconData icon, String title, String value) {
    return Card(
      child: SizedBox(
        height: 150,
        width: 180, // Set a fixed height for all cards
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
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(value),
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
