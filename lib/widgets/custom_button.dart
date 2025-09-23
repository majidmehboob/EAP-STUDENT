import 'package:eap_student/constants/const.dart';
import 'package:eap_student/views/signin_screen.dart';
import 'package:flutter/material.dart';

import '../views/signin_signup_screen.dart';

class CustomButtonWidget extends StatefulWidget {
  final String btntext;
  final VoidCallback? btnonPressed;
  final Color? backgroundColor;
  final bool isReverse;
  final Widget? centerWidget;
  final double? width;
  final String? iconPath;
  final Color? iconColor;
  final bool? shrinkHeight;
  final TextStyle? btnTxtStyle;

  const CustomButtonWidget({
    super.key,
    required this.btntext,
    this.btnonPressed,
    this.backgroundColor,
    required this.isReverse,
    this.centerWidget,
    this.iconPath,
    this.iconColor,
    this.shrinkHeight = false,
    this.btnTxtStyle,
    this.width,
  });

  @override
  State<CustomButtonWidget> createState() => _CustomButtonWidgetState();
}

class _CustomButtonWidgetState extends State<CustomButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final Widget childBtn =
        widget.centerWidget ??
        (widget.iconPath != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ImageIcon(
                    AssetImage(widget.iconPath.toString()),
                    size: 20,
                    color: widget.iconColor ?? CustomAppColors.whiteColor,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    widget.btntext,

                    style:
                        widget.btnTxtStyle ??
                        (widget.isReverse
                            ? CustomTextStyles.text20Black600
                            : CustomTextStyles.text20White700),
                  ),
                ],
              )
            : Text(
                widget.btntext,
                style:
                    widget.btnTxtStyle ??
                    (widget.isReverse
                        ? CustomTextStyles.text20Black600
                        : CustomTextStyles.text20White700),
              ));

    final bgColor =
        widget.backgroundColor ??
        (widget.isReverse
            ? CustomAppColors.whiteColor
            : CustomAppColors.primaryColor);
    return ElevatedButton(
      onPressed: widget.btnonPressed,

      style: ElevatedButton.styleFrom(
        minimumSize: widget.shrinkHeight == true
            ? null
            : Size(widget.width ?? double.infinity, 52),
        padding: widget.shrinkHeight == true
            ? const EdgeInsets.all(8.0)
            : EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(widget.shrinkHeight==true?4.0:8),
          side: widget.backgroundColor!=null ? BorderSide(width: 0, color: widget.backgroundColor!) : ( widget.isReverse ? BorderSide(width: 2, color: CustomAppColors.primaryColor) : BorderSide(width: 0, color: CustomAppColors.primaryColor)),
        ),
        backgroundColor: bgColor,
        foregroundColor: CustomAppColors.primaryColor,
      ),
      child: childBtn,
    );
  }
}
