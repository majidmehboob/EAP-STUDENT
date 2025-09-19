import 'package:flutter/material.dart';

class CustomInkwell extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  final bool isCircle;
  final double? radius;
  final Color? color;

  const CustomInkwell({
    super.key,
    required this.onTap,
    required this.child,
    this.color,
    this.radius,
    this.isCircle = true,
  });

  @override
  Widget build(BuildContext context) {
    final shape = isCircle
        ? const CircleBorder()
        : RoundedRectangleBorder(borderRadius: BorderRadius.circular(4));

    return Material(
      color: Colors.transparent,
      shape: shape,
      child: InkWell(
        radius: radius,
        customBorder: shape,
        splashColor:color?? Colors.grey[300],
        onTap: onTap,
        child: child,
      ),
    );
  }
}
