import 'package:apex_test/helpers/const.dart';
import 'package:apex_test/helpers/custom_widgets.dart';
import 'package:apex_test/screens/login.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);
  static const routeName = '/succe';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      body: Container(
        margin: pageMargin,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              args == 0
                  ? "assets/images/illustration.png"
                  : "assets/images/illustration1.png",
              height: calculateSize(198),
              width: calculateSize(258),
            ),
            appText(
              args == 0 ? "New Password Created" : "Congratulations",
              24,
              weight: FontWeight.w700,
              color: textcolorbold,
              topmargin: 50.0,
              bottommargin: 12.0,
            ),
            appText(
              args == 0
                  ? "Hey Anabel, your password has been successfuly updated."
                  : "Hey Anabel, your account has been successfully created 👋 ",
              14,
              weight: FontWeight.w400,
              color: textcolornotbold,
              bottommargin: 100.0,
            ),
            GestureDetector(
              onTap: () =>
                  Navigator.of(context).pushNamed(LoginScreen.routeName),
              child: Container(
                alignment: Alignment.center,
                child: appText(
                  "Proceed to home",
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
          ],
        ),
      ),
    );
  }
}
