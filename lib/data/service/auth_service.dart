import '../models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthService{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<UserModel> get user{
    return _firebaseAuth.authStateChanges().map((user){
      return UserModel(email: user?.email ?? "");
    });
  }
  
  signIn(String email, String password) async{
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  register(String email, String password) async{
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  signOut() async{
    await _firebaseAuth.signOut();
  }
}