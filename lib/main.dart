import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});  // ✅ Added super.key

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Voting Automation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,  // ✅ Optional: Enable Material 3 for modern UI
      ),
      home: const LoginScreen(),  // ✅ Use const for performance
    );
  }
}
