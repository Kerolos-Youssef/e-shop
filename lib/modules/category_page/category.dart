import 'package:e_commerce/bloc_state_management/app_cubit/app_cubit.dart';
import 'package:e_commerce/bloc_state_management/app_cubit/app_states.dart';
import 'package:e_commerce/shared/components/category_item_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.separated(
          padding: EdgeInsets.symmetric(
            vertical: 20.h,
            horizontal: 18.w,
          ),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => CategoryItem(
            data: AppCubit.get(context).categoryModel!.data.data[index],
          ),
          separatorBuilder: (context, index) => SizedBox(
            height: 15.h,
          ),
          itemCount: AppCubit.get(context).categoryModel!.data.data.length,
        );
      },
    );
  }
}
