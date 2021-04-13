import 'package:basicflutter/Form.dart';
import 'package:basicflutter/Tabs.dart';
import 'package:flutter/material.dart';

import 'appbar.dart';

class Navigator_workshop extends StatelessWidget {
  final _route = <String, WidgetBuilder>{
    '/page1': (BuildContext context) => Page1(),
    '/page2': (BuildContext context) => Page2(),
    '/page3': (BuildContext context) => Page3(),
    '/page4': (BuildContext context) => Page4(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: _route,
      title: "Navigator workshop",
      home: Page1(),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigator workshop"),
      ),
      body: Center(
        child: FlatButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/page2');
            },
            child: Text('Next Page')),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigator workshop"),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () {
            Navigator.pushNamed(context, '/page3');
          },
          child: Text('Page2'),
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigator workshop"),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, '/page4');
          },
          child: Text('Page3'),
        ),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigator workshop"),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Page4'),
        ),
      ),
    );
  }
}

