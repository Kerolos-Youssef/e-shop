import 'package:e_commerce/bloc_state_management/app_cubit/app_cubit.dart';
import 'package:e_commerce/bloc_state_management/app_cubit/app_states.dart';
import 'package:e_commerce/shared/components/category_item_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.separated(
          padding: EdgeInsets.symmetric(
            vertical: height * 0.025,
            horizontal: width * 0.02,
          ),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => CategoryItem(
            width: width,
            height: height,
            data: AppCubit.get(context).categoryModel!.data.data[index],
          ),
          separatorBuilder: (context, index) => SizedBox(
            height: height * 0.025,
          ),
          itemCount: AppCubit.get(context).categoryModel!.data.data.length,
        );
      },
    );
  }
}
