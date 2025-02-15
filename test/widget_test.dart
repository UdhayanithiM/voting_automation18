import 'package:flutter_test/flutter_test.dart';
import 'package:voting_automation18/main.dart';
import 'test_helper.dart'; // Import the test helper file

void main() {
  setUpAll(() async {
    await setupFirebaseAuthMocks(); // ✅ Mock Firebase before tests
  });

  testWidgets('App launches without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Voting Automation'), findsOneWidget);
  });
}
