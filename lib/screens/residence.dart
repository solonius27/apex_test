import 'package:apex_test/helpers/const.dart';
import 'package:apex_test/providers/app_provider.dart';
import 'package:apex_test/screens/set_pin.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/custom_widgets.dart';

class Residence extends StatefulWidget {
  //const Residence({Key? key}) : super(key: key);
  static const routeName = '/residence';

  @override
  State<Residence> createState() => _ResidenceState();
}

class _ResidenceState extends State<Residence> {
  final countrycontroller = TextEditingController();
  bool isloading = false;

  var args;

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as Map;
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
                "Country of Residence",
                24,
                weight: FontWeight.w700,
                color: textcolorbold,
                topmargin: 40.0,
                bottommargin: 8.0,
              ),
              appText(
                "Please select all the countries that you’re a tax recident in",
                16,
                align: TextAlign.start,
                weight: FontWeight.w400,
                color: textcolornotbold,
                bottommargin: 32.0,
              ),
              GestureDetector(
                onTap: () {
                  showCountryPicker(
                    context: context,
                    showPhoneCode:
                        true, // optional. Shows phone code before the country name.
                    onSelect: (Country country) {
                      countrycontroller.text = country.name;
                      print('Select country: ${country.displayName}');
                    },
                  );
                },
                child: AppTextFieldWidget(
                  controller: countrycontroller,
                  enabled: false,
                  innerlabeltext: "Select Country",
                  trailingButton: Icon(Icons.arrow_drop_down),
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: doSignup,
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
                          "Continue",
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
        ),
      ),
    );
  }

  Future<void> doSignup() async {
    if (countrycontroller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Kindly select your resident country"),
        duration: Duration(milliseconds: 300),
      ));
      return;
    }

    setState(() {
      isloading = true;
    });

    try {
      await Provider.of<AppProvider>(context, listen: false).doSignUp(
        args["name"],
        args["username"],
        args["email"],
        "NG",
        args["password"],
      );
      Navigator.of(context).pushNamed(SetPin.routeName);
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
