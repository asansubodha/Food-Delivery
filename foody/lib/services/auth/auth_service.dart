import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //  get instance of firebase auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // get current user
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  // sign in with email and password
  Future<UserCredential> signinWithEmailPassword(String email, password) async {
    try {
      // sign in with email and password
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // handle error
      throw Exception(e.code);
    }
  }

  // register with email and password
  Future<UserCredential> signUpWithEmailPassword(String email, password) async {
    try {
      // sign in with email and password
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // handle error
      throw Exception(e.code);
    }
  }

  // sign out
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
