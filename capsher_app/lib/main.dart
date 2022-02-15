import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'themes.dart';
import 'leaderboard.dart';

void main() {
  runApp(const MyApp());
}

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
  static const List<Widget> _widgetOptions = <Widget>[
    Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: LeaderBoard(),
    ),
    Text(
      'Index 1: Quests',
      style: styleBigBold,
    ),
    Text(
      'Index 2: My Profile',
      style: styleBigBold,
    ),
  ];
  static const List<Widget> _titleOptions = <Widget>[
    Text(
      'LeaderBoard',
      style: styleBigBold,
    ),
    Text(
      'Index 1: Quests',
      style: styleBigBold,
    ),
    Text(
      'Index 2: My Profile',
      style: styleBigBold,
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

// class LeaderBoard extends StatefulWidget {
//   const LeaderBoard({Key? key}) : super(key: key);

//   @override
//   State<LeaderBoard> createState() => _LeaderBoardState();
// }

// class _LeaderBoardState extends State<LeaderBoard> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Filters",
//           style: TextStyle(color: colorDarkGray),
//         ),
//         backgroundColor: colorSecondary,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: OutlinedButton(
//               onPressed: () {},
//               child: const Text(
//                 "Local",
//                 style: TextStyle(color: colorDarkGray),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: OutlinedButton(
//               onPressed: () {},
//               child: const Text(
//                 "State",
//                 style: TextStyle(color: colorDarkGray),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: OutlinedButton(
//               onPressed: () {},
//               child: const Text(
//                 "Nation",
//                 style: TextStyle(color: colorDarkGray),
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: CustomScrollView(
//         slivers: <Widget>[
//           SliverFixedExtentList(
//             itemExtent: 60.0,
//             delegate: SliverChildBuilderDelegate(
//               (BuildContext context, int index) {
//                 return Container(
//                   alignment: Alignment.center,
//                   color: (index % 2 == 0) ? colorMidGray : colorLightGray,
//                   //color: Colors.cyan[100 * (index % 9)],
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Icon(Icons.person),
//                       ),
//                       Text('User Number: $index'),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

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
