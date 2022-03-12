import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewMyHorizontalBanners extends StatelessWidget {
  final List<Widget> widgets;
  ViewMyHorizontalBanners({required this.widgets});
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: widgets,
      options: CarouselOptions(
        height: 220.h,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        initialPage: 0,
        autoPlayAnimationDuration: const Duration(seconds: 1),
        enableInfiniteScroll: true,
        reverse: false,
        scrollDirection: Axis.horizontal,
        autoPlayCurve: Curves.fastOutSlowIn,
        viewportFraction: 1,
      ),
    );
  }
}
