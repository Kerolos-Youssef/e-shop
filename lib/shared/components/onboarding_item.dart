import 'package:e_commerce/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingItem extends StatelessWidget {
  final OnBoardingModel model;

  OnBoardingItem({required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          model.title,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 28.sp,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Expanded(
          child: Image.asset(model.image),
        ),
        SizedBox(
          height: 3.h,
        ),
        Text(
          model.body,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18.sp,
          ),
        ),
      ],
    );
  }
}
