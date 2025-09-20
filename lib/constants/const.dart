import 'dart:developer';

import 'package:eap_student/views/add.dart';
import 'package:eap_student/views/dashboard.dart';
import 'package:eap_student/views/history.dart';
import 'package:eap_student/views/quiz.dart';
import 'package:eap_student/views/user.dart';
import 'package:flutter/material.dart';

import '../utils/shared-preferences.dart';

//-----------------------------------------------------    [  Colors ]

class CustomAppColors {
  static const Color primaryColor = Color(0xFF32357A);
  static const Color blackColor = Color(0xFF101010);
  static const Color black232323 = Color(0xFF232323);
  static const Color orangeColor = Color(0xFFFF6905);
  static const Color greyColor = Color(0xFF737373);
  static const Color lightGreyColor = Color(0xFFD9D9D9);
  static const Color grey_4C4C4C = Color(0xFF4C4C4C);
  static const Color grey_a0a0a0 = Color(0xFFA0A0A0);
  static const Color grey_Cccccc = Color(0xFFCCCCCC);
  static const Color grey_d9d9d9 = Color(0xFFD9D9D9);
  static const Color grey_f5f5f5 = Color(0xFFF5F5F5);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color lightWhiteColor = Color(0xFFF7F7F7);
  static const Color lightBlueColor = Color(0xFFCEECFE);
  static const Color lightPink = Color(0xFFEFE0FF);
  static const Color lightPink_FF8500F = Color(0x33FF8500);
  static const Color lightPink_FFEFE2 = Color(0xFFFFEFE2);
  static const Color lightGreenColor = Color(0xFFEDFFD7);
  static const Color lightOrangeColor = Color(0xFFFFF4BD);
  static const Color lightPurpleColor = Color(0xFFEFE0FF);

  //------- [ 🎇 Dynamic Color]

  static Color darkLightColor = Colors.white;
  static Color lightContainerColor = lightWhiteColor;
  static Color primaryToWhite =primaryColor;


  static void update(bool isDark) {
    darkLightColor = isDark ? whiteColor : blackColor;
    lightContainerColor = isDark ?  grey_4C4C4C:lightWhiteColor;
    primaryToWhite = isDark ? whiteColor:primaryColor;
  }
}

//-----------------------------------------------------    [  App Screens ]

class AppScreens {
  List<Widget> get screenLst => [
    DashboardScreen(),
    QuizScreen(),
    AddScreen(),
    HistoryScreen(),
    UserScreen(),
  ];
}

//-----------------------------------------------------    [  Box Decoration ]

class CustomBoxDecoration {}

//-----------------------------------------------------    [  Text Styles ]

//      [ 🎉 32 ]

class CustomTextStyles {
  static late TextStyle title32DarkLightBold;
  static late TextStyle text28DarkLightBold;
  static late TextStyle text14PrimaryToWhiteW500;

  static const TextStyle title32Black = TextStyle(
    color: CustomAppColors.blackColor,
    fontWeight: FontWeight.bold,
    fontSize: 32,
  );
  static const TextStyle title32White = TextStyle(
    color: CustomAppColors.whiteColor,
    fontWeight: FontWeight.bold,
    fontSize: 32,
  );
  //      [ 🎉 28 ]

  static const TextStyle text28BlackBold = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: CustomAppColors.blackColor,
  );
  //      [ 🎉 24 ]

  static const TextStyle text24GreyBold = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: CustomAppColors.greyColor,
  );
  static const TextStyle text24White600 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: CustomAppColors.whiteColor,
  );
  //      [ 🎉 20 ]

  static const TextStyle text20White700 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: CustomAppColors.whiteColor,
  );
  static const TextStyle text20Black700 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: CustomAppColors.blackColor,
  );
  static const TextStyle text20White600 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: CustomAppColors.whiteColor,
  );
  static const TextStyle text20Black600 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: CustomAppColors.blackColor,
  );
  static const TextStyle text20Grey600 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: CustomAppColors.greyColor,
  );
  static const TextStyle text20PrimaryW700 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: CustomAppColors.primaryColor,
  );
  //      [ 🎉 18 ]

  static const TextStyle text18PrimaryBold = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: CustomAppColors.primaryColor,
  );
  static const TextStyle text18WhiteBold = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: CustomAppColors.whiteColor,
  );

  //      [ 🎉 16 ]

  static const TextStyle text16White600 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: CustomAppColors.whiteColor,
    height: 1.4,
  );
  static const TextStyle text16Black600 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: CustomAppColors.blackColor,
  );
  static const TextStyle text16GreyA0A0A0W600 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: CustomAppColors.grey_a0a0a0,
  );
  static const TextStyle text16GreyW600 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: CustomAppColors.greyColor,
  );
  static const TextStyle text16GreyA0A0A0W500 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: CustomAppColors.grey_a0a0a0,
  );
  static const TextStyle text16BlackW500 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: CustomAppColors.blackColor,
  );
  static const TextStyle text16GreyA0A0A0W400 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: CustomAppColors.grey_a0a0a0,
  );
  static const TextStyle text16GreyW400 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: CustomAppColors.greyColor,
  );

  //      [ 🎉 14 ]

  static const TextStyle text14GreyA0A0A0W500 = TextStyle(
    fontSize: 14,
    height: 1.4,
    fontWeight: FontWeight.w400,
    color: CustomAppColors.grey_a0a0a0,
  );
  static const TextStyle text14WhiteW400 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: CustomAppColors.whiteColor,
  );
  static const TextStyle text14GreyW400 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: CustomAppColors.greyColor,
  );
  static const TextStyle text14GreyW500 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: CustomAppColors.greyColor,
  );
  static const TextStyle text14GreyW600 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: CustomAppColors.greyColor,
  );
  static const TextStyle text14WhiteW500 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: CustomAppColors.primaryColor,
  );

  //      [ 🎉 12 ]

  static const TextStyle text12PrimaryW600 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: CustomAppColors.primaryColor,
  );
  static const TextStyle text12WhiteW600 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: CustomAppColors.whiteColor,
  );

  static void update() {

    title32DarkLightBold = title32Black.copyWith(
      color: CustomAppColors.darkLightColor,
    );
    text28DarkLightBold = text28BlackBold.copyWith(
      color: CustomAppColors.darkLightColor,
    );
    text14PrimaryToWhiteW500 = text14WhiteW500.copyWith(color: CustomAppColors.primaryToWhite);

  }
}
