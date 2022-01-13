import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget child;
  final Color? color;
  final double? borderRadius;
  final double? height;

  CustomElevatedButton({
    required this.onPressed,
    required this.child,
    this.color = Colors.blue,
    this.borderRadius = 5,
    this.height = 45,
  }) : assert(borderRadius != null);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color!),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius!),
              ),
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}
