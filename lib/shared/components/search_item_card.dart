import 'package:e_commerce/models/search_model.dart';
import 'package:flutter/material.dart';

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
              Image(
                image: NetworkImage(
                  model.image,
                ),
                width: width * 0.4,
                height: height * 0.2,
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
                        model.name,
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
                          Text(
                            model.price.round().toString(),
                            style: TextStyle(
                              color: KdefaultColor,
                              fontSize: width * 0.043,
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
