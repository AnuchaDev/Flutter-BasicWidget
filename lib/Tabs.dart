// import 'dart:html';

import 'package:flutter/material.dart';

class Choice {
  final String title;
  final IconData icon;

  const Choice({this.title, this.icon});
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Boat', icon: Icons.directions_boat),
  const Choice(title: 'Bus', icon: Icons.directions_bus),
  const Choice(title: 'Train', icon: Icons.directions_railway),
  const Choice(title: 'Walk', icon: Icons.directions_walk),
  const Choice(title: 'Ferry', icon: Icons.directions_ferry),

];

class Tabs_workshop extends StatelessWidget {
  final String appTitle = "Anucha workshop Tabs";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: SafeArea(
        child: DefaultTabController(
          length: choices.length,
          child: Scaffold(
            appBar: AppBar(
                title: Text(appTitle),
                // bottom: TabBar(
                //   onTap: (index) {
                //     print("${index}");
                //   },
                //   isScrollable: true,
                //   tabs: choices.map((Choice choice) {
                //     return Tab(
                //       child: Row(
                //         children: [
                //           Icon(choice.icon),
                //           Container(
                //             padding: EdgeInsets.only(left: 10.0),
                //             child: Text(choice.title),
                //           ),
                //         ],
                //       ),
                //     );
                //   }).toList(),
                // )
                ),
            body: TabBarView(
              children: choices.map((Choice choice) {
                return Center(
                  child: Text(choice.title),
                );
              }).toList(),
            ),
            bottomNavigationBar: Container(
              color: Theme.of(context).primaryColor,
              child: TabBar(
                onTap: (index) {
                  print("${index}");
                },
                isScrollable: true,
                tabs: choices.map((Choice choice) {
                  return Tab(
                    text: choice.title,
                    icon: Icon(choice.icon),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
