import 'package:apex_test/helpers/const.dart';
import 'package:apex_test/providers/app_provider.dart';
import 'package:apex_test/screens/new_password.dart';
import 'package:apex_test/screens/residence.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/custom_widgets.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatefulWidget {
  //const OTPScreen({Key? key}) : super(key: key);
  static const routeName = '/otp';

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  var args;
  final controller = TextEditingController();
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as Map;
    controller.text = args["token"];
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                "Verify it’s you",
                24,
                weight: FontWeight.w700,
                color: textcolorbold,
                topmargin: 40.0,
                bottommargin: 8.0,
              ),
              appText(
                "We send a code to ( ${args["email"]} ). Enter it here to verify your identity",
                16,
                align: TextAlign.start,
                weight: FontWeight.w400,
                color: textcolornotbold,
                bottommargin: 32.0,
              ),
              Pinput(
                controller: controller,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedtheme,
                showCursor: true,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                length: 5,
              ),
              Center(
                child: appText(
                  "Resend Code",
                  16,
                  weight: FontWeight.w700,
                  color: color1,
                  topmargin: 32.0,
                  bottommargin: 67.0,
                ),
              ),
              GestureDetector(
                onTap: () async {
                  if (args["value"] == 0) {
                    Navigator.of(context).pushNamed(NewPass.routeName);
                  } else {
                    verifytoken();
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  child: isloading
                      ? Container(
                          height: calculateSize(20),
                          width: calculateSize(20),
                          child: CircularProgressIndicator(
                            color: Colors.red,
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          ),
                        )
                      : appText(
                          "Confirm",
                          18,
                          weight: FontWeight.w700,
                          color: Colors.white,
                        ),
                  margin: EdgeInsets.only(bottom: calculateSize(25)),
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
      ),
    );
  }

  Future<void> verifytoken() async {
    setState(() {
      isloading = true;
    });
    try {
      await Provider.of<AppProvider>(context, listen: false)
          .verifyreceivedtoken(args['email'], controller.text);
      Navigator.of(context).pushNamed(Residence.routeName, arguments: args);
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
