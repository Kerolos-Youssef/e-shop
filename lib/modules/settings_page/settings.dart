import 'package:e_commerce/bloc_state_management/app_cubit/app_cubit.dart';
import 'package:e_commerce/bloc_state_management/app_cubit/app_states.dart';
import 'package:e_commerce/modules/update_profile_page/update_profile_screen.dart';
import 'package:e_commerce/shared/components/custom_elevated_button.dart';
import 'package:e_commerce/shared/components/preview_user_data_card_item.dart';
import 'package:e_commerce/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return AppCubit.get(context).userData != null
            ? Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 35.h,
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          AppCubit.get(context).userData!.data!.image,
                        ),
                        radius: 75.r,
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 90.w,
                        ),
                        child: CustomElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => UpdateProfileScreen(
                                  loginModel: AppCubit.get(context).userData,
                                ),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Text(
                                'Edit Profile',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  color: Colors.white,
                                ),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          color: KdefaultColor,
                          borderRadius: 25.r,
                        ),
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      ItemCardUserData(
                        icon: Icons.person,
                        userData: AppCubit.get(context).userData!.data!.name,
                      ),
                      ItemCardUserData(
                        icon: Icons.email_outlined,
                        userData: AppCubit.get(context).userData!.data!.email,
                      ),
                      ItemCardUserData(
                        icon: Icons.phone,
                        userData: AppCubit.get(context).userData!.data!.phone,
                      ),
                      const Spacer(),
                      CustomElevatedButton(
                        onPressed: () {
                          signOut(context);
                        },
                        child: Text(
                          'Sign Out',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.2,
                          ),
                        ),
                        color: KdefaultColor,
                      ),
                    ],
                  ),
                ),
              )
            : SpinKitRipple(
                color: KdefaultColor,
                size: 75.w,
              );
      },
    );
  }
}
