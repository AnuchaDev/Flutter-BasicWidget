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
];

class Appbar_workshop extends StatelessWidget {
  final appTitle = "Anucha workshop";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: HomePage(title: appTitle),
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;

  HomePage({this.title});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Choice _selected = choices[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: Icon(Icons.school),
        actions: [
          _buildActionButton(choices[0]),
          _buildActionButton(choices[1]),
          _buildPopupMenu(),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(_selected.icon),
            Text(_selected.title),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(Choice item) {
    return IconButton(
        icon: Icon(item.icon),
        onPressed: () {
          _select(item);
        });
  }

  void _select(Choice choice) {
    setState(() {
      _selected = choice;
    });
  }

  Widget _buildPopupMenu() {
    return PopupMenuButton<Choice>(
        onSelected: _select,
        itemBuilder: (context) {
          return choices.skip(2).map((Choice choice) {
            return PopupMenuItem<Choice>(
              child: Text(choice.title),
              value: choice,
            );
          }).toList();
        });
  }
}
