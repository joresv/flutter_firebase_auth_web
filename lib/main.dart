import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_web/home.dart';
import 'package:login_web/services/auth.dart';
import 'package:login_web/wrapper.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login page',
      theme: ThemeData(fontFamily: "robotor"),
      home: StreamProvider<User>.value(
        value: AuthServices().statusUser,
        initialData: null,
        child: Wrapper(),
      ),
    );
  }
}
