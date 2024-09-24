import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.bgColor, this.width,
  });
  final VoidCallback onPressed;
  final Widget child;
  final Color? bgColor;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: width??Get.width,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: bgColor ?? Colors.indigo,
              shape: RoundedRectangleBorder(

                  borderRadius: BorderRadius.circular(30),
                side: const BorderSide(color: Colors.indigo)
              )),
          child: child),
    );
  }
}
