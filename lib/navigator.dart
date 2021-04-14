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
            child: Text('Login')),
      ),
    );
  }
}

class User{
  String fname;
  User(this.fname);
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
          onPressed: () async{
            // Navigator.pushNamed(context, '/page3');
            var user = User('Anucha');
            var tel = "080";
            var result = await Navigator.push(context, MaterialPageRoute(builder: (context)=>
              Page3(user:user,text: tel),
            ));
            print(result);
          },
          child: Text('Page2'),
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  String text;
  User user;
  Page3({this.user,this.text});
  @override
  Widget build(BuildContext context) {
    print(user.fname);
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigator workshop"),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () {
            // Navigator.pushNamed(context, '/page4');
            Navigator.pop(context,"Code");
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
            // Navigator.pushNamedAndRemoveUntil(context, '/page1', (Route<dynamic> route) => false);
            // Navigator.pushNamedAndRemoveUntil(context, '/page4', ModalRoute.withName('/page2'));
            // Navigator.popUntil(context, ModalRoute.withName('/page2'));
          },
          child: Text('Logout'),
        ),
      ),
    );
  }
}

