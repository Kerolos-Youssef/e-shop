import 'package:e_commerce/bloc_state_management/app_cubit/app_cubit.dart';
import 'package:e_commerce/bloc_state_management/search_cubit/search_cubit.dart';
import 'package:e_commerce/bloc_state_management/search_cubit/search_states.dart';
import 'package:e_commerce/shared/components/custom_elevated_button.dart';
import 'package:e_commerce/shared/components/custom_text_field.dart';
import 'package:e_commerce/shared/components/search_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 15.h,
                horizontal: 10.w,
              ),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: SearchCubit.get(context).searchController,
                      validationMode: AutovalidateMode.onUserInteraction,
                      validate: (text) {
                        if (text!.isEmpty) {
                          return 'You must enter a text to search';
                        } else {
                          return null;
                        }
                      },
                      prefix: const Icon(Icons.search),
                      onSubmit: (text) {
                        if (formKey.currentState!.validate()) {
                          SearchCubit.get(context).search(text!);
                        }
                      },
                    ),
                    if (state is SearchLoadingState)
                      const LinearProgressIndicator(),
                    if (state is SearchSuccessState)
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) => SearchItemCard(
                            icon: SearchCubit.get(context)
                                    .searchModel!
                                    .data
                                    .data[index]
                                    .inFavorites
                                ? Icons.favorite
                                : Icons.favorite_outline,
                            model: SearchCubit.get(context)
                                .searchModel!
                                .data
                                .data[index],
                            iconColor: SearchCubit.get(context)
                                    .searchModel!
                                    .data
                                    .data[index]
                                    .inFavorites
                                ? Colors.red
                                : null,
                          ),
                          separatorBuilder: (context, index) => SizedBox(
                            height: 12.h,
                          ),
                          itemCount: SearchCubit.get(context)
                              .searchModel!
                              .data
                              .data
                              .length,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
