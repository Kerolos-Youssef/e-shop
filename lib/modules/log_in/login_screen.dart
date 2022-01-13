import 'package:e_commerce/bloc_state_management/login_cubit/login_cubit.dart';
import 'package:e_commerce/bloc_state_management/login_cubit/login_states.dart';
import 'package:e_commerce/layouts/home_layout.dart';
import 'package:e_commerce/modules/register_module/register.dart';
import 'package:e_commerce/network/local/cash_helper.dart';
import 'package:e_commerce/shared/components/custom_elevated_button.dart';
import 'package:e_commerce/shared/components/custom_text_field.dart';
import 'package:e_commerce/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.loginModel.status) {
              CashHelper.saveData(
                      key: 'token', value: state.loginModel.data!.token)
                  .then((value) {
                token = state.loginModel.data!.token;
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const HomeLayout(),
                  ),
                );
                LoginCubit.get(context).emailController.clear();
                LoginCubit.get(context).passwordController.clear();
              });
            } else {
              LoginCubit.get(context).emailController.clear();
              LoginCubit.get(context).passwordController.clear();
              Fluttertoast.showToast(
                msg: 'We were unable to login, Please! check the entered data',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0,
              );
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
            ),
            body: Padding(
              padding: EdgeInsetsDirectional.only(
                start: width * 0.03,
                end: width * 0.03,
                top: height * 0.02,
                bottom: height * 0.02,
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign In',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.12,
                          color: KdefaultColor[800],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Text(
                        'Login to enjoy our hot offers',
                        style: TextStyle(
                          fontSize: width * 0.06,
                          fontWeight: FontWeight.w500,
                          color: KdefaultColor[300],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.06,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                          start: width * 0.03,
                          end: width * 0.03,
                        ),
                        child: CustomTextFormField(
                          controller: LoginCubit.get(context).emailController,
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
                        height: height * 0.035,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                          start: width * 0.03,
                          end: width * 0.03,
                        ),
                        child: CustomTextFormField(
                          controller:
                              LoginCubit.get(context).passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          label: 'Password',
                          isPassword: LoginCubit.get(context).isPasswordHidden,
                          prefix: const Icon(Icons.lock),
                          suffix: LoginCubit.get(context).passwordIcon,
                          validationMode: AutovalidateMode.onUserInteraction,
                          suffixPressed: () {
                            LoginCubit.get(context).changePasswordVisibility();
                          },
                          onSubmit: (value) {
                            if (formKey.currentState!.validate()) {
                              LoginCubit.get(context).userLogin(
                                email: LoginCubit.get(context)
                                    .emailController
                                    .text,
                                password: LoginCubit.get(context)
                                    .passwordController
                                    .text,
                              );
                            }
                          },
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'password must not be empty';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 letters';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      state is! LoginLoadingState
                          ? CustomElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  LoginCubit.get(context).userLogin(
                                    email: LoginCubit.get(context)
                                        .emailController
                                        .text,
                                    password: LoginCubit.get(context)
                                        .passwordController
                                        .text,
                                  );
                                }
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: width * 0.06,
                                  color: Colors.white,
                                  letterSpacing: 3,
                                ),
                              ),
                              color: KdefaultColor,
                              height: height * 0.078,
                              borderRadius: 10,
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                              fontSize: width * 0.035,
                            ),
                          ),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Register(),
                                ),
                              );
                            },
                            child: Text(
                              'REGISTER',
                              style: TextStyle(
                                fontSize: width * 0.035,
                                letterSpacing: 1.8,
                              ),
                            ),
                          ),
                        ],
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
