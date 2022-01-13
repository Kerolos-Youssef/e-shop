import 'package:e_commerce/models/category_model.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CategoryItem extends StatelessWidget {
  double width;
  double height;
  DataModel data;
  CategoryItem({required this.width, required this.data, required this.height});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(width * 0.02),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.02,
          vertical: height * 0.02,
        ),
        child: Row(
          children: [
            Image(
              image: NetworkImage(
                data.image,
              ),
              width: width * 0.3,
              height: height * 0.2,
            ),
            SizedBox(
              width: width * 0.028,
            ),
            Text(
              data.name,
              style: TextStyle(
                fontSize: width * 0.045,
                color: KdefaultColor,
                fontWeight: FontWeight.w900,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.navigate_next,
              size: width * 0.13,
            ),
          ],
        ),
      ),
    );
  }
}
