import 'package:flutter/material.dart';
import 'alarm_screen_.dart';

class LoginViewModel extends ChangeNotifier {
  String email = '';
  String password = '';
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

  bool validate() {
    if (!email.contains('@')) {
      errorMessage = 'Введите корректный email';
      notifyListeners();
      return false;
    }
    if (password.length < 6) {
      errorMessage = 'Пароль должен быть минимум 6 символов';
      notifyListeners();
      return false;
    }
    errorMessage = null;
    notifyListeners();
    return true;
  }

  Future<void> login(BuildContext context) async {
    if (!validate()) return;

    isLoading = true;
    notifyListeners();

    try {
      // Здесь можешь сделать реальный запрос на сервер
      await Future.delayed(const Duration(seconds: 2));

      // Пример: успешный вход → перейти на главный экран
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const AlarmScreen()),
      );
    } catch (e) {
      errorMessage = 'Ошибка входа: ${e.toString()}';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
