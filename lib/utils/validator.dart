import 'package:flutter/material.dart';

typedef Validatorable = String Function(String val);

class Validator {
  static String isRequired(String val) {
    if (val == null || val.isEmpty) return "Veiller remplir se champ";
    return null;
  }

  static Validatorable equalTo(TextEditingController other) {
    return (String value) {
      print(
          "value $value other ${other.text} comparison ${value.compareTo(other.text)}");
      if (value.compareTo(other.text) != 0)
        return "Les mots de passe sont différents";
      return null;
    };
  }

  static String email(String val) {
    if (val == null || val.isEmpty) return null;
    return RegExp(r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$")
            .hasMatch(val)
        ? null
        : "Le format de l'email est incorrect";
  }
}
