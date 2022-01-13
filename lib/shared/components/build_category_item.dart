import 'package:e_commerce/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryItemBuilder extends StatelessWidget {
  double width;
  double height;
  List<DataModel> data;
  CategoryItemBuilder(
      {required this.width, required this.height, required this.data});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.25,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image(
              image: NetworkImage(
                data[index].image,
              ),
              height: height * 0.25,
              width: width * 0.35,
            ),
            Container(
              width: width * 0.35,
              color: Colors.black.withOpacity(0.6),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.012,
                ),
                child: Text(
                  data[index].name,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    overflow: TextOverflow.ellipsis,
                    fontSize: width * 0.043,
                  ),
                ),
              ),
            ),
          ],
        ),
        separatorBuilder: (context, index) => SizedBox(
          width: width * 0.02,
        ),
        itemCount: data.length,
      ),
    );
  }
}
