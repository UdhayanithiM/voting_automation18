import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Add user to Firestore
  Future<void> addUser(String name, String email, String password) async {
    try {
      await _db.collection('users').add({
        'name': name,
        'email': email,
        'password': password,
        'createdAt': FieldValue.serverTimestamp(),
      });
      print("✅ User added successfully");
    } catch (e) {
      print("❌ Error adding user: $e");
    }
  }

  // Fetch users
  Future<List<Map<String, dynamic>>> fetchUsers() async {
    try {
      QuerySnapshot snapshot = await _db.collection('users').get();
      return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      print("❌ Error fetching users: $e");
      return [];
    }
  }
}
