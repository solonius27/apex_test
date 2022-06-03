import 'package:apex_test/helpers/const.dart';
import 'package:apex_test/screens/otp.dart';
import 'package:flutter/material.dart';

import '../helpers/custom_widgets.dart';

class RecoverPass extends StatelessWidget {
  const RecoverPass({Key? key}) : super(key: key);
  static const routeName = '/recoverpass';

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
                "Passsword Recovery",
                24,
                weight: FontWeight.w700,
                color: textcolorbold,
                topmargin: 40.0,
                bottommargin: 8.0,
              ),
              appText(
                "Enter your registered email below to receive password instructions",
                16,
                align: TextAlign.start,
                weight: FontWeight.w400,
                color: textcolornotbold,
                bottommargin: 32.0,
              ),
              AppTextFieldWidget(innerlabeltext: "Email"),
              SizedBox(
                height: calculateSize(140),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context)
                    .pushNamed(OTPScreen.routeName, arguments: 0),
                child: Container(
                  alignment: Alignment.center,
                  child: appText(
                    "Send verification code",
                    18,
                    weight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.only(bottom: calculateSize(32)),
                  height: calculateSize(56),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: textcolorbold.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(calculateSize(16)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
