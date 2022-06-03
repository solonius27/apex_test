import 'package:apex_test/helpers/const.dart';
import 'package:apex_test/helpers/custom_widgets.dart';
import 'package:apex_test/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
  static const routeName = '/dashboard';

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var message;
  bool isLoading = true;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 0)).then((value) async {
      message =
          await Provider.of<AppProvider>(context, listen: false).getDashboard();
      isLoading = false;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              margin: pageMargin,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/images/676-done.json',
                    repeat: true,
                    reverse: false,
                    animate: true,
                    width: calculateSize(100),
                    height: calculateSize(100),
                  ),
                  appText(message, 17,
                      weight: FontWeight.w700, color: color1, topmargin: 20.0)
                ],
              ),
            ),
    );
  }
}
