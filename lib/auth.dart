import 'dart:ui';
import 'package:crypto_wallet/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:crypto_wallet/net/flutterfire.dart';

class Auth extends StatefulWidget {
  Auth({Key key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  // Controllers to capture the input the users enters on the form
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordontroller = TextEditingController();

  // Error Code
  String err = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // Setting up the size of the device for Width & Height
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Color(0xFFfcfdfe),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30.0, horizontal: 24.0),
                    child: Text(
                      'Welcome',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color(0xFF19181f),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter'),
                    ),
                  ),
                ],
              ),
              Image.asset(
                'assets/bitcoin.png',
                width: MediaQuery.of(context).size.width / 1.5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  '$err',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Theme(
                      data: new ThemeData(
                        primaryColor: Color(0xFF723ceb),
                        primaryColorDark: Color(0xFF19181f),
                      ),
                      child: TextFormField(
                        style: TextStyle(color: Color(0xFF19181f)),
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: 'user@email.com',
                          hintStyle: TextStyle(color: Colors.grey),
                          labelText: 'Email address',
                          labelStyle: TextStyle(
                            color: Color(0xFF19181f),
                          ),
                        ),
                      ),
                    ),
                    Theme(
                      data: new ThemeData(
                        primaryColor: Color(0xFF723ceb),
                        primaryColorDark: Color(0xFFeeeef3),
                      ),
                      child: TextFormField(
                        obscureText: true,
                        style: TextStyle(color: Color(0xFF19181f)),
                        controller: _passwordontroller,
                        decoration: InputDecoration(
                          hintText: '*********',
                          hintStyle: TextStyle(color: Colors.grey),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: Color(0xFF19181f),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                // Setting up butto width depending on device screen size
                width: MediaQuery.of(context).size.width / 1.2,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Color(0xFF723ceb),
                ),
                child: MaterialButton(
                  onPressed: () async {
                    String willNavigateHome = await signInEmailAndPass(
                        _emailController.text, _passwordontroller.text);
                    if (willNavigateHome == null) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    } else {
                      print('Error logging in.');
                      setState(() {
                        err = willNavigateHome;
                      });
                    }
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: Color(0xFFeeeef3)),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Color(0xFFeeeef3),
                ),
                child: MaterialButton(
                  onPressed: () async {
                    String willNavigateHome = await registerEmailAndPass(
                        _emailController.text, _passwordontroller.text);
                    willNavigateHome == null
                        ? Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()))
                        : print('Error logging in.');
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Color(0xFF19181f),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
