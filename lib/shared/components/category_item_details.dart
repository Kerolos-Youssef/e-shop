import 'package:e_commerce/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';

class CategoryItem extends StatelessWidget {
  DataModel data;
  CategoryItem({required this.data});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 2.w,
          vertical: 3.h,
        ),
        child: Row(
          children: [
            Image(
              image: NetworkImage(
                data.image,
              ),
              width: 130.w,
              height: 130.h,
            ),
            SizedBox(
              width: 4.w,
            ),
            Text(
              data.name,
              style: TextStyle(
                fontSize: 19.sp,
                color: KdefaultColor,
                fontWeight: FontWeight.w900,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.navigate_next,
              size: 38.w,
            ),
          ],
        ),
      ),
    );
  }
}
