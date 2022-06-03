import 'package:apex_test/helpers/routes.dart';
import 'package:apex_test/providers/app_provider.dart';
import 'package:apex_test/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'helpers/sizeConfig.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final Future<SharedPreferences> prefs =
      SharedPreferences.getInstance();
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppProvider(),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              SizeConfig().init(constraints, orientation);
              return MaterialApp(
                title: 'Apex Test',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                  backgroundColor: Colors.white,
                ),
                home: Splash(),
                routes: route,
              );
            },
          );
        },
      ),
    );
  }
}
