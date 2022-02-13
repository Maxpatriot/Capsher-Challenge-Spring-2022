import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const Color colorLightGray = Color(0xFF687996);
const Color colorMidGray = Color(0xFF4C5270);
const Color colorDarkGray = Color(0xFF222538);
const Color colorPrimary = Color(0xFF2DC7CC);
const Color colorSecondary = Color(0xFFF652A0);
const Color colorAccent = Color(0xFF42A5F5);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = "Capture Quest";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      initialRoute: 'mainScreen',
      routes: {
        'mainScreen': (context) => const MainScreen(),
        'LogInPage': (context) => const LogInPage(),
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Filters",
            style: TextStyle(color: colorDarkGray),
          ),
          backgroundColor: colorSecondary,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                onPressed: () {},
                child: const Text(
                  "Local",
                  style: TextStyle(color: colorDarkGray),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                onPressed: () {},
                child: const Text(
                  "State",
                  style: TextStyle(color: colorDarkGray),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                onPressed: () {},
                child: const Text(
                  "Nation",
                  style: TextStyle(color: colorDarkGray),
                ),
              ),
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverFixedExtentList(
              itemExtent: 60.0,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: (index % 2 == 0) ? colorMidGray : colorLightGray,
                    //color: Colors.cyan[100 * (index % 9)],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.person),
                        ),
                        Text('User Number: $index'),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ),
    const Text(
      'Index 1: Quests',
      style: optionStyle,
    ),
    const Text(
      'Index 2: My Profile',
      style: optionStyle,
    ),
  ];
  static const List<Widget> _titleOptions = <Widget>[
    Text(
      'LeaderBoard',
      style: optionStyle,
    ),
    Text(
      'Index 1: Quests',
      style: optionStyle,
    ),
    Text(
      'Index 2: My Profile',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _titleOptions.elementAt(_selectedIndex),
        backgroundColor: colorPrimary,
        foregroundColor: colorDarkGray,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Leaderboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_a_photo),
            label: 'Quests',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: colorSecondary,
        unselectedItemColor: colorPrimary,
        onTap: _onItemTapped,
        backgroundColor: colorDarkGray,
      ),
      backgroundColor: colorDarkGray,
    );
  }
}

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: primaryColor,
//           title: const Text('Welcome to the app'),
//           foregroundColor: neturalGray,
//         ),
//         body: Center(
//           child: Container(
//             child: const Text('Hi there!'),
//             margin: const EdgeInsets.all(10),
//             padding: const EdgeInsets.all(10),
//             color: secondaryColor,
//             width: 300,
//           ),
//         ),
//         backgroundColor: neturalGray,
//       ),
//     );
//   }
// }
