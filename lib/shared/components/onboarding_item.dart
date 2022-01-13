import 'package:e_commerce/models/onboarding_model.dart';
import 'package:flutter/material.dart';

class OnBoardingItem extends StatelessWidget {
  final OnBoardingModel model;

  OnBoardingItem({required this.model});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          model.title,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: width * 0.072,
          ),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Expanded(
          child: Image.asset(model.image),
        ),
        SizedBox(
          height: height * 0.03,
        ),
        Text(
          model.body,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: width * 0.045,
          ),
        ),
      ],
    );
  }
}
