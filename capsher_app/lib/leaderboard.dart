import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';
import 'themes.dart';

class LeaderBoard extends StatefulWidget {
  LeaderBoard({Key? key}) : super(key: key);

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {

  // @override
  // void initState() {
  //   conn.open();
  //   super.initState();

  // }

  // @override
  // void dispose() {
  //   conn.close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Filters",
          style: TextStyle(color: colorDarkGray),
        ),
        backgroundColor: colorSecondary,
        actions: getFilterList(),
      ),
      body: FutureBuilder(
        future: getLeaderList(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              // SliverFixedExtentList(
              //   delegate: SliverChildListDelegate(
              //     children = snapshot.data,
              //   ),
              //   itemExtent: 50.0,
              // ),
              ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return snapshot.data[index];
                },
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
              ),
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              )
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    );
  }
}

Future<List<Widget>> getLeaderList() async {
  final PostgreSQLConnection c = PostgreSQLConnection(
      '35.192.36.231', 5432, 'userdata',
      username: 'postgres', password: 'deslxu5sudzgMpL0');
  List<Widget> childs = [];
  int index = 0;
  await c.open();
  List<List<dynamic>> results =
      await c.query("SELECT * FROM leaderboard LIMIT 10");
  for (var user in results) {
    childs.add(
      // Row(
      //   children: [
      //     Text(user[0].toString()),
      //     Text(user[1]),
      //   ],
      // ),
      Card(
        margin: const EdgeInsets.all(15),
        child: Container(
          color: (index % 2 == 0) ? colorLightGray : colorMidGray,
          height: 80,
          alignment: Alignment.center,
          child: Text(
            "User ID = ${user[0].toString()}, ${user[1]}",
            style: const TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
    index++;
  }
  await c.close();
  return childs;
}

List<Widget> getFilterList() {
  List<String> filters = ['Local', 'State', 'Nation'];
  List<Widget> childs = [];
  for (String filter in filters) {
    childs.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
        onPressed: () {},
        child: Text(
          filter,
          style: const TextStyle(color: colorDarkGray),
        ),
      ),
    ));
  }
  return childs;
}
