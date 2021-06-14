import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

message(String msg,
    {ToastGravity position = ToastGravity.TOP,
    Color backgroundColor = Colors.red}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: position,
      timeInSecForIosWeb: 3,
      backgroundColor: backgroundColor,
      textColor: Colors.white,
      fontSize: 16.0);
}
