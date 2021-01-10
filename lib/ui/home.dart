import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_wallet/ui/add_coin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Color(0xFFeeeef3),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: StreamBuilder(
              // Looking at the user doc of current user and checkout any doc under 'Coins'.
              stream: FirebaseFirestore.instance
                  .collection('Users')
                  .doc(FirebaseAuth.instance.currentUser.uid)
                  .collection('Coins')
                  .snapshots(),
              builder:
                  (BuildContext contx, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView(
                  // Taking the data and mapping it to a ListView, returning a Container with each document
                  children: snapshot.data.docs.map(
                    (document) {
                      return Container(
                        width: 0.0,
                        height: 0.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Coin Name: $document.id'),
                            Text('Amount Owned: ${document.data()['Amount']}'),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                );
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddCoin(),
              ),
            );
          },
          child: Icon(
            Icons.add,
            color: Color(0xFFeeeef3),
          ),
          backgroundColor: Color(0xFF723ceb),
        ),
      ),
    );
  }
}
