import 'package:flutter/material.dart';
import 'package:validators/validators.dart';
import 'package:url_launcher/url_launcher.dart';

class User {
  String email;
  String password;
  String gender;
  bool agreePolicy;
  bool receiveEmail;

  User() {
    this.email = "";
    this.password = "";
    this.gender = "male";
    this.agreePolicy = false;
    this.receiveEmail = false;
  }
}

class Form_workshop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Form Validation",
      home: Scaffold(
        appBar: AppBar(title: Text("Form validation")),
        body: CustomForm(),
      ),
    );
  }
}

class CustomForm extends StatefulWidget {
  @override
  _CustomFormState createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final _formKey = GlobalKey<FormState>();

  User user = User();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              decoration: _buildInputDecoration(
                  label: 'Email', hint: 'example@gmail.com', icon: Icons.email),
              keyboardType: TextInputType.emailAddress,
              validator: _validateEmail,
              onSaved: (String value){
                user.email = value;
              },
            ),
            TextFormField(
              decoration:
                  _buildInputDecoration(label: 'Password', icon: Icons.lock),
              obscureText: true,
              validator: _validatePassword,
              onSaved: (String value){
                user.password = value;
              },
            ),
            _buildGenderForm(),
            _buildReceiveEamilForm(),
            _buildAgreePolicyForm(),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(
      {String label, String hint, IconData icon}) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      icon: Icon(icon),
    );
  }

  Widget _buildAgreePolicyForm() {
    return Container(
      margin: EdgeInsets.only(top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(
            value: user.agreePolicy,
            onChanged: (value) {
              setState(() {
                user.agreePolicy = value;
              });
            },
            activeColor: Colors.orange,
          ),
          Text("I Agree the "),
          GestureDetector(
            onTap: _launchURL,
            child: Text(
              "Privacy Policy",
              style: TextStyle(
                  color: Colors.blue, decoration: TextDecoration.underline),
            ),
          )
        ],
      ),
    );
  }

  String _validateEmail(String value) {
    if (value.isEmpty) {
      return "The email is Empty";
    }
    if (!isEmail(value)) {
      return "The email must be a valid email";
    }
  }

  String _validatePassword(String value) {
    if (value.length < 8) {
      return "The Password must be at least 8 charactors.";
    }
  }

  Widget _buildSubmitButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 12),
      child: RaisedButton(
        onPressed: _submit,
        color: Colors.blue,
        child: Text(
          'Submit',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  void _submit() {
    if (this._formKey.currentState.validate()) {
      if (user.agreePolicy == false) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Title'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: [
                      Text("Detail1"),
                      Text("Detail2"),
                      Text("Detail3"),
                      Icon(Icons.directions_ferry),
                    ],
                  ),
                ),
                actions: [
                  IconButton(icon: Icon(Icons.cake), onPressed: () {}),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Close"),
                  )
                ],
              );
            },
            barrierDismissible: true);
      }else{
        _formKey.currentState.save();
        print(user.email);
        print(user.password);
        print(user.gender);
        print(user.receiveEmail);
        print(user.agreePolicy);
      }
    }
  }

  void _handleRadioValueChange(value) {
    setState(() {
      user.gender = value;
    });
  }

  Widget _buildReceiveEamilForm() {
    return Row(
      children: [
        Text(
          'Receive Email',
          style: TextStyle(fontSize: 16),
        ),
        Switch(
            activeColor: Colors.orange,
            value: user.receiveEmail,
            onChanged: (select) {
              setState(() {
                user.receiveEmail = select;
              });
            })
      ],
    );
  }

  Widget _buildGenderForm() {
    final Color activeColor = Colors.orange;

    return Container(
      margin: EdgeInsets.only(top: 12),
      child: Row(
        children: [
          Text(
            'Gender',
            style: TextStyle(fontSize: 16),
          ),
          Radio(
              activeColor: activeColor,
              value: "male",
              groupValue: user.gender,
              onChanged: _handleRadioValueChange),
          Text("Male"),
          Radio(
              activeColor: activeColor,
              value: "Female",
              groupValue: user.gender,
              onChanged: _handleRadioValueChange),
          Text("Female"),
        ],
      ),
    );
  }

  _launchURL() async {
    const _url = 'http://www.codemobiles.com';

    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
  }
}
