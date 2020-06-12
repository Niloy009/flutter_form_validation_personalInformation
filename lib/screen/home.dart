import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart' show isEmail, isAlpha;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final formkey = new GlobalKey<FormState>();

  String name = "";
  String email = "";

  Map<String, String> information = {
    "name": "",
    "email": "",
  };

  Widget _nameField() {
    return TextFormField(
      validator: (String input) {
        return input.contains('@') ? "Don't use \"@\" Char" : null;
      },
      decoration: InputDecoration(
          labelText: "Name",
          labelStyle: TextStyle(fontSize: 20),
          hintText: "Please provide your name"),
      onSaved: (value) {
        information["name"] = value;
        setState(() {
          this.name = information['name'];
        });
      },
    );
  }

  Widget _emailField() {
    return TextFormField(
      validator: (String input) {
        return isEmail(input) == false ? "Invalid Email" : null;
      },
      decoration: InputDecoration(
          labelText: "Email",
          labelStyle: TextStyle(fontSize: 20),
          hintText: "Please provide your email"),
      onSaved: (value) {
        information["email"] = value;
        setState(() {
          this.email = information['email'];
        });
      },
    );
  }

  Widget _submitButton() {
    return RaisedButton.icon(
      onPressed: () {
        if (formkey.currentState.validate()) {
          formkey.currentState.save();
        }
      },
      icon: Icon(Icons.done),
      color: Colors.green,
      label: Text(
        "Submit",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Personal Information"),
          ),
          body: Container(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Form(
                key: formkey,
                child: Column(
                  children: <Widget>[
                    _nameField(),
                    _emailField(),
                    SizedBox(
                      height: 10,
                    ),
                    _submitButton(),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Name: $name",
                            style: TextStyle(fontSize: 25),
                          ),
                          Text(
                            "Email: $email",
                            style: TextStyle(fontSize: 25),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
