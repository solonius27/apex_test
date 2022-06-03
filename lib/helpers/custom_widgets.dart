import 'package:apex_test/helpers/const.dart';
import 'package:flutter/material.dart';

Widget appText(String tx, double size,
    {FontWeight weight = FontWeight.w400,
    topmargin = 0.0,
    bottommargin = 0.0,
    leftmargin = 0.0,
    rightmargin = 0.0,
    TextAlign align = TextAlign.center,
    Color color = Colors.black,
    double? space,
    bool softwrap = true,
    TextOverflow? overflow,
    FontStyle fontStyle = FontStyle.normal}) {
  return Container(
    margin: EdgeInsets.only(
        top: calculateSize(topmargin),
        bottom: calculateSize(bottommargin),
        left: calculateSize(leftmargin),
        right: calculateSize(rightmargin)),
    child: Text(
      tx == null ? "" : tx,
      softWrap: softwrap,
      overflow: overflow,
      textAlign: align,
      style: TextStyle(
        fontSize: calculateSize(size),
        fontWeight: weight,
        fontStyle: fontStyle,
        color: color,
        letterSpacing: space,
      ),
    ),
  );
}

Widget backButton(BuildContext context, {cangoback = true}) {
  return GestureDetector(
    onTap: cangoback ? () => Navigator.of(context).pop() : null,
    child: Container(
      alignment: Alignment.center,
      height: calculateSize(40),
      width: calculateSize(40),
      child: Icon(
        Icons.arrow_back_ios,
        color: Color(0xff111827),
        size: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          calculateSize(12),
        ),
        border: Border.all(
          color: Color(0xffE5E7EB),
        ),
      ),
    ),
  );
}

class AppTextFieldWidget extends StatelessWidget {
  final bool obscureText;
  final obscureTextcharacter;
  final textInputType;
  final labelText;
  final Function(String?)? fxsavedValue;
  final String? Function(String?)? fx;
  final String? initval;
  final enabled;
  final trailingButton;
  final prefixText;
  final controller;
  final focusNode;
  final maxLines;
  final innerlabeltext;
  final preIcons;

  AppTextFieldWidget({
    this.labelText = "",
    this.enabled = true,
    this.obscureText = false,
    this.initval,
    this.textInputType = TextInputType.text,
    this.fxsavedValue,
    this.fx,
    this.maxLines = 1,
    this.obscureTextcharacter = "*",
    this.trailingButton,
    this.prefixText,
    this.controller,
    this.focusNode,
    this.innerlabeltext,
    this.preIcons,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appText(labelText, 16, weight: FontWeight.w700, color: textcolorbold),
        TextFormField(
            enabled: enabled,
            initialValue: initval,
            controller: controller,
            focusNode: focusNode,
            obscureText: obscureText,
            obscuringCharacter: "*",
            maxLines: maxLines,
            keyboardType: textInputType,
            textInputAction: TextInputAction.next,
            style: TextStyle(
                //fontWeight: FontWeight.bold,
                fontSize: calculateSize(16),
                color: textcolorbold),
            decoration: InputDecoration(
              fillColor: Color(0xffF9FAFB),
              filled: true,
              suffixIcon: trailingButton,
              prefixIcon: preIcons,
              prefixText: prefixText,
              errorMaxLines: 3,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: calculateSize(16), vertical: calculateSize(24)),
              //isDense: true,
              hintText: innerlabeltext,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffF9FAFB)),
                  borderRadius: BorderRadius.circular(calculateSize(16))),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffF9FAFB)),
                  borderRadius: BorderRadius.circular(calculateSize(16))),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: color1),
                  borderRadius: BorderRadius.circular(calculateSize(16))),
            ),
            onSaved: fxsavedValue,
            validator: fx
            // (val) {
            //   if (val.trim().isEmpty) {
            //     return "Please enter password";
            //   }
            //   return null;
            // },
            )
      ],
    );
  }
}

class HttpException implements Exception {
  final String message;

  HttpException(this.message); // Pass your message in constructor.

  @override
  String toString() {
    return message;
  }
}

// void showAppdialog(BuildContext context, chilz, fx,
//     {bool good = true, bool calcelvisible = true}) {
//   showGeneralDialog(
//     context: context,
//     pageBuilder: (ctx, a1, a2) {
//       return Container();
//     },
//     transitionBuilder: (ctx, a1, a2, child) {
//       var curve = Curves.easeInOut.transform(a1.value);
//       return Transform.scale(
//         scale: curve,
//         child: _dialog(ctx, chilz, fx, good, calcelvisible),
//       );
//     },
//     transitionDuration: const Duration(milliseconds: 300),
//   );
// }

// Widget _dialog(BuildContext context, Widget child, fx, good, cancelvisible) {
//   return AlertDialog(
//     title: Image.asset(
//       good ? "assets/images/good.png" : 'assets/images/fail.png',
//       width: calculateSize(35),
//       height: calculateSize(27),
//     ),
//     content: child,
//     //shape: BeveledRectangleBorder(),
//     actions: [
//       Visibility(
//         visible: cancelvisible,
//         child: TextButton(
//           child: Text("Cancel"),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ),
//       TextButton(
//         child: Text("OK"),
//         onPressed: fx,
//       ),
//       //Text("Ok"),
//     ],
//   );
// }
