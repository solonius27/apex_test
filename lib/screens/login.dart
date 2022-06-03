import 'package:apex_test/helpers/const.dart';
import 'package:apex_test/helpers/custom_widgets.dart';
import 'package:apex_test/main.dart';
import 'package:apex_test/providers/app_provider.dart';
import 'package:apex_test/screens/dashboard.dart';
import 'package:apex_test/screens/recover_pass.dart';
import 'package:apex_test/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool dontshowPassword = true;
  bool isloading = false;

  String? formEmail;
  String? formPass;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 0)).then((value) async {
      final SharedPreferences prefs = await MyApp.prefs;
      if (prefs.containsKey("hasloggedin")) {
        showNumberDialogs();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: pageMargin,
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: calculateSize(50),
                ),
                backButton(context, cangoback: false),
                appText(
                  "Hi There! 👋",
                  24,
                  weight: FontWeight.w700,
                  color: textcolorbold,
                  topmargin: 40.0,
                  bottommargin: 8.0,
                ),
                appText(
                  "Welcome back, Sign in to your account",
                  16,
                  weight: FontWeight.w400,
                  color: textcolornotbold,
                  bottommargin: 32.0,
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
                GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushNamed(RecoverPass.routeName),
                  child: appText(
                    "Forgot Password?",
                    16,
                    weight: FontWeight.w700,
                    color: color1,
                    topmargin: 24.0,
                    bottommargin: 24.0,
                  ),
                ),
                GestureDetector(
                  onTap: doSignin,
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
                            "Sign In",
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
                Spacer(),
                GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushNamed(SignUp.routeName),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      appText("Don’t have an account?", 16,
                          weight: FontWeight.w700, color: textcolornotbold),
                      GestureDetector(
                        // onTap: () =>
                        //     Navigator.of(context).pushNamed(SignUp.routeName),
                        child: appText(" Sign Up", 16,
                            weight: FontWeight.w700, color: color1),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: calculateSize(20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> doSignin() async {
    FocusScope.of(context).unfocus();
    var isvalid = formKey.currentState!.validate();
    if (!isvalid) {
      return;
    }
    formKey.currentState!.save();

    setState(() {
      isloading = true;
    });

    try {
      await Provider.of<AppProvider>(context, listen: false)
          .doSignIn(formEmail, formPass);
      final SharedPreferences prefs = await MyApp.prefs;
      prefs.setBool("hasloggedin", true);
      Navigator.of(context).pushNamed(Dashboard.routeName);
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

  void showNumberDialogs() {
    showGeneralDialog(
      context: context,
      pageBuilder: (ctx, a1, a2) {
        return Container();
      },
      transitionBuilder: (ctx, a1, a2, child) {
        var curve = Curves.easeInOut.transform(a1.value);
        return Transform.scale(
          scale: curve,
          child: _dialog(ctx),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  Widget _dialog(BuildContext context) {
    return AlertDialog(
      //title: const Text("Help center"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 30,
          ),
          appText(
            "Enter PIN to Login",
            16,
            weight: FontWeight.w700,
            color: textcolorbold,
            bottommargin: 20.0,
          ),
          Pinput(
            defaultPinTheme: onesideborder,
            showCursor: true,
            obscureText: true,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            length: 5,
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            //Navigator.of(context).pop();
          },
          child: const Text("Login"),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Cancel"),
        )
      ],
    );
  }
}
