import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:novo_projeto/models/user_model.dart';

class AuthService {
  final auth.FirebaseAuth firebaseAuth = auth.FirebaseAuth.instance;

  User? userFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return User(user.uid, user.email, "");
  }

  Stream<User?>? get user {
    return firebaseAuth.authStateChanges().map(userFirebase);
  }

  Future<User?> singInWithEmailAndPassword(
      String email, String password) async {
    final credential = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return userFirebase(credential.user);
  }

  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return userFirebase(credential.user);
  }

  Future<void> singOut() async {
    return await firebaseAuth.signOut();
  }
}
