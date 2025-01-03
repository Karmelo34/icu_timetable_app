import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class AuthService {
  static const String _tokenKey = 'auth_token';
  static const String _userDataKey = 'user_data';

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey) != null;
  }

  static Future<Map<String, dynamic>?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userDataString = prefs.getString(_userDataKey);
    if (userDataString != null) {
      return json.decode(userDataString);
    }
    return null;
  }

  static Future<bool> login(String email, String password) async {
    try {
      // Hash password for security
      final bytes = utf8.encode(password);
      sha256.convert(bytes).toString();

      // TODO: Replace with actual API call
      bool isAuthenticated = false;
      Map<String, dynamic>? userData;

      // Mock authentication
      if (email == 'lecturer@icu.com' && password == 'lecturer123') {
        isAuthenticated = true;
        userData = {
          'id': 'lec123',
          'email': email,
          'role': 'lecturer',
          'name': 'John Doe',
          'department': 'Computer Science'
        };
      }

      if (isAuthenticated && userData != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(
            _tokenKey, 'mock_token_${DateTime.now().millisecondsSinceEpoch}');
        await prefs.setString(_userDataKey, json.encode(userData));
        return true;
      }
      return false;
    } catch (e) {
      debugPrint('Login error: $e');
      return false;
    }
  }

  static Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    if (context.mounted) {
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    }
  }

  static Future<bool> register(
      String email, String password, String role) async {
    try {
      // TODO: Replace with actual API call
      // Mock registration - always succeeds
      return true;
    } catch (e) {
      debugPrint('Registration error: $e');
      return false;
    }
  }
}
