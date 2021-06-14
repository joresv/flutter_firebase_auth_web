import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_web/config.dart';
import 'package:login_web/utils/validator.dart';

class LoginTextField extends StatefulWidget {
  final IconData prefix;
  final String hint;
  final List<Validatorable> validators;
  final bool password;
  final TextInputType type;
  final TextEditingController controller;
  LoginTextField(
      {Key key,
      this.prefix,
      this.hint,
      this.password,
      this.controller,
      this.type,
      this.validators})
      : super(key: key);

  @override
  _LoginTextFieldState createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  bool visible;
  bool isFocuse = false;
  FocusNode _focuse = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focuse.addListener(() {
      if (_focuse.hasFocus) {
        isFocuse = true;
      } else {
        isFocuse = false;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(visible);
    return TextFormField(
      focusNode: _focuse,
      keyboardType: widget.type ?? TextInputType.text,
      obscureText:
          visible ?? widget.password != null && widget.password != false
              ? true
              : false,
      controller: widget.controller,
      validator: (value) {
        if (widget.validators == null) return null;
        for (var validator in widget.validators) {
          if (validator(value) != null) {
            return validator(value);
          }
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: Container(
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                border: Border(
                    right: BorderSide(
                        color: isFocuse
                            ? Config.colors.twitterColor
                            : Config.colors.borderTextFieldColor))),
            width: 65,
            height: 60,
            child: Icon(widget.prefix)),
        hintText: widget.hint,
        focusColor: Config.colors.twitterAccentColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: Config.colors.borderTextFieldColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: Config.colors.twitterColor),
        ),
        suffixIcon: widget.password == null || widget.password == false
            ? Container(
                height: 25,
                width: 25,
                margin: EdgeInsets.only(right: 10),
              )
            : Container(
                margin: EdgeInsets.only(right: 10),
                child: IconButton(
                    icon: Icon(
                      visible == null || visible == true
                          ? FeatherIcons.eye
                          : FeatherIcons.eyeOff,
                      color: Config.colors.primaryIconColor,
                      size: 20,
                    ),
                    onPressed: () {
                      if (visible == null) visible = true;
                      visible = !visible;
                      setState(() {});
                    }),
              ),
        hintStyle: TextStyle(
            color: Config.colors.primaryTextColor,
            fontSize: 14,
            fontWeight: FontWeight.w400),
        errorStyle: TextStyle(fontSize: 10),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: Config.colors.borderTextFieldColor),
        ),
      ),
    );
  }
}
