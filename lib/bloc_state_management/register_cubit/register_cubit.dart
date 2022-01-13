import 'package:bloc/bloc.dart';
import 'package:e_commerce/bloc_state_management/register_cubit/register_states.dart';
import 'package:e_commerce/models/login_model.dart';
import 'package:e_commerce/models/register_model.dart';
import 'package:e_commerce/repo/dio_helper.dart';
import 'package:e_commerce/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());
  static RegisterCubit get(context) => BlocProvider.of(context);
  IconData passwordIcon = Icons.visibility;
  bool isPasswordHidden = true;
  //LoginModel? loginModel;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  void changePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    isPasswordHidden
        ? passwordIcon = Icons.visibility
        : passwordIcon = Icons.visibility_off;
    emit(ChangePasswordVisibility());
  }

  RegisterModel? registerModel;
  void registerUser({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    emit(RegisterLoadingState());
    DioHelper.postData(
      url: REGISTER,
      data: {
        'email': email,
        'password': password,
        'name': name,
        'phone': phone,
      },
    ).then((value) {
      registerModel = RegisterModel.fromJson(value.data);
      print(registerModel!.message);
      emit(RegisterSuccessState(registerModel!));
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }
}
