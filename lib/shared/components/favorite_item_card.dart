import 'package:e_commerce/models/favorites_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';

class FavoriteItemCard extends StatelessWidget {
  final FavoritesData model;
  final IconData icon;
  final Color? iconColor;
  final void Function()? onFavoritePressed;
  FavoriteItemCard({
    required this.model,
    required this.icon,
    this.iconColor,
    this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175.h,
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 12.w,
          ),
          child: Row(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    image: NetworkImage(
                      model.product.image,
                    ),
                    width: 150.w,
                    height: 160.h,
                  ),
                  if (model.product.discount != 0)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 1.w,
                        vertical: 1.h,
                      ),
                      width: 160.w,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                      ),
                      child: Text(
                        'DISCOUNT',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.8,
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(
                width: 5.w,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.5.h),
                  child: Column(
                    children: [
                      Text(
                        model.product.name,
                        maxLines: 3,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          height: 2,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          if (model.product.discount != 0)
                            Text(
                              model.product.oldPrice.round().toString(),
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey[700],
                                fontSize: 17.sp,
                              ),
                            ),
                          if (model.product.discount != 0)
                            SizedBox(
                              width: 10.w,
                            ),
                          Text(
                            model.product.price.round().toString(),
                            style: TextStyle(
                              color: KdefaultColor,
                              fontSize: 17.sp,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
