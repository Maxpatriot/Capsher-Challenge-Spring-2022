import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';
import 'themes.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({Key? key}) : super(key: key);

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  final conn = PostgreSQLConnection('35.192.36.231', 5243, 'leaderboard',
      username: 'postgres', password: 'deslxu5sudzgMpL0');

  @override
  void initState() {
    super.initState();
    if (conn.isClosed) {
      conn.open();
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (!conn.isClosed) {
      conn.close();
    }
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

  Future<List<Widget>> getLeaderList(PostgreSQLConnection c) async {
    List<Widget> childs = [];
    List<List<dynamic>> results =
        await c.query("SELECT * FROM leaderboard LIMIT 10");
    for (var user in results) {
      childs.add(Row(
        children: [
          Text(user[0]),
          Text(user[1]),
        ],
      ));
    }
    return childs;
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
      body: ListView(
        children: await getLeaderList(conn),
      )
    );
  }
}
