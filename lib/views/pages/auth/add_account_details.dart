import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Organiser/views/services/user_provider.dart';
import 'package:Organiser/views/widgets/common/auth/custom_text_field.dart';

class AddAccountInfo extends StatefulWidget {
  final String userId;

  AddAccountInfo({required this.userId});

  @override
  _AddAccountInfoState createState() => _AddAccountInfoState();
}

class _AddAccountInfoState extends State<AddAccountInfo> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();
  final _additionalInfoController = TextEditingController();
  final _profilePhotoUrlController = TextEditingController();

  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Account Info')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Stepper(
            currentStep: _currentStep,
            onStepContinue: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                if (_currentStep < 3) {
                  setState(() {
                    _currentStep++;
                  });
                } else {
                  // Perform action for the last step
                  final updates = {
                    'username': _usernameController.text,
                    'fname': _fnameController.text,
                    'lname': _lnameController.text,
                    'additionalInfo': _additionalInfoController.text,
                    'profilePhotoUrl': _profilePhotoUrlController.text,
                  };
                  Provider.of<UserProvider>(context, listen: false)
                      .updateUser(widget.userId, updates);
                  Navigator.pop(context); // Close the screen after updating
                }
              }
            },
            onStepCancel: () {
              if (_currentStep > 0) {
                setState(() {
                  _currentStep--;
                });
              }
            },
            steps: [
              _buildStep(
                title: 'Username',
                content: CustomTextField(
                  labelText: 'Username',
                  controller: _usernameController,
                  trailingIcon: Icons.person_outline,
                  inputType: TextInputType.name,
                ),
              ),
              _buildStep(
                title: 'First Name & Last Name',
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      labelText: 'First Name',
                      controller: _fnameController,
                      trailingIcon: Icons.person_outline,
                      inputType: TextInputType.name,
                    ),
                    SizedBox(height: 16),
                    CustomTextField(
                      labelText: 'Last Name',
                      controller: _lnameController,
                      trailingIcon: Icons.person_outline,
                      inputType: TextInputType.name,
                    ),
                  ],
                ),
              ),
              _buildStep(
                title: 'Additional Information',
                content: CustomTextField(
                  labelText: 'Additional Information',
                  controller: _additionalInfoController,
                  trailingIcon: Icons.info_outline,
                  inputType: TextInputType.text,
                ),
              ),
              _buildStep(
                title: 'Profile Image URL',
                content: CustomTextField(
                  labelText: 'Profile Image URL',
                  controller: _profilePhotoUrlController,
                  trailingIcon: Icons.image_outlined,
                  inputType: TextInputType.url,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Step _buildStep({required String title, required Widget content}) {
    return Step(
      title: Text(title),
      content: content,
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _fnameController.dispose();
    _lnameController.dispose();
    _additionalInfoController.dispose();
    _profilePhotoUrlController.dispose();
    super.dispose();
  }
}
