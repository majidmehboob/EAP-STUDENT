import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/const.dart';

class TextFormFieldCustomerBuilt extends StatefulWidget {
  TextFormFieldCustomerBuilt({
    super.key,
    this.controller,
    this.hintTxt,
    this.icoon,
    this.obscText,
    this.ontap,
    this.suffitext,
    this.textInputType,
    this.isOptional,
    this.isNumber,
    this.maxLines,
    this.showSeparator,
    this.eyeIcon,
    this.showEyeIcon,
    this.isEmail,
    this.isonAssetPath,
    this.isReadOnly,
    this.autoFocus = false,
    this.topLable,
    this.onChangeTextField,
    this.isSearchSchoolField = false,
    this.backgroundColor,
    this.isMarksFeedingField = false,
    this.onFieldSubmit,
    this.iconSize = 15,
    this.focusNode,
    this.addBottomMargin = true,
    this.showMultiLinesBigField = false,
    this.prefixIcon,
    this.borderRadius = 5.0,
    this.isSearchField = false,
    this.borderColor,
    this.textAlign = TextAlign.start,
    this.textStyle,
    this.isPasswordField = false,
    this.isOTP = false,
    this.showCursor = false,
  });

  TextEditingController? controller;
  String? hintTxt, suffitext, isonAssetPath;
  String? topLable;
  Widget? icoon;
  VoidCallback? ontap;
  TextInputType? textInputType = TextInputType.text;
  bool? isOptional = false,
      isNumber = false,
      isEmail = false,
      isSearchSchoolField = false,
      obscText = false,
      isReadOnly,
      autoFocus = false,
      showCursor = true;
  int? maxLines;
  bool? showSeparator = true, showEyeIcon = false, isMarksFeedingField;
  Widget? eyeIcon;
  Function(String)? onChangeTextField;
  Color? backgroundColor;
  Color? borderColor;
  Function(String)? onFieldSubmit;
  double iconSize;
  FocusNode? focusNode;
  bool? addBottomMargin;
  bool? showMultiLinesBigField;
  String? prefixIcon;
  double borderRadius;
  bool? isSearchField;
  TextAlign textAlign;
  TextStyle? textStyle;
  bool? isPasswordField, isOTP;

  @override
  State<TextFormFieldCustomerBuilt> createState() =>
      _TextFormFieldCustomerBuiltState();
}

class _TextFormFieldCustomerBuiltState
    extends State<TextFormFieldCustomerBuilt> {
  bool hidePass = true;

  void togglePassField() {
    setState(() {
      hidePass = !hidePass;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.topLable != null
            ? Container(
                padding: EdgeInsets.only(left: 0, bottom: 8, top: 5),
                child: Text(
                  widget.topLable!,
                  style: CustomTextStyles.text16GreyA0ToD9W600,
                ),
              )
            : Container(),
        SizedBox(

          width: widget.isOTP! ? 55 : double.infinity,
          child:
          TextFormField(
            textAlign: widget.isOTP! ? TextAlign.center : widget.textAlign,
            onFieldSubmitted: widget.onFieldSubmit,
            autofocus: widget.autoFocus ?? false,
            onChanged: widget.onChangeTextField,
            focusNode: widget.focusNode,
            readOnly: widget.isReadOnly ?? false,
            cursorColor: CustomAppColors.primaryColor,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            cursorHeight:widget.isOTP! ? 25 : 20,
            style:
            widget.textStyle ??
                // CustomTextStyles.text24GreyBold,
                CustomTextStyles.text16DarkLightW500,

            scrollPadding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            inputFormatters: widget.isNumber != true
                ? []
                : [
              if (widget.isOTP!) LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
            keyboardType: widget.textInputType,
            obscureText: widget.obscText ?? false ? hidePass : false,
            validator: widget.isOptional != true
                ? widget.isPasswordField == true
                ? (value) {
              if (value == null || value.isEmpty) {
                // CustomToast.showToast(message: "${widget.topLable} should not be null");
                return "${widget.topLable} should not be null";
              }
              RegExp passwordPattern = RegExp(
                  r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
              if (!passwordPattern.hasMatch(value)) {
                // CustomToast.showToast(
                //     message: 'Password must be at least 8 characters including uppercase, lowercase, a number, and a special character.');
                return 'Password must be at least 8 characters long and include uppercase, lowercase, a number, and a special character.';
              }
              return null;
            }
                : widget.isEmail == true
                ? (value) {
              RegExp regex = RegExp(
                  r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                  r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                  r"{0,253}[a-zA-Z0-9])?)*$");
              if (value == null ||
                  value.isEmpty ||
                  !regex.hasMatch(value)) {
                // CustomToast.showToast(message:  'Enter a valid email address');
                return 'Enter a valid email address';
              }
              return null;
            }
                : (value) {
              if (value == null || value.isEmpty) {
                // CustomToast.showToast(message: "${widget.topLable} should not be null");
                return "${widget.topLable} should not be null";
              }
              return null;
            }
                : (value) {
              return null;
            },

            onTap: widget.ontap,
            controller: widget.controller,
            decoration: InputDecoration(
              hintText: widget.hintTxt,
              hintStyle: CustomTextStyles.text16GreyA0A0A0W500,
              fillColor: widget.backgroundColor ?? CustomAppColors.lightContainerColor,
              contentPadding: widget.isOTP!
                  ? const EdgeInsets.fromLTRB(4, 4, 4, 4)
                  : EdgeInsets.symmetric(horizontal: 12, vertical: 17),
              suffixIcon: widget.icoon != null
                  ? UnconstrainedBox(
                  child: SizedBox(
                      height: widget.iconSize,
                      width: widget.iconSize,
                      child: widget.icoon))
                  : (widget.showEyeIcon == true
                  ? InkWell(
                  onTap: () {
                    togglePassField();
                  },
                  child: Icon(
                    hidePass
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: CustomAppColors.grey_a0a0a0,
                  ))
                  : null),
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: CustomAppColors.lightContainerColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: CustomAppColors.lightContainerColor),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(),
              errorStyle: const TextStyle(fontSize: 0.1),
            ),
          ),
        )

      ],
    );
  }
}
