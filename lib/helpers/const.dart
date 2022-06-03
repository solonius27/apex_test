import 'package:apex_test/helpers/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

const color1 = Color(0xfff5aa62);
const textcolorbold = Color(0xff111827);
const textcolornotbold = Color(0xff6B7280);

final validCharactersphone =
    RegExp(r'^[+0][a-zA-Z0-9]+$'); //^[a-zA-Z]+(?:\s[a-zA-Z]+)?$

double calculateSize(double size) {
  var val = size / 8.53;
  return val * SizeConfig.heightMultiplier!;
}

final pageMargin = EdgeInsets.only(
  left: calculateSize(28),
  right: calculateSize(28),
  top: calculateSize(20),
);

final onesideborder = PinTheme(
  width: 56,
  height: 56,
  textStyle: TextStyle(
      fontSize: calculateSize(24),
      color: textcolorbold,
      fontWeight: FontWeight.w700),
  decoration: BoxDecoration(
    color: Colors.white,
    border: Border(
      bottom: BorderSide(color: color1),
    ),
    //borderRadius: BorderRadius.circular(calculateSize(12)),
  ),
);

final defaultPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: TextStyle(
      fontSize: calculateSize(24),
      color: textcolorbold,
      fontWeight: FontWeight.w700),
  decoration: BoxDecoration(
    color: Color(0xffF9FAFB),
    border: Border.all(color: Color(0xffF9FAFB)),
    borderRadius: BorderRadius.circular(calculateSize(12)),
  ),
);

final focusedtheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: TextStyle(
      fontSize: calculateSize(24),
      color: textcolorbold,
      fontWeight: FontWeight.w700),
  decoration: BoxDecoration(
    color: Color(0xffF9FAFB),
    border: Border.all(color: color1),
    borderRadius: BorderRadius.circular(calculateSize(12)),
  ),
);
