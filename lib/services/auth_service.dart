import 'db_helper.dart';

class AuthService {
  Future<void> registerUser(String email, String password) async {
    final conn = await DatabaseHelper.connect();
    try {
      await conn.query(
        'INSERT INTO users (email, password) VALUES (?, ?)',
        [email, password],
      );
      print("✅ User Registered Successfully!");
    } catch (e) {
      print("❌ Registration Failed: $e");
    } finally {
      await conn.close();
    }
  }

  Future<bool> loginUser(String email, String password) async {
    final conn = await DatabaseHelper.connect();
    try {
      var result = await conn.query(
        'SELECT * FROM users WHERE email = ? AND password = ?',
        [email, password],
      );
      if (result.isNotEmpty) {
        print("✅ Login Successful");
        return true;
      } else {
        print("❌ Invalid Credentials");
        return false;
      }
    } catch (e) {
      print("❌ Login Error: $e");
      return false;
    } finally {
      await conn.close();
    }
  }
}
