import 'package:e_commerce/models/change_favorite_model.dart';

abstract class AppStates {}

class AppIntialState extends AppStates {}

class AppChangeNavBarState extends AppStates {}

class AppGetHomeDataSuccessState extends AppStates {}

class AppGetHomeDataLoadingState extends AppStates {}

class AppGetHomeDataErrorState extends AppStates {
  final String error;
  AppGetHomeDataErrorState(this.error);
}

class AppGetCategoryDataSuccessState extends AppStates {}

class AppGetCategoryDataLoadingState extends AppStates {}

class AppGetCategoryDataErrorState extends AppStates {
  final String error;
  AppGetCategoryDataErrorState(this.error);
}

class AppChangeFavoriteSuccessState extends AppStates {
  final ChangeFavoriteModel changeFavoriteModel;
  AppChangeFavoriteSuccessState(this.changeFavoriteModel);
}

class AppChangeFavoriteState extends AppStates {}

class AppChangeFavoriteErrorState extends AppStates {
  final String error;
  AppChangeFavoriteErrorState(this.error);
}

class AppGetFavoritesLoadingState extends AppStates {}

class AppGetFavoritesSuccessState extends AppStates {}

class AppGetFavoritesErrorState extends AppStates {
  final String error;
  AppGetFavoritesErrorState(this.error);
}

class AppGetUserDataSuccessState extends AppStates {}

class AppGetUserDataErrorState extends AppStates {
  final String error;
  AppGetUserDataErrorState(this.error);
}

class AppUpdateUserDataSuccessState extends AppStates {}

class AppUpdateUserDataLoadingState extends AppStates {}

class AppUpdateUserDataErrorState extends AppStates {
  final String error;
  AppUpdateUserDataErrorState(this.error);
}
