import 'package:flutter/material.dart';
import 'screens/dashboard.dart';
import 'screens/tasks.dart';
import 'screens/meals.dart';
import 'screens/schedules.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;

  final PageController _pageController = PageController();
  
  final List<Widget> _screens = [
    const Dashboard(),
    const Tasks(),
    const Meals(),
    const Schedule(),
  ];

  void updateAppBarTitle(int index) {
    String newTitle = '';

    switch (index) {
      case 0:
        newTitle = 'Dashboard';
        break;
      case 1:
        newTitle = 'Tasks';
        break;
      case 2:
        newTitle = 'Meals';
        break;
      case 3:
        newTitle = 'Schedule';
        break;
    }

    setState(() {
      appBarTitle = newTitle;
    });
  }

  String appBarTitle = 'Organize Your Tasks'; // Default app bar title

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 10,
        title: Text(appBarTitle),
        foregroundColor: Colors.purple,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle the search icon tap
            },
          ),
        ],
      ),
      body: PageView(
          controller: _pageController,
          children: _screens,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
            updateAppBarTitle(currentIndex);
          },
        ),
      drawer: _HomePageStateDrawer(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        mini: true,
        onPressed: () => {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Color.fromARGB(41, 207, 207, 207),
        clipBehavior: Clip.antiAlias,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 50,
          width: double.infinity,
          child: IconTheme(
            data: IconThemeData(
              size: 35,
              color: Colors.purple,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    _pageController.jumpToPage(0);
                  },
                  child: Icon(Icons.dashboard_rounded),
                ),
                GestureDetector(
                  onTap: () {
                    _pageController.jumpToPage(1);
                  },
                  child: Icon(Icons.book),
                ),
                SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {
                    _pageController.jumpToPage(2);
                  },
                  child: Icon(Icons.dining_sharp),
                ),
                GestureDetector(
                  onTap: () {
                    _pageController.jumpToPage(3);
                  },
                  child: Icon(Icons.schedule),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HomePageStateDrawer extends StatelessWidget {
  const _HomePageStateDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(220, 255, 255, 255),
      elevation: 10,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Organiser',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                SizedBox(height: 20.0), // Add spacing between elements
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage('https://picsum.photos/40/80'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Alidante',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        Text(
                          'alidante@gmail.com',
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(107, 184, 33, 243),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          ListTile(
            title: const Text('Settings'),
            leading: const Icon(
              Icons.settings,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.account_box,
            ),
            title: const Text('Account'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Theme'),
            leading: const Icon(
              Icons.color_lens_outlined,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Community'),
            leading: const Icon(
              Icons.people,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Rate us'),
            leading: const Icon(
              Icons.star,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Tips'),
            leading: const Icon(
              Icons.tips_and_updates,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('About'),
            leading: const Icon(
              Icons.details,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Log Out'),
            leading: const Icon(
              Icons.exit_to_app,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(
            height: 200,
          ),
          Text(
            '     © 2023 Alidante', // Replace with your company name
            style: TextStyle(
              fontSize: 13.0,
              color: Colors.grey,
              fontWeight: FontWeight.w100,
            ),
          ),
        ],
      ),
    );
  }
}
