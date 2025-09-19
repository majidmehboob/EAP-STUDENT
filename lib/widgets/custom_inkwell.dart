import 'package:flutter/material.dart';

class CustomInkwell extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  final bool isCircle;

  const CustomInkwell({
    super.key,
    required this.onTap,
    required this.child,
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
        customBorder: shape,
        splashColor: Colors.grey[300],
        onTap: onTap,
        child: child,
      ),
    );
  }
}
