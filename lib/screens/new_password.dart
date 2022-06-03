import 'package:apex_test/helpers/const.dart';
import 'package:apex_test/screens/success.dart';
import 'package:flutter/material.dart';

import '../helpers/custom_widgets.dart';

class NewPass extends StatelessWidget {
  const NewPass({Key? key}) : super(key: key);
  static const routeName = '/newpass';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Container(
        margin: pageMargin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: calculateSize(50),
            ),
            backButton(context),
            appText(
              "Create New Password",
              24,
              weight: FontWeight.w700,
              color: textcolorbold,
              topmargin: 40.0,
              bottommargin: 8.0,
            ),
            appText(
              "Please, enter a new password below different from the previous password",
              16,
              align: TextAlign.start,
              weight: FontWeight.w400,
              color: textcolornotbold,
              bottommargin: 32.0,
            ),
            AppTextFieldWidget(
              innerlabeltext: "Password",
              obscureText: true,
              trailingButton: Icon(Icons.visibility_off),
            ),
            AppTextFieldWidget(
              innerlabeltext: "Confirm Password",
              obscureText: true,
              trailingButton: Icon(Icons.visibility_off),
            ),
            Spacer(),
            GestureDetector(
              onTap: () => Navigator.of(context)
                  .pushNamed(SuccessScreen.routeName, arguments: 0),
              child: Container(
                alignment: Alignment.center,
                child: appText(
                  "Create new password",
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
      )),
    );
  }
}
