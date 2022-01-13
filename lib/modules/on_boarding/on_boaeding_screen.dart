import 'package:e_commerce/modules/log_in/login_screen.dart';
import 'package:e_commerce/network/local/cash_helper.dart';
import 'package:e_commerce/shared/components/onboarding_item.dart';
import 'package:e_commerce/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var pageController = PageController();
    bool isLast = false;
    void skipToLogin() async {
      CashHelper.saveData(key: 'onBoarding', value: true).then((value) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          TextButton(
            onPressed: skipToLogin,
            child: Text(
              'SKIP',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: width * 0.045,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
          width * 0.016,
          height * 0.02,
          width * 0.016,
          height * 0.015,
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => OnBoardingItem(
                  model: Konboarding[index],
                ),
                itemCount: Konboarding.length,
                onPageChanged: (index) {
                  if (index == Konboarding.length - 1) {
                    isLast = true;
                  } else {
                    isLast = false;
                  }
                },
              ),
            ),
            SizedBox(
              height: height * 0.038,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  count: Konboarding.length,
                  effect: SwapEffect(
                    activeDotColor: KdefaultColor,
                    dotHeight: height * 0.014,
                    dotWidth: width * 0.035,
                  ),
                  onDotClicked: (index) {
                    pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 750),
                      curve: Curves.fastLinearToSlowEaseIn,
                    );
                  },
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      skipToLogin();
                    } else {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 750),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
