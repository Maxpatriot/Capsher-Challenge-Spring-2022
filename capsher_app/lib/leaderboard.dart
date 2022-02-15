import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';
import 'themes.dart';

Future<List<Widget>> getLeaderList(PostgreSQLConnection c) async {
  List<Widget> childs = [];
  await c.open();
  List<List<dynamic>> results =
      await c.query("SELECT * FROM leaderboard LIMIT 10");
  for (var user in results) {
    childs.add(
      Row(
        children: [
          Text(user[0]),
          Text(user[1]),
        ],
      ),
    );
  }
  await c.close();
  return childs;
}

List<String> filters = ['Local', 'State', 'Nation'];
List<Widget> getFilterList() {
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

class LeaderBoard extends StatelessWidget {
  LeaderBoard({Key? key}) : super(key: key);

  final conn = PostgreSQLConnection('35.192.36.231', 5243, 'userdata',
      username: 'postgres', password: 'deslxu5sudzgMpL0');

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
        future: getLeaderList(conn),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text('${snapshot.data[index]}');
                },
              ),
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
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
