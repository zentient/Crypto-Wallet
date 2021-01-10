import 'package:firebase_auth/firebase_auth.dart';

// Authentication Methods

// Sign In Method
Future<bool> signInEmailAndPass(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return true;
  } catch (e) {
    print(e.toString());
    return false;
  }
}

// Register Method
Future<bool> registerEmailAndPass(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The passowrd provided needs to be 6+ chrs long.');
    } else if (e.code == 'email-already-in-use') {
      print('The email provided already exists.');
    }
    return false;
  } catch (e) {
    print(e.toString());
    return false;
  }
}
