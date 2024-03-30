import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String selectedFilter = 'This Week';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(10),
                height: 500,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  border: Border.all(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.1)),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Activity Overview',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Tasks',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 10,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "This Week",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(5),
                height: 230,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  border: Border.all(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.1)),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Goals Progress',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Add a spacer
                        Spacer(),
                        IconButton(
                            onPressed: () => {},
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                            ))
                      ],
                    ),
                    Divider(
                      height: 1,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text("Buy a new car",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  )),
                              Spacer(),
                              Text("50%",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  )),
                            ],
                          ),
                          LinearProgressIndicator(
                            minHeight: 10,
                            borderRadius: BorderRadius.circular(15),
                            value: 0.9,
                            backgroundColor: Colors.grey.withOpacity(0.5),
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.green),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text("Learn Data Science",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  )),
                              Spacer(),
                              Text("70%",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  )),
                            ],
                          ),
                          LinearProgressIndicator(
                             minHeight: 10,
                            borderRadius: BorderRadius.circular(15),
                            value: 0.7,
                            backgroundColor: Colors.grey.withOpacity(0.5),
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.amber),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text("Build Organiser App",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  )),
                              Spacer(),
                              Text("30%",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  )),
                            ],
                          ),
                          LinearProgressIndicator(
                             minHeight: 10,
                            borderRadius: BorderRadius.circular(15),
                            value: 0.3,
                            backgroundColor: Colors.grey.withOpacity(0.5),
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.redAccent
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text("You're on track to achieve your goals",
                        style: TextStyle(
                          fontSize: 12.0,
                        )),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(5),
                height: 700,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  border: Border.all(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.1)),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome to Organiser',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Organise your life with ease',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
