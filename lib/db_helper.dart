import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  static late Db db;
  static late DbCollection collection;
  static const String MONGO_URL = "mongodb://10.0.2.2:27017/votingApp"; // Change to your MongoDB URI

  static Future<void> connect() async {
    try {
      db = await Db.create(MONGO_URL);
      await db.open();
      collection = db.collection("voters");
      print("✅ MongoDB Connected Successfully");
    } catch (e) {
      print("❌ MongoDB Connection Error: $e");
    }
  }

  static Future<void> insertVoter(Map<String, dynamic> voterData) async {
    await collection.insertOne(voterData);
  }

  static Future<List<Map<String, dynamic>>> fetchVoters() async {
    final voters = await collection.find().toList();
    return voters;
  }
}
