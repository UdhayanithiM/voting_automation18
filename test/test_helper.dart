import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// ✅ Proper @GenerateMocks annotation without import issues
@GenerateMocks([], customMocks: [MockSpec<FirebaseCorePlatform>()])
import 'test_helper.mocks.dart'; // ✅ Ensure this matches the filename

Future<void> setupFirebaseMocks() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  // ✅ Create mock instance
  final mockFirebaseCore = MockFirebaseCorePlatform();

  // ✅ Mock initializeApp() correctly
  when(mockFirebaseCore.initializeApp()).thenAnswer((_) async => Future.value());

  // ✅ Override FirebaseCore platform
  FirebaseCorePlatform.instance = mockFirebaseCore;
}
