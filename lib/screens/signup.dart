import 'package:apex_test/providers/app_provider.dart';
import 'package:apex_test/screens/login.dart';
import 'package:apex_test/screens/otp.dart';
import 'package:apex_test/screens/residence.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/const.dart';
import '../helpers/custom_widgets.dart';

class SignUp extends StatefulWidget {
  static const routeName = '/signup';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? formName;
  String? formEmail;
  String? formUsername;
  String? formPass;

  final formKey = GlobalKey<FormState>();

  bool dontshowPassword = true;
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: pageMargin,
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: calculateSize(50),
                  ),
                  backButton(context),
                  appText(
                    "Create a Smartpay\naccount",
                    24,
                    weight: FontWeight.w700,
                    color: textcolorbold,
                    topmargin: 40.0,
                    align: TextAlign.start,
                    bottommargin: 32.0,
                  ),
                  AppTextFieldWidget(
                    innerlabeltext: "Full name",
                    fxsavedValue: (value) {
                      formName = value;
                    },
                    fx: (val) {
                      if (val!.isEmpty) {
                        return "Kindly input name";
                      }
                      return null;
                    },
                  ),
                  AppTextFieldWidget(
                    innerlabeltext: "Email",
                    fxsavedValue: (value) {
                      formEmail = value;
                    },
                    fx: (val) {
                      if (val!.isEmpty) {
                        return "Kindly input email";
                      }
                      return null;
                    },
                  ),
                  AppTextFieldWidget(
                    innerlabeltext: "Username",
                    fxsavedValue: (value) {
                      formUsername = value;
                    },
                    fx: (val) {
                      if (val!.isEmpty) {
                        return "Kindly input username";
                      }
                      return null;
                    },
                  ),
                  AppTextFieldWidget(
                    innerlabeltext: "Password",
                    obscureText: dontshowPassword,
                    trailingButton: IconButton(
                      icon: dontshowPassword
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                      onPressed: () {
                        setState(() {
                          dontshowPassword = !dontshowPassword;
                        });
                      },
                    ),
                    fxsavedValue: (value) {
                      formPass = value;
                    },
                    fx: (val) {
                      if (val!.isEmpty)
                        return "Password cannot be empty";
                      else if (val.length < 6)
                        return "Password must be at least 6 characters long.";
                      else if (!val.contains(RegExp(r'[a-z]')))
                        return "Password must contain at least one lowercase letter";
                      else if (!val.contains(RegExp(r'[A-Z]')))
                        return "Password must contain at least one uppercase letter";
                      else if (!val.contains(RegExp(r'[0-9]')))
                        return "Password must contain at least one number";
                      else
                        return null;
                    },
                  ),
                  SizedBox(
                    height: calculateSize(35),
                  ),
                  GestureDetector(
                    onTap: doSignUp,
                    child: Container(
                      alignment: Alignment.center,
                      child: isloading
                          ? Container(
                              height: calculateSize(20),
                              width: calculateSize(20),
                              child: CircularProgressIndicator(
                                color: Colors.red,
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                              ),
                            )
                          : appText(
                              "Sign Up",
                              18,
                              weight: FontWeight.w700,
                              color: Colors.white,
                            ),
                      margin: EdgeInsets.only(bottom: calculateSize(32)),
                      height: calculateSize(56),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: textcolorbold,
                        borderRadius: BorderRadius.circular(calculateSize(16)),
                      ),
                    ),
                  ),
                  Image.asset(
                    "assets/images/or.png",
                    height: calculateSize(21),
                    width: double.infinity,
                  ),
                  SizedBox(
                    height: calculateSize(35),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: calculateSize(56),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xffE5E7EB),
                            ),
                            borderRadius: BorderRadius.circular(
                              calculateSize(16),
                            ),
                          ),
                          child: Image.asset(
                            "assets/images/search 1.png",
                            width: calculateSize(24),
                            height: calculateSize(24),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: calculateSize(20),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: calculateSize(56),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xffE5E7EB),
                            ),
                            borderRadius: BorderRadius.circular(
                              calculateSize(16),
                            ),
                          ),
                          child: Image.asset(
                            "assets/images/apple.png",
                            width: calculateSize(24),
                            height: calculateSize(24),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: calculateSize(20),
                  ),
                  GestureDetector(
                    onTap: () =>
                        Navigator.of(context).pushNamed(LoginScreen.routeName),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        appText("Don’t have an account?", 16,
                            weight: FontWeight.w700, color: textcolornotbold),
                        GestureDetector(
                          // onTap: () =>
                          //     Navigator.of(context).pushNamed(SignUp.routeName),
                          child: appText(" Sign In", 16,
                              weight: FontWeight.w700, color: color1),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> doSignUp() async {
    FocusScope.of(context).unfocus();
    var isvalid = formKey.currentState!.validate();
    if (!isvalid) {
      return;
    }
    formKey.currentState!.save();
    var token;

    setState(() {
      isloading = true;
    });

    try {
      token = await Provider.of<AppProvider>(context, listen: false)
          .veryemail(formEmail);
      var map = {
        "name": formName,
        "email": formEmail,
        'username': formUsername,
        "password": formPass,
        "token": token,
        "value": 1,
      };

      Navigator.of(context).pushNamed(OTPScreen.routeName, arguments: map);
    } on Exception catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
        duration: Duration(seconds: 3),
      ));
    }

    setState(() {
      isloading = false;
    });
  }
}
