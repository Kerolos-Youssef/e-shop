import 'package:e_commerce/bloc_state_management/app_cubit/app_cubit.dart';
import 'package:e_commerce/bloc_state_management/app_cubit/app_states.dart';
import 'package:e_commerce/bloc_state_management/bloc_observer.dart';
import 'package:e_commerce/layouts/home_layout.dart';
import 'package:e_commerce/modules/log_in/login_screen.dart';
import 'package:e_commerce/modules/on_boarding/on_boaeding_screen.dart';
import 'package:e_commerce/network/local/cash_helper.dart';
import 'package:e_commerce/repo/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/shared/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CashHelper.int();
  bool? onBoarding = CashHelper.getData(key: 'onBoarding');
  token = CashHelper.getData(key: 'token');
  Widget? startWidget;
  if (onBoarding != null) {
    if (token != null) {
      startWidget = const HomeLayout();
    } else {
      startWidget = LoginScreen();
    }
  } else {
    startWidget = const OnBoardingScreen();
  }
  runApp(
    MyApp(
      startWidget: startWidget,
    ),
  );
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  const MyApp({required this.startWidget});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: Size(392.72727272727275, 825.4545454545455),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: () => MaterialApp(
              debugShowCheckedModeBanner: false,
              builder: (context, widget) {
                //add this line
                ScreenUtil.setContext(context);
                return MediaQuery(
                  //Setting font does not change with system font size
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: widget!,
                );
              },
              title: 'Flutter E-commerce App',
              theme: KlightTheme,
              home: startWidget,
            ),
          );
        },
      ),
    );
  }
}
