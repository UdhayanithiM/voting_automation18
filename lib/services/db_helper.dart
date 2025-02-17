import 'package:mysql1/mysql1.dart';

class DatabaseHelper {
  static final String _host = "YOUR_GOOGLE_CLOUD_MYSQL_IP";
  static final int _port = 3306;
  static final String _user = "flutter_user";
  static final String _password = "your_password";
  static final String _db = "voting_db";

  static Future<MySqlConnection> connect() async {
    try {
      final conn = await MySqlConnection.connect(ConnectionSettings(
        host: _host,
        port: _port,
        user: _user,
        password: _password,
        db: _db,
      ));
      print("✅ Connected to Google Cloud MySQL");
      return conn;
    } catch (e) {
      print("❌ MySQL Connection Failed: $e");
      throw e;
    }
  }
}
