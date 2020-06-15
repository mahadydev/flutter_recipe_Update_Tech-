import 'package:fancy_dialog/fancy_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_updatetechltd/provider/authentication.dart';
import 'package:recipe_app_updatetechltd/widget/verticaltext.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _loading = false;
  Authentication _auth;
  String _email;
  String _password;
  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _auth = Provider.of<Authentication>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.orange,
                Colors.deepOrangeAccent,
              ]),
        ),
        child: _loading
            ? Center(child: CircularProgressIndicator())
            : ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          VerticalText('Sign In'),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 30.0, left: 10.0),
                            child: Container(
                              //color: Colors.green,
                              height: 200,
                              width: 200,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    height: 60,
                                  ),
                                  Center(
                                    child: Text(
                                      'A Flutter Recipe App using Rest API',
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 50, left: 50, right: 50),
                        child: Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          child: TextField(
                            controller: _emailController,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              fillColor: Colors.lightBlueAccent,
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 50, right: 50),
                        child: Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          child: TextField(
                            controller: _passwordController,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 40, right: 50, left: 200),
                        child: Container(
                          alignment: Alignment.bottomRight,
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue[300],
                                blurRadius:
                                    10.0, // has the effect of softening the shadow
                                spreadRadius:
                                    1.0, // has the effect of extending the shadow
                                offset: Offset(
                                  5.0, // horizontal, move right 10
                                  5.0, // vertical, move down 10
                                ),
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: FlatButton(
                            onPressed: () async {
                              setState(() {
                                _loading = true;
                              });
                              _email = _emailController.text;
                              _password = _passwordController.text;
                              await _auth.authenticate(
                                  email: _email,
                                  password: _password,
                                  context: context);
                              setState(() {
                                _loading = false;
                              });
                              _auth.loggedIn
                                  ? Navigator.of(context)
                                      .pushReplacementNamed('/home')
                                  : showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          FancyDialog(
                                        title: "Login Error",
                                        descreption:
                                            "Please check the login details for proper authentication!",
                                      ),
                                    );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'OK',
                                  style: TextStyle(
                                    color: Colors.lightBlueAccent,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.lightBlueAccent,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 30),
                        child: Container(
                          alignment: Alignment.topRight,
                          //color: Colors.red,
                          height: 20,
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Your first time?',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                              ),
                              FlatButton(
                                padding: EdgeInsets.all(0),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/register');
                                },
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
