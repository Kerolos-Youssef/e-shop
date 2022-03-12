import 'package:e_commerce/bloc_state_management/app_cubit/app_cubit.dart';
import 'package:e_commerce/bloc_state_management/app_cubit/app_states.dart';
import 'package:e_commerce/models/login_model.dart';
import 'package:e_commerce/shared/components/custom_elevated_button.dart';
import 'package:e_commerce/shared/components/custom_text_field.dart';
import 'package:e_commerce/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UpdateProfileScreen extends StatelessWidget {
  LoginModel? loginModel;
  var formKey = GlobalKey<FormState>();
  UpdateProfileScreen({required this.loginModel});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppGetUserDataSuccessState) {
          Fluttertoast.showToast(
            msg: 'Your data updated Successfully',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.sp,
          );
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Edit Profile',
              style: TextStyle(
                fontSize: 26.sp,
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 14.w,
              vertical: 10.h,
            ),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    if (state is AppUpdateUserDataLoadingState)
                      LinearProgressIndicator(
                        color: KdefaultColor,
                      ),
                    Center(
                      child: Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                              loginModel!.data!.image,
                            ),
                            radius: 70.r,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: CircleAvatar(
                              radius: 10.r,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.camera_alt,
                                size: 25.w,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name',
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          CustomTextFormField(
                            controller: AppCubit.get(context).nameController,
                            prefix: const Icon(
                              Icons.person,
                            ),
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'Name must not be empty';
                              } else {
                                return null;
                              }
                            },
                            validationMode: AutovalidateMode.onUserInteraction,
                          ),
                          Text(
                            'E-mail',
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          CustomTextFormField(
                            controller: AppCubit.get(context).emailController,
                            prefix: const Icon(
                              Icons.email_outlined,
                            ),
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'e-mail must not be empty';
                              } else if ((RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value)) ==
                                  false) {
                                return 'Please! enter valid e-mail. EX: john@gmail.com';
                              } else {
                                return null;
                              }
                            },
                            validationMode: AutovalidateMode.onUserInteraction,
                          ),
                          Text(
                            'Phone',
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          CustomTextFormField(
                            controller: AppCubit.get(context).phoneController,
                            prefix: const Icon(
                              Icons.phone,
                            ),
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'phone must not be empty';
                              } else if (value.length < 11 ||
                                  !value.startsWith('0')) {
                                return 'Please! Enter valid phone number';
                              } else {
                                return null;
                              }
                            },
                            validationMode: AutovalidateMode.onUserInteraction,
                          ),
                          SizedBox(
                            height: 120.h,
                          ),
                          CustomElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                AppCubit.get(context).updateUserData(
                                  email: AppCubit.get(context)
                                      .emailController
                                      .text,
                                  phone: AppCubit.get(context)
                                      .phoneController
                                      .text,
                                  name:
                                      AppCubit.get(context).nameController.text,
                                );
                              }
                            },
                            child: Text(
                              'Save',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26.sp,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2.2,
                              ),
                            ),
                            color: KdefaultColor,
                            borderRadius: 25.r,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
