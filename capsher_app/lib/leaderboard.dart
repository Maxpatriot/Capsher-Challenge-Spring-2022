import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';
import 'themes.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({Key? key}) : super(key: key);

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {

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
    );
  }
}
