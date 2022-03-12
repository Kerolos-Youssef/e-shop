import 'package:e_commerce/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItemBuilder extends StatelessWidget {
  List<DataModel> data;
  CategoryItemBuilder({required this.data});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
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
              height: 150.h,
              width: 125.w,
            ),
            Container(
              width: 125.w,
              color: Colors.black.withOpacity(0.6),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 5.w,
                ),
                child: Text(
                  data[index].name,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 15.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
        separatorBuilder: (context, index) => SizedBox(
          width: 9.w,
        ),
        itemCount: data.length,
      ),
    );
  }
}
