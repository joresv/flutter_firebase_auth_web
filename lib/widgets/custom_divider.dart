import 'package:flutter/material.dart';
import 'package:login_web/config.dart';

class CustomDivider extends StatelessWidget {
  final String title;

  CustomDivider({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 50),
      child: Row(
        children: [
          Expanded(
              child: Divider(
            color: Config.colors.dividerColor,
          )),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              title,
              style: TextStyle(
                  color: Config.colors.primaryTextColor, fontSize: 14),
            ),
          ),
          Expanded(
              child: Divider(
            color: Config.colors.dividerColor,
          )),
        ],
      ),
    );
  }
}
