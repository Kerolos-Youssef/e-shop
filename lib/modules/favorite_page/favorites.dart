import 'package:e_commerce/bloc_state_management/app_cubit/app_cubit.dart';
import 'package:e_commerce/bloc_state_management/app_cubit/app_states.dart';
import 'package:e_commerce/shared/components/favorite_item_card.dart';
import 'package:e_commerce/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit.get(context).getFavorites();
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return state is AppGetFavoritesLoadingState
            ? Center(
                child: SpinKitPumpingHeart(
                  color: KdefaultColor,
                  size: 50.r,
                ),
              )
            : ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 14.w,
                  vertical: 20.h,
                ),
                itemBuilder: (context, index) => FavoriteItemCard(
                  model: AppCubit.get(context)
                      .favoritesModel!
                      .data
                      .favoritesDetailsList[index],
                  icon: AppCubit.get(context).favorites[AppCubit.get(context)
                          .favoritesModel!
                          .data
                          .favoritesDetailsList[index]
                          .product
                          .id]!
                      ? Icons.favorite
                      : Icons.favorite_outline,
                  iconColor: AppCubit.get(context).favorites[
                          AppCubit.get(context)
                              .favoritesModel!
                              .data
                              .favoritesDetailsList[index]
                              .product
                              .id]!
                      ? Colors.red
                      : null,
                  onFavoritePressed: () {
                    AppCubit.get(context).changeFavoriteIcon(
                      productId: AppCubit.get(context)
                          .favoritesModel!
                          .data
                          .favoritesDetailsList[index]
                          .product
                          .id,
                    );
                  },
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: 12.h,
                ),
                itemCount: AppCubit.get(context)
                    .favoritesModel!
                    .data
                    .favoritesDetailsList
                    .length,
              );
      },
    );
  }
}
