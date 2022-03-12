import 'package:e_commerce/modules/log_in/login_screen.dart';
import 'package:e_commerce/network/local/cash_helper.dart';
import 'package:e_commerce/shared/components/onboarding_item.dart';
import 'package:e_commerce/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                fontSize: 25.sp,
                letterSpacing: 1.6,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
          12.w,
          20.h,
          12.w,
          25.h,
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
              height: 20.h,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  count: Konboarding.length,
                  effect: SwapEffect(
                    activeDotColor: KdefaultColor,
                    dotHeight: 8.h,
                    dotWidth: 18.w,
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
