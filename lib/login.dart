import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_web/config.dart';
import 'package:login_web/services/auth.dart';
import 'package:login_web/utils/validator.dart';
import 'package:login_web/widgets/button.dart';
import 'package:login_web/widgets/custom_check_box.dart';
import 'package:login_web/widgets/custom_divider.dart';
import 'package:login_web/widgets/textfield.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool value = false;
  remember() {
    value = !value;
    setState(() {});
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final key = GlobalKey<FormState>();
  bool register = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 40),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.1),
                blurRadius: 50,
                offset: Offset(10, 10))
          ]),
          child: Row(
            children: [
              Expanded(
                  child: Container(
                padding: EdgeInsets.only(left: 50, right: 50),
                child: SingleChildScrollView(
                  child: Form(
                    key: key,
                    child: Column(
                      children: [
                        if (register)
                          SizedBox(
                            height: 20,
                          ),
                        SizedBox(
                          height: 20,
                        ),
                        LoginTextField(
                          prefix: FontAwesomeIcons.solidUserCircle,
                          hint: "Username or email",
                          type: TextInputType.emailAddress,
                          validators: [Validator.email],
                          controller: emailController,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        LoginTextField(
                            // prefix: FeatherIcons.key,
                            prefix: Icons.vpn_key_sharp,
                            hint: "Password",
                            controller: passwordController,
                            validators: [Validator.isRequired],
                            password: true),
                        if (register) ...[
                          SizedBox(
                            height: 20,
                          ),
                          LoginTextField(
                              // prefix: FeatherIcons.key,
                              prefix: Icons.vpn_key_sharp,
                              hint: "Confirm password",
                              controller: confirmPasswordController,
                              validators: [Validator.isRequired],
                              password: true),
                        ],
                        SizedBox(
                          height: 26,
                        ),
                        Row(
                          mainAxisAlignment: register
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (!register)
                              CustomChackBox(
                                value: value,
                                onChanged: remember,
                                title: "Remember me",
                              ),
                            CustomButton(
                              title: register ? "REGISTER" : "LOGIN",
                              backgroundColor: Config.colors.loginButtonColor,
                              onPressed: () async {
                                if (key.currentState.validate()) {
                                  if (register) {
                                    await AuthServices()
                                        .signUpWithEmailAndPassword(
                                            email: emailController.text,
                                            password: passwordController.text);
                                  } else {
                                    print("login");
                                    await AuthServices()
                                        .signInWithEmailAndPassword(
                                            email: emailController.text,
                                            password: passwordController.text);
                                  }
                                }
                              },
                            )
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                register = !register;
                                setState(() {});
                              },
                              child: Text(
                                !register ? "Register now" : "Login now",
                                style: TextStyle(
                                    color: Config.colors.blueTextColor,
                                    fontSize: 14),
                              ),
                            ),
                            if (!register)
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  "Forgot password?",
                                  style: TextStyle(
                                      color: Config.colors.primaryTextColor,
                                      fontSize: 14),
                                ),
                              )
                          ],
                        ),
                        CustomDivider(
                          title: "or",
                        ),
                        SocialButton(
                          color: Config.colors.facebookColor,
                          accentColor: Config.colors.facebookAccentColor,
                          icon: FontAwesomeIcons.facebookSquare,
                          title: "Login with Facebook".toUpperCase(),
                          onPressend: () async {
                            await AuthServices().signInFacebook();
                            print("object");
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SocialButton(
                          color: Config.colors.twitterColor,
                          accentColor: Config.colors.twitterAccentColor,
                          icon: FontAwesomeIcons.twitter,
                          title: "Login with Twitter".toUpperCase(),
                          onPressend: () {},
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SocialButton(
                          color: Config.colors.googleColor,
                          accentColor: Config.colors.googleAccentColor,
                          icon: FontAwesomeIcons.google,
                          title: "Login with google".toUpperCase(),
                          onPressend: () {
                            print("google");
                            AuthServices().signInWithGoogle();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )),
              Expanded(
                  child: Image.asset(
                Config.assets.bg,
                fit: BoxFit.fill,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
