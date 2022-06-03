import 'package:apex_test/helpers/const.dart';
import 'package:apex_test/screens/success.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../helpers/custom_widgets.dart';

class SetPin extends StatelessWidget {
  const SetPin({Key? key}) : super(key: key);
  static const routeName = '/setpin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              "Set your PIN code",
              24,
              weight: FontWeight.w700,
              color: textcolorbold,
              topmargin: 40.0,
              bottommargin: 8.0,
            ),
            appText(
              "We use state-of-the-art security measures to protect your information at all times",
              16,
              align: TextAlign.start,
              weight: FontWeight.w400,
              color: textcolornotbold,
              bottommargin: 32.0,
            ),
            Pinput(
              defaultPinTheme: onesideborder,
              showCursor: true,
              obscureText: true,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              length: 5,
            ),
            SizedBox(
              height: calculateSize(100),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context)
                  .pushReplacementNamed(SuccessScreen.routeName, arguments: 1),
              child: Container(
                alignment: Alignment.center,
                child: appText(
                  "Create Pin",
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
