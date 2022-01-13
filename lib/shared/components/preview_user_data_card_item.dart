import 'dart:ui';

import 'package:flutter/material.dart';

import '../constants.dart';

class ItemCardUserData extends StatelessWidget {
  final IconData icon;
  final String userData;
  ItemCardUserData({
    required this.userData,
    required this.icon,
  });
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Card(
      color: KdefaultColor,
      elevation: 8,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.01,
          horizontal: width * 0.02,
        ),
        child: SizedBox(
          height: height * 0.044,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: width * 0.09,
                color: Colors.white,
              ),
              const VerticalDivider(
                color: Colors.white,
                thickness: 2,
              ),
              Text(
                userData,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: width * 0.05,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
