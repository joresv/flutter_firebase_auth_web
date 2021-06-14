import 'package:flutter/material.dart';
import 'package:login_web/config.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final Color backgroundColor;

  const CustomButton(
      {Key key, this.title, this.onPressed, this.backgroundColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        title,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            fontFamily: "robotom"),
      ),
      onPressed: onPressed,
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
          padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(vertical: 22, horizontal: 27)),
          backgroundColor: MaterialStateProperty.all(backgroundColor)),
    );
  }
}

class SocialButton extends StatefulWidget {
  final IconData icon;
  final String title;
  final Color color, accentColor;
  final Function onPressend;

  const SocialButton(
      {Key key,
      this.icon,
      this.title,
      this.color,
      this.accentColor,
      this.onPressend})
      : super(key: key);

  @override
  _SocialButtonState createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressend,
      onHover: (v) {
        isHover = v;
        setState(() {});
      },
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 60,
        // padding: EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          color: widget.accentColor ?? Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),

        child: Container(
          decoration: BoxDecoration(
              color:
                  isHover ? Colors.white.withOpacity(.5) : Colors.transparent),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 60,
                width: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: widget.color ?? Colors.transparent,
                  borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(10)),
                ),
                child: Container(
                    decoration: BoxDecoration(
                      color: isHover
                          ? Colors.white.withOpacity(.5)
                          : Colors.transparent,
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(10)),
                    ),
                    height: 60,
                    width: 60,
                    child: Icon(widget.icon, color: Colors.white)),
              ),
              Expanded(
                  child: Container(
                child: Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    fontFamily: "robotom",
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
