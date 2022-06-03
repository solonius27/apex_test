import 'package:apex_test/helpers/const.dart';
import 'package:apex_test/helpers/custom_widgets.dart';
import 'package:apex_test/screens/onboard.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final transitionDuration = Duration(seconds: 1);
  var expanded = false;
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1)).then((value) {
      setState(() {
        expanded = true;
      });
    }).then((value) {
      Future.delayed(Duration(seconds: 2)).then((value) =>
          Navigator.of(context).pushReplacementNamed(OnboardScreen.routeName));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/Logo.png",
            width: calculateSize(72),
            height: calculateSize(72),
          ),
          SizedBox(
            height: calculateSize(16),
          ),
          AnimatedCrossFade(
            firstCurve: Curves.fastOutSlowIn,
            crossFadeState: !expanded
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: transitionDuration,
            firstChild: Container(),
            secondChild: splashRemainder(),
            alignment: Alignment.centerLeft,
            sizeCurve: Curves.easeInOut,
          ),
        ],
      ),
    );
  }

  Widget splashRemainder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        appText(
          "Smart",
          32,
          weight: FontWeight.w700,
          color: Color(0xff111827),
        ),
        appText(
          "pay",
          32,
          weight: FontWeight.w700,
          color: Color(0xfff5aa62),
        )
      ],
    );
  }
}
