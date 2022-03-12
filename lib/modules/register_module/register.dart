import 'package:e_commerce/bloc_state_management/register_cubit/register_cubit.dart';
import 'package:e_commerce/bloc_state_management/register_cubit/register_states.dart';
import 'package:e_commerce/modules/log_in/login_screen.dart';
import 'package:e_commerce/shared/components/custom_elevated_button.dart';
import 'package:e_commerce/shared/components/custom_text_field.dart';
import 'package:e_commerce/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Register extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            if (state.registerModel.status) {
              Fluttertoast.showToast(
                msg: state.registerModel.message,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.sp,
              );
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
              RegisterCubit.get(context).emailController.clear();
              RegisterCubit.get(context).nameController.clear();
              RegisterCubit.get(context).phoneController.clear();
              RegisterCubit.get(context).passwordController.clear();
            }
          } else if (state is RegisterErrorState) {
            Fluttertoast.showToast(
              msg: 'The e-mail or phone number already used',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.sp,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              iconTheme: IconThemeData(
                color: KdefaultColor,
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 14.h,
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Register',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 44.sp,
                          color: KdefaultColor[800],
                        ),
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      Text(
                        'Register to enjoy our hot offers',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                          color: KdefaultColor[300],
                        ),
                      ),
                      SizedBox(
                        height: 45.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 7.w,
                        ),
                        child: CustomTextFormField(
                          controller: RegisterCubit.get(context).nameController,
                          keyboardType: TextInputType.name,
                          label: 'Name',
                          prefix: const Icon(Icons.person),
                          validationMode: AutovalidateMode.onUserInteraction,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Name must not be empty';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 7.w,
                        ),
                        child: CustomTextFormField(
                          controller:
                              RegisterCubit.get(context).emailController,
                          keyboardType: TextInputType.emailAddress,
                          label: 'E-mail',
                          prefix: const Icon(Icons.mail_outline),
                          validationMode: AutovalidateMode.onUserInteraction,
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
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 7.w,
                        ),
                        child: CustomTextFormField(
                          controller:
                              RegisterCubit.get(context).phoneController,
                          keyboardType: TextInputType.phone,
                          label: 'Phone Number',
                          prefix: const Icon(Icons.phone),
                          validationMode: AutovalidateMode.onUserInteraction,
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
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 7.w,
                        ),
                        child: CustomTextFormField(
                          controller:
                              RegisterCubit.get(context).passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          label: 'Password',
                          isPassword:
                              RegisterCubit.get(context).isPasswordHidden,
                          prefix: const Icon(Icons.lock),
                          suffix: RegisterCubit.get(context).passwordIcon,
                          validationMode: AutovalidateMode.onUserInteraction,
                          suffixPressed: () {
                            RegisterCubit.get(context)
                                .changePasswordVisibility();
                          },
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'password must not be empty';
                            } else if (value.length < 6) {
                              return 'Password is too short';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      state is! RegisterLoadingState
                          ? CustomElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  RegisterCubit.get(context).registerUser(
                                    email: RegisterCubit.get(context)
                                        .emailController
                                        .text,
                                    password: RegisterCubit.get(context)
                                        .passwordController
                                        .text,
                                    name: RegisterCubit.get(context)
                                        .nameController
                                        .text,
                                    phone: RegisterCubit.get(context)
                                        .phoneController
                                        .text,
                                  );
                                }
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  fontSize: 30.sp,
                                  color: Colors.white,
                                  letterSpacing: 3,
                                ),
                              ),
                              color: KdefaultColor,
                              height: 58.h,
                              borderRadius: 15.r,
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
