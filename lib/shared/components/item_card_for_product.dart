import 'package:e_commerce/models/home_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';

class ProductItemCard extends StatelessWidget {
  final ProductModel model;
  final IconData icon;
  final Color? iconColor;
  final void Function()? onFavoritePressed;

  ProductItemCard(
      {required this.model,
      required this.icon,
      this.iconColor,
      this.onFavoritePressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
        ),
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(
                    model.image,
                  ),
                  width: 190.w,
                  height: 160.h,
                ),
                if (model.discount != 0)
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 1.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(12.r),
                        topEnd: Radius.circular(12.r),
                      ),
                    ),
                    child: Text(
                      'DISCOUNT',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              model.name,
              maxLines: 2,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 14.sp,
                height: 1.15,
              ),
            ),
            Row(
              children: [
                if (model.discount != 0)
                  Text(
                    model.oldPrice.round().toString(),
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey[700],
                      fontSize: 16.sp,
                    ),
                  ),
                if (model.discount != 0)
                  SizedBox(
                    width: 10.w,
                  ),
                Text(
                  model.price.round().toString(),
                  style: TextStyle(
                    color: KdefaultColor,
                    fontSize: 18.sp,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: onFavoritePressed,
                  icon: Icon(
                    icon,
                    color: iconColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
