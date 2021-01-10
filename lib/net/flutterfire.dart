import 'package:firebase_auth/firebase_auth.dart';

// Authentication Methods
String errCode = '';

// Sign Out Method
Future<void> signOutOfAccount() async {
  await FirebaseAuth.instance.signOut();
}

// Sign In Method
Future<String> signInEmailAndPass(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return null;
  } on FirebaseAuthException catch (e) {
    print(e.toString());
    return e.message;
  }
}

// Register Method
Future<String> registerEmailAndPass(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return null;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The passowrd provided needs to be 6+ chrs long.');
    } else if (e.code == 'email-already-in-use') {
      print('The email provided already exists.');
    }
    return e.message;
  } catch (e) {
    print(e.toString());
    return e.message;
  }
}
