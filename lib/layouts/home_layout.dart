import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:e_commerce/bloc_state_management/app_cubit/app_cubit.dart';
import 'package:e_commerce/bloc_state_management/app_cubit/app_states.dart';
import 'package:e_commerce/modules/search/search_screen.dart';
import 'package:e_commerce/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'E-Shop',
                style: TextStyle(
                  fontSize: width * 0.068,
                  letterSpacing: 1.5,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.search,
                  ),
                ),
              ],
            ),
            bottomNavigationBar: ConvexAppBar(
              height: height * 0.077,
              backgroundColor: KdefaultColor,
              elevation: 4,
              activeColor: KdefaultColor,
              items: AppCubit.get(context).bottomNavBarItems,
              initialActiveIndex: AppCubit.get(context).currentIndex,
              onTap: (index) {
                AppCubit.get(context).changeNavBar(index);
              },
            ),
            body: AppCubit.get(context)
                .screens[AppCubit.get(context).currentIndex],
          );
        });
  }
}
