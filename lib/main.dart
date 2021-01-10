import 'package:flutter/material.dart';

void main() => runApp(CryptoWallet());

class CryptoWallet extends StatefulWidget {
  CryptoWallet({Key key}) : super(key: key);

  @override
  _CryptoWalletState createState() => _CryptoWalletState();
}

class _CryptoWalletState extends State<CryptoWallet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: Text('Hello!'),
          ),
        ),
      ),
    );
  }
}
