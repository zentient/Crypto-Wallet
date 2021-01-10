import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  Auth({Key key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

// #eeeef3
class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        // Setting up the size of the device for Width & Height
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Color(0xFF353442),
        ),
        child: Center(
          child: Text(''),
        ),
      ),
    );
  }
}
