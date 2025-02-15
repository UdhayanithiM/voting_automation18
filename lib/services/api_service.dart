import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ApiService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // ✅ Register User with Firebase Authentication
  Future<String> registerUser(String name, String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Store additional user info in Firestore
      await _db.collection("users").doc(userCredential.user!.uid).set({
        "name": name,
        "email": email,
        "createdAt": FieldValue.serverTimestamp(),
      });

      return "✅ Registration successful!";
    } on FirebaseAuthException catch (e) {
      return "❌ Registration failed: ${e.message}";
    }
  }

  // ✅ Login User with Firebase Authentication
  Future<bool> loginUser(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      print("❌ Login error: ${e.message}");
      return false;
    }
  }

  // ✅ Logout User
  Future<void> logoutUser() async {
    await _auth.signOut();
  }
}
