import 'package:e_commerce/models/onboarding_model.dart';
import 'package:e_commerce/modules/log_in/login_screen.dart';
import 'package:e_commerce/network/local/cash_helper.dart';
import 'package:e_commerce/repo/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData KlightTheme = ThemeData(
  primarySwatch: KdefaultColor,
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'opensans',
  appBarTheme: AppBarTheme(
    actionsIconTheme: IconThemeData(
      color: Colors.grey[300],
    ),
    iconTheme: IconThemeData(
      color: Colors.grey[300],
    ),
    backgroundColor: const Color(0xFFEC9772),
    //elevation: 0.0,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Color(0xFFEC9772),
      statusBarIconBrightness: Brightness.dark,
    ),
    titleTextStyle: TextStyle(
      color: Colors.grey[300],
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: KdefaultColor,
    elevation: 20,
    backgroundColor: Colors.white,
  ),
  textTheme: const TextTheme(
    headline6: TextStyle(
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: KdefaultColor,
  ),
);

MaterialColor KdefaultColor = const MaterialColor(0xFFEC9772, {
  50: Color(0xffce5641), //10%
  100: Color(0xffb74c3a), //20%
  200: Color(0xffa04332), //30%
  300: Color(0xff89392b), //40%
  400: Color(0xff733024), //50%
  500: Color(0xff5c261d), //60%
  600: Color(0xff451c16), //70%
  700: Color(0xff2e130e), //80%
  800: Color(0xff170907), //90%
  900: Color(0xff000000), //100%
});

List<OnBoardingModel> Konboarding = [
  OnBoardingModel(
    image: 'assets/images/onboarding_1.jpg',
    title: 'Get hot offers 🔥',
    body:
        'Buy any product in your like. Get it easily and high quality product.',
  ),
  OnBoardingModel(
    image: 'assets/images/onboarding_2.jpg',
    title: 'Many Products',
    body: 'Shop from thousands of brands at throwaway pieces',
  ),
  OnBoardingModel(
    image: 'assets/images/onboarding_3.jpg',
    title: 'Pay as you like 🤗',
    body:
        'You can pay with several payment methods. Visa card, Master card or Cash',
  ),
];

String HOME = 'home';
String CATEGORIES = 'categories';
String FAVORITES = 'favorites';
String PROFILE = 'profile';
String UPDATE_PROFILE = 'update-profile';
String REGISTER = 'register';
String SEARCH = 'products/search';
String? token;
void signOut(context) {
  CashHelper.removeData(key: 'token').then((value) {
    if (value) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    }
  });
}
