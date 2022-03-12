import 'package:e_commerce/bloc_state_management/app_cubit/app_cubit.dart';
import 'package:e_commerce/bloc_state_management/app_cubit/app_states.dart';
import 'package:e_commerce/models/category_model.dart';
import 'package:e_commerce/shared/components/build_category_item.dart';
import 'package:e_commerce/shared/components/item_card_for_product.dart';
import 'package:e_commerce/shared/components/view_horizontal_banners.dart';
import 'package:e_commerce/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit.get(context).getUserData();
    AppCubit.get(context).getHomeData();
    AppCubit.get(context).getCategoriesData();

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppChangeFavoriteSuccessState) {
          if (!state.changeFavoriteModel.status) {
            Fluttertoast.showToast(
              msg: state.changeFavoriteModel.message,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 3,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.sp,
            );
          }
        }
      },
      builder: (context, state) {
        return (AppCubit.get(context).homeModel != null &&
                AppCubit.get(context).categoryModel != null)
            ? SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ViewMyHorizontalBanners(
                      widgets: AppCubit.get(context)
                          .homeModel!
                          .data!
                          .banners
                          .map(
                            (e) => Image(
                              image: NetworkImage(e.image),
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          )
                          .toList(),
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Categories',
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          CategoryItemBuilder(
                            data:
                                AppCubit.get(context).categoryModel!.data.data,
                          ),
                          SizedBox(
                            height: 18.h,
                          ),
                          Text(
                            'Popular Products',
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      childAspectRatio: 21.w / 30.h,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 14.h,
                      shrinkWrap: true,
                      children: List.generate(
                        AppCubit.get(context).homeModel!.data!.products.length,
                        (index) => ProductItemCard(
                          model: AppCubit.get(context)
                              .homeModel!
                              .data!
                              .products[index],
                          icon: AppCubit.get(context).favorites[
                                  AppCubit.get(context)
                                      .homeModel!
                                      .data!
                                      .products[index]
                                      .id]!
                              ? Icons.favorite
                              : Icons.favorite_outline,
                          iconColor: AppCubit.get(context).favorites[
                                  AppCubit.get(context)
                                      .homeModel!
                                      .data!
                                      .products[index]
                                      .id]!
                              ? Colors.red
                              : null,
                          onFavoritePressed: () {
                            AppCubit.get(context).changeFavoriteIcon(
                              productId: AppCubit.get(context)
                                  .homeModel!
                                  .data!
                                  .products[index]
                                  .id,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : SpinKitFadingCube(
                color: KdefaultColor,
                size: 50.w,
              );
      },
    );
  }
}
