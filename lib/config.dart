import 'package:flutter/material.dart';

class Config {
  static final colors = _Color();
  static final assets = _Asset();
}

class _Color {
  final loginButtonColor = Color(0xFF4786FF);
  final facebookColor = Color(0xFF263C68);
  final facebookAccentColor = Color(0xFF3B5998);
  final twitterColor = Color(0xFF0695CB);
  final twitterAccentColor = Color(0xFF00ACED);
  final googleColor = Color(0xFFC53126);
  final googleAccentColor = Color(0xFFF44336);
  final blueTextColor = Color(0xFF5D8FFC);
  final primaryTextColor = Color(0xFF929699);
  final primaryIconColor = Color(0xFF929699);
  final borderTextFieldColor = Color(0xFFE0E3E5);
  final iconTextFieldColor = Color(0xFFD1D1D1);
  final dividerColor = Color(0xFFD8D8D8);
  final appbarColor = Color(0xFFF1E7E1);
}

class _Asset {
  final bg = "assets/images/bg.png";
}
