import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_web/config.dart';
import 'package:login_web/login.dart';
import 'package:login_web/services/auth.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // print(width);
    return Scaffold(
      appBar: AppBar(
        elevation: .5,
        backgroundColor: Config.colors.facebookAccentColor,
        actions: [
          TextButton.icon(
              onPressed: () async {
                await AuthServices().logOut();
              },
              icon: Icon(
                FeatherIcons.power,
                color: Colors.white,
              ),
              label: Text(
                "Logout",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    fontFamily: "robotom"),
              )),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        // padding: EdgeInsets.symmetric(horizontal: 80, vertical: 40),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
      ),
    );
  }
}
