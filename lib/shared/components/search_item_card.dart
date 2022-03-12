import 'package:e_commerce/models/search_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';

class SearchItemCard extends StatelessWidget {
  final ProductData model;
  final IconData icon;
  final Color? iconColor;
  final void Function()? onFavoritePressed;
  SearchItemCard({
    required this.icon,
    required this.model,
    this.onFavoritePressed,
    this.iconColor,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170.h,
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
          ),
          child: Row(
            children: [
              Image(
                image: NetworkImage(
                  model.image,
                ),
                width: 160.w,
                height: 140.h,
              ),
              SizedBox(
                width: 15.w,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Column(
                    children: [
                      Text(
                        model.name,
                        maxLines: 3,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          height: 2,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            model.price.round().toString(),
                            style: TextStyle(
                              color: KdefaultColor,
                              fontSize: 18.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
