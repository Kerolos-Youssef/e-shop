import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:e_commerce/bloc_state_management/app_cubit/app_states.dart';
import 'package:e_commerce/models/category_model.dart';
import 'package:e_commerce/models/change_favorite_model.dart';
import 'package:e_commerce/models/favorites_model.dart';
import 'package:e_commerce/models/home_model.dart';
import 'package:e_commerce/models/login_model.dart';
import 'package:e_commerce/modules/category_page/category.dart';
import 'package:e_commerce/modules/favorite_page/favorites.dart';
import 'package:e_commerce/modules/home_page/home.dart';
import 'package:e_commerce/modules/settings_page/settings.dart';
import 'package:e_commerce/repo/dio_helper.dart';
import 'package:e_commerce/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppIntialState());
  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<TabItem> bottomNavBarItems = const [
    TabItem(
      icon: Icon(Icons.home),
      title: 'Home',
    ),
    TabItem(
      icon: Icon(Icons.apps),
      title: 'Category',
    ),
    TabItem(
      icon: Icon(Icons.favorite),
      title: 'Favorites',
    ),
    TabItem(
      icon: Icon(Icons.settings),
      title: 'Settings',
    ),
  ];

  List screens = const [
    HomePage(),
    CategoryPage(),
    FavoritesPage(),
    SettingsPage(),
  ];

  void changeNavBar(int index) {
    currentIndex = index;
    emit(AppChangeNavBarState());
  }

  HomeModel? homeModel;
  Map<int, bool> favorites = {};
  void getHomeData() {
    emit(AppGetHomeDataLoadingState());
    DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      homeModel!.data!.products.forEach((element) {
        favorites.addAll({
          element.id: element.inFavorites,
        });
      });
      emit(AppGetHomeDataSuccessState());
    }).catchError((error) {
      emit(AppGetHomeDataErrorState(error.toString()));
    });
  }

  CategoryModel? categoryModel;
  void getCategoriesData() {
    emit(AppGetCategoryDataLoadingState());
    DioHelper.getData(
      url: CATEGORIES,
    ).then((value) {
      categoryModel = CategoryModel.fromJson(value.data);
      emit(AppGetCategoryDataSuccessState());
    }).catchError((error) {
      emit(AppGetCategoryDataErrorState(error.toString()));
    });
  }

  ChangeFavoriteModel? changeFavoriteModel;
  void changeFavoriteIcon({required int productId}) {
    favorites[productId] = !(favorites[productId]!);
    emit(AppChangeFavoriteState());
    DioHelper.postData(url: FAVORITES, token: token, data: {
      'product_id': productId,
    }).then((value) {
      changeFavoriteModel = ChangeFavoriteModel.fromJson(value.data);
      if (!(changeFavoriteModel!.status)) {
        favorites[productId] = !(favorites[productId]!);
      } else {
        getFavorites();
      }
      emit(AppChangeFavoriteSuccessState(changeFavoriteModel!));
    }).catchError((error) {
      favorites[productId] = !(favorites[productId]!);
      emit(AppChangeFavoriteErrorState(error.toString()));
    });
  }

  FavoritesModel? favoritesModel;
  void getFavorites() {
    emit(AppGetFavoritesLoadingState());
    DioHelper.getData(url: FAVORITES, token: token).then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);
      emit(AppGetFavoritesSuccessState());
    }).catchError((error) {
      emit(AppGetFavoritesErrorState(error.toString()));
    });
  }

  LoginModel? userData;
  void getUserData() {
    DioHelper.getData(url: PROFILE, token: token).then((value) {
      userData = LoginModel.fromJson(value.data);
      nameController.text = userData!.data!.name;
      emailController.text = userData!.data!.email;
      phoneController.text = userData!.data!.phone;
      emit(AppGetUserDataSuccessState());
    }).catchError((error) {
      print('the error is ===> ${error.toString()}');
      emit(AppGetUserDataErrorState(error.toString()));
    });
  }

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  void updateUserData({
    required String name,
    required String phone,
    required String email,
  }) {
    emit(AppUpdateUserDataLoadingState());
    DioHelper.putData(
      url: UPDATE_PROFILE,
      token: token,
      data: {
        'name': name,
        'phone': phone,
        'email': email,
        // 'password': password,
      },
    ).then((value) {
      print(value.data);
      userData = LoginModel.fromJson(value.data);
      emit(AppUpdateUserDataSuccessState());
      getUserData();
    }).catchError((error) {
      print('the error is ===> ${error.toString()}');
      emit(AppUpdateUserDataErrorState(error.toString()));
    });
  }
}
