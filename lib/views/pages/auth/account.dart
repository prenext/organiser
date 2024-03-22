import 'package:Organiser/models/user.dart';
import 'package:Organiser/views/services/user_provider.dart';
import 'package:Organiser/views/widgets/common/back_button.dart';
import 'package:Organiser/views/widgets/styled/account_page/user_actions.dart';
import 'package:Organiser/views/widgets/styled/account_page/user_details.dart';
import 'package:Organiser/views/widgets/styled/account_page/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.0),
        leading: CustomBackButton(),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, _) {
          final UserModel? user = userProvider.user;
          if (user != null) {
            return SingleChildScrollView(
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.08),
                  constraints: BoxConstraints(
                    maxWidth: 500,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      UserProfileWidget(
                        fname: user.fname ?? "",
                        lname: user.lname ?? "",
                        image: user.profilePhotoUrl ?? "",
                        joinDate: user.createdAt ?? DateTime.now(),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Personal Information',
                              style: Theme.of(context).textTheme.headlineSmall,
                              textAlign: TextAlign.start,
                            ),
                            //edit button
                            IconButton(
                              padding: EdgeInsets.zero,
                              icon: Icon(Icons.edit),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      UserDetailsWidget(
                        email: user.email,
                        dob: user.dob ?? DateTime.now(), 
                        username: user.username,
                        gender: user.gender ?? "",
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02
                          ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Utilities',
                              style: Theme.of(context).textTheme.headlineSmall,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                      UserActionsWidget(),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
