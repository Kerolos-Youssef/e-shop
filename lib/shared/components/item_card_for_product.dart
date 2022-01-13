import 'package:e_commerce/models/home_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(width * 0.03),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.022,
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
                  width: width * 0.5,
                  height: height * 0.35,
                ),
                if (model.discount != 0)
                  Container(
                    padding: EdgeInsetsDirectional.only(
                      start: width * 0.015,
                      end: width * 0.015,
                      top: height * 0.001,
                      bottom: height * 0.001,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(width * 0.03),
                        topEnd: Radius.circular(width * 0.03),
                      ),
                    ),
                    child: Text(
                      'DISCOUNT',
                      style: TextStyle(
                        fontSize: width * 0.03,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(
              height: height * 0.003,
            ),
            Text(
              model.name,
              maxLines: 2,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: width * 0.037,
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
                      fontSize: width * 0.043,
                    ),
                  ),
                if (model.discount != 0)
                  SizedBox(
                    width: width * 0.03,
                  ),
                Text(
                  model.price.round().toString(),
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
    );
  }
}
