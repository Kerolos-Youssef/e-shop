import 'package:e_commerce/models/favorites_model.dart';
import 'package:flutter/material.dart';

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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.25,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(width * 0.03),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.022,
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
                    width: width * 0.4,
                    height: height * 0.2,
                  ),
                  if (model.product.discount != 0)
                    Container(
                      padding: EdgeInsetsDirectional.only(
                        start: width * 0.015,
                        end: width * 0.015,
                        top: height * 0.001,
                        bottom: height * 0.001,
                      ),
                      width: width * 0.4,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                      ),
                      child: Text(
                        'DISCOUNT',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: width * 0.032,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.8,
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(
                width: width * 0.02,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.014),
                  child: Column(
                    children: [
                      Text(
                        model.product.name,
                        maxLines: 2,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: width * 0.04,
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
                                fontSize: width * 0.043,
                              ),
                            ),
                          if (model.product.discount != 0)
                            SizedBox(
                              width: width * 0.03,
                            ),
                          Text(
                            model.product.price.round().toString(),
                            style: TextStyle(
                              color: KdefaultColor,
                              fontSize: width * 0.043,
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
