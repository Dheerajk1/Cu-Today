import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart'; // Corrected import path

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  User? _user;

  User? get user => _user;

  Future<void> login(String email, String password) async {
    _user = await _authService.signInWithEmail(email, password);
    notifyListeners();
  }

  Future<void> logout() async {
    await _authService.signOut();
    _user = null;
    notifyListeners();
  }
}
