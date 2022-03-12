import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';

class ItemCardUserData extends StatelessWidget {
  final IconData icon;
  final String userData;
  ItemCardUserData({
    required this.userData,
    required this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      color: KdefaultColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 4.h,
          horizontal: 10.w,
        ),
        child: SizedBox(
          height: 40.h,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 30.w,
                color: Colors.white,
              ),
              const VerticalDivider(
                color: Colors.white,
                thickness: 2,
              ),
              Text(
                userData,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 19.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
