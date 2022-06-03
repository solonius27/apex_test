import 'package:apex_test/screens/login.dart';
import 'package:flutter/material.dart';

import '../helpers/const.dart';
import '../helpers/custom_widgets.dart';
import 'package:card_swiper/card_swiper.dart';

class OnboardScreen extends StatelessWidget {
  //const OnboardScreen({Key? key}) : super(key: key);
  static const routeName = '/onboard';

  final vv = [
    GetStartedIndex(
      "assets/images/content.png",
      "Finance app the safest and most trusted",
      "Your finance work starts here. Our here to help you track and deal with speeding up your transactions.",
    ),
    GetStartedIndex(
      "assets/images/content1.png",
      "The fastest transaction process only here",
      "Get easy to pay all your bills with just a few steps. Paying your bills become fast and efficient.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        Swiper(
          onTap: (_) {
            Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
          },
          autoplay: true,
          autoplayDelay: 2500,
          itemCount: 2,
          itemBuilder: (ctx, index) {
            return vv[index];
          },
          pagination: SwiperPagination(
            builder: SwiperCustomPagination(
              builder: (ctx, confiq) {
                return ConstrainedBox(
                  constraints:
                      BoxConstraints.expand(height: calculateSize(300)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: RectSwiperPaginationBuilder(
                                  color: Color(0xFFE5E7EB),
                                  activeColor: textcolorbold,
                                  size: Size(
                                      calculateSize(15), calculateSize(10)),
                                  activeSize:
                                      Size(calculateSize(32), calculateSize(10))
                                  //size: calculateSize(10),
                                  //activeSize: calculateSize(20),
                                  )
                              .build(ctx, confiq),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          control: null,
        ),
      ),
    );
  }
}

class GetStartedIndex extends StatelessWidget {
  final image;
  final text1;
  final text2;

  GetStartedIndex(this.image, this.text1, this.text2);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: calculateSize(280),
          width: double.infinity, //calculateSize(286),
          fit: BoxFit.cover,
        ),
        appText(text1, 26,
            weight: FontWeight.w500,
            topmargin: 100.0,
            bottommargin: 16.0,
            leftmargin: 44.0,
            rightmargin: 44.0,
            color: textcolorbold),
        appText(text2, 16,
            weight: FontWeight.w500,
            color: textcolornotbold,
            leftmargin: 50.0,
            bottommargin: calculateSize(30.0),
            rightmargin: 50.0)
      ],
    );
  }
}

class Background extends StatelessWidget {
  //const Background({Key? key}) : super(key: key);

  final Widget chiild;

  Background(this.chiild);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: Stack(
        children: [
          Column(
            children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: appText(
                    "Skip",
                    18,
                    rightmargin: calculateSize(24),
                    weight: FontWeight.w700,
                    color: Color(0xfff5aa62),
                    topmargin: 50.0,
                  )
                  //align: TextAlign.right),
                  ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(LoginScreen.routeName);
              },
              child: Container(
                alignment: Alignment.center,
                child: appText(
                  "Get Started",
                  18,
                  weight: FontWeight.w700,
                  color: Colors.white,
                ),
                margin: EdgeInsets.only(
                    right: calculateSize(44),
                    left: calculateSize(44),
                    bottom: calculateSize(50)),
                height: calculateSize(56),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: textcolorbold,
                  borderRadius: BorderRadius.circular(calculateSize(16)),
                ),
              ),
            ),
          ),
          chiild,
        ],
      ),
    );
  }
}
