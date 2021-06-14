import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_web/config.dart';

class CustomChackBox extends StatelessWidget {
  final bool value;
  final Function onChanged;
  final Color activeColor;
  final String title;

  const CustomChackBox(
      {Key key, this.value, this.onChanged, this.activeColor, this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(4),
      onTap: onChanged == null
          ? null
          : () {
              onChanged();
            },
      child: Container(
        padding: EdgeInsets.only(right: 5),
        child: Row(
          children: [
            Container(
              height: 25,
              width: 25,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: value
                      ? activeColor ?? Config.colors.loginButtonColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(4),
                  border:
                      Border.all(color: Config.colors.borderTextFieldColor)),
              child: value
                  ? Icon(
                      FeatherIcons.check,
                      color: Colors.white,
                      size: 15,
                    )
                  : Container(),
            ),
            SizedBox(
              width: 10,
            ),
            if (title != null)
              Text(
                title,
                style: TextStyle(
                    color: Config.colors.primaryTextColor, fontSize: 14),
              )
          ],
        ),
      ),
    );
  }
}
