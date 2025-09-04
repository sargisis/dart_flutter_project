import 'package:flutter/material.dart';

class RegisterViewModel extends ChangeNotifier {
  String email = '';
  String password = '';
  String confirmPassword = '';
  bool isLoading = false;
  String? errorMessage;

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }

  void setConfirmPassword(String value) {
    confirmPassword = value;
    notifyListeners();
  }

  Future<void> register(BuildContext context) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    if (password != confirmPassword) {
      errorMessage = "Passwords do not match";
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const SuccessPage()),
      );
    }

    isLoading = false;
    notifyListeners();
  }
}

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Welcome")),
      body: const Center(child: Text("You are registered!")),
    );
  }
}
