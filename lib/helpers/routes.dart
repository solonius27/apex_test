import 'package:apex_test/screens/dashboard.dart';
import 'package:apex_test/screens/login.dart';
import 'package:apex_test/screens/new_password.dart';
import 'package:apex_test/screens/onboard.dart';
import 'package:apex_test/screens/otp.dart';
import 'package:apex_test/screens/recover_pass.dart';
import 'package:apex_test/screens/residence.dart';
import 'package:apex_test/screens/set_pin.dart';
import 'package:apex_test/screens/signup.dart';
import 'package:apex_test/screens/success.dart';

final route = {
  OnboardScreen.routeName: (ctx) => OnboardScreen(),
  LoginScreen.routeName: (ctx) => LoginScreen(),
  RecoverPass.routeName: (ctx) => RecoverPass(),
  OTPScreen.routeName: (ctx) => OTPScreen(),
  NewPass.routeName: (ctx) => NewPass(),
  SuccessScreen.routeName: (ctx) => SuccessScreen(),
  SignUp.routeName: (ctx) => SignUp(),
  Residence.routeName: (ctx) => Residence(),
  SetPin.routeName: (ctx) => SetPin(),
  Dashboard.routeName: (ctx) => Dashboard(),
};
