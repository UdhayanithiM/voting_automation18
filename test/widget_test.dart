import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:voting_automation18/screens/login_screen.dart'; // 🔹 Correct Import

void main() {
  testWidgets('Login screen UI test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));


    // ✅ Verify TextFields Exist
    expect(find.byKey(const Key('emailField')), findsOneWidget);
    expect(find.byKey(const Key('passwordField')), findsOneWidget);

    // ✅ Verify Login Button Exists
    expect(find.byKey(const Key('loginButton')), findsOneWidget);
  });
}
