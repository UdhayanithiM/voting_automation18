import 'package:flutter/material.dart';
import 'package:voting_automation18/services/api_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ApiService apiService = ApiService();

  Future<void> loginUser() async {
    bool isLoggedIn = await apiService.loginUser(emailController.text, passwordController.text);
    if (isLoggedIn) {
      print("✅ Login Successful");
    } else {
      print("❌ Invalid Credentials");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              key: const Key('emailField'),  // ✅ Add Key
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextField(
              key: const Key('passwordField'),  // ✅ Add Key
              controller: passwordController,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              key: const Key('loginButton'),  // ✅ Add Key
              onPressed: loginUser,
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
