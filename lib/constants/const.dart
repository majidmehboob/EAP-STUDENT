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

  static const Color grey_f5f5f5 = Color(0xFFF5F5F5);
  static const Color greyF1F1F1 = Color(0xFFF1F1F1);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color lightWhiteColor = Color(0xFFF7F7F7);
  static const Color lightBlueColor = Color(0xFFCEECFE);
  static const Color lightBlue68C6FF = Color(0xFF68C6FF);
  static const Color lightBlueA0DBFF = Color(0xFFA0DBFF);
  static const Color lightBlueB4F9FF = Color(0xFFB4F9FF);
  static const Color lightBlue00B8C8 = Color(0xFF00B8C8);
  static const Color lightBlueF3FEFF = Color(0xFFF3FEFF);

  static const Color lightPink = Color(0xFFEFE0FF);
  static const Color lightPinkC691FF = Color(0xFFC691FF);
  static const Color lightPink_FF8500F = Color(0x33FF8500);
  static const Color lightPinkFFEFE2 = Color(0xFFFFEFE2);
  static const Color lightPinkFFD1AB = Color(0xFFFFD1AB);
  static const Color lightGreenColor = Color(0xFFEDFFD7);
  static const Color lightGreenD5FFA1 = Color(0xFFD5FFA1);
  static const Color lightGreenBDFF6D = Color(0xFFBDFF6D);
  static const Color lightOrangeColor = Color(0xFFFFF4BD);

  static const Color lightOrangeFDE986 = Color(0xFFFDE986);
  static const Color lightOrangeFFB584= Color(0xFFFFB584);
  static const Color lightYellowFFEA7E =Color(0xFFFFEA7E);
  static const Color lightPurpleColor = Color(0xFFEFE0FF);
  static const Color lightPurpleAAABD6 = Color(0xFFAAABD6);
  static const Color grey2E2E2E = Color(0xFF2E2E2E);
  static const Color greyC0C0C0 = Color(0xFFC0C0C0);

  //------- [ 🎇 Dynamic Color]

  static Color darkLightColor = Colors.white;
  static Color lightContainerColor = lightWhiteColor;
  static Color primaryToWhite = primaryColor;
  static Color greyD9To4C = lightGreyColor;
  static Color grey73ToC0 = greyColor;
  static Color greyA0ToC0 = grey_a0a0a0;
  static Color greyA0ToD9 = grey_a0a0a0;
  static Color greyF1To2E = greyF1F1F1;
  static Color greyF7To2E = lightWhiteColor;
  static Color blueCETo68 = lightBlueColor;

  static Color pinkFFEFE2ToFFD1AB = lightPinkFFEFE2;


  static Color blueF3ToB4 = lightBlueF3FEFF;

  static Color orangelightToFF6905 = lightOrangeColor;
  static Color greenlightToD5FFA1 = lightGreenColor;
  static Color blueLightToPurpleAAABD6 = lightBlueColor;
  static Color bluelightToFF6905 = lightBlueColor;
  static Color pinkLightToOrangeFFB584 = lightPinkFFD1AB;
  static Color pinkLightToC9 = lightPink;


  static void update(bool isDark) {
    log("Wanted to know how many times the function render");
    darkLightColor = isDark ? whiteColor : blackColor;
    lightContainerColor = isDark ? grey_4C4C4C : lightWhiteColor;
    primaryToWhite = isDark ? whiteColor : primaryColor;
    greyD9To4C = isDark ? grey_4C4C4C : lightGreyColor;
    greyA0ToC0 = isDark ? grey_a0a0a0 : greyC0C0C0;
    greyA0ToD9 = isDark ? lightGreyColor : grey_a0a0a0;
    blueCETo68 = isDark ? lightBlue68C6FF : lightBlueColor;
    pinkLightToC9 = isDark ? lightPinkC691FF : lightPink;
    pinkFFEFE2ToFFD1AB = isDark ? lightPinkFFD1AB : lightPinkFFEFE2;
    orangelightToFF6905 = isDark ? lightOrangeFDE986 : lightOrangeColor;
    bluelightToFF6905 = isDark ? lightBlueA0DBFF : lightBlueColor;
    greenlightToD5FFA1 = isDark ? lightGreenD5FFA1 : lightGreenColor;
    greyF1To2E = isDark ? grey2E2E2E: greyF1F1F1;
    grey73ToC0= isDark ? greyC0C0C0 : greyColor;
    greyF7To2E = isDark ? grey2E2E2E : lightWhiteColor;
    blueF3ToB4 = isDark ? lightBlueB4F9FF : lightBlueF3FEFF;

    blueLightToPurpleAAABD6  = isDark ? lightPurpleAAABD6 : lightBlueColor;
    pinkLightToOrangeFFB584  = isDark ? lightOrangeFFB584 : lightPinkFFD1AB;
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
//-----------------------------------------------------    [  Const Values ]

class ConstValues {
  static  BorderRadius borderRadius = BorderRadius.circular(4.0);
  static const EdgeInsetsGeometry pagePadding = EdgeInsets.fromLTRB(
    20.0,
    10.0,
    20.0,
    10.0,
  );
  static const EdgeInsetsGeometry vertical12Padding = EdgeInsets.symmetric(
    vertical: 12.0,
  );
  static const EdgeInsetsGeometry vertical10Padding = EdgeInsets.symmetric(
    vertical: 12.0,
  );
}
//-----------------------------------------------------    [  Box Decoration ]

class CustomBoxDecoration {

  static  BoxDecoration decorationRadius8 = BoxDecoration(
    color: CustomAppColors.greyF7To2E,
    borderRadius: BorderRadius.circular(8.0),

  );
}
//-----------------------------------------------------    [  Const Functions ]
class ConstFunctions {
  static showDialogBox(
      {required BuildContext context,
        required Function yes,
        required Function no,

        required String title}) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: CustomAppColors.darkLightColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          surfaceTintColor: CustomAppColors.primaryColor,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [


Align(
  alignment: Alignment.topRight,
),

              const SizedBox(height: 16),

              // Message
              // Text("Do you want to Logout ?",
              Text(
                title,
                style: CustomTextStyles.text24White600,
                textAlign: TextAlign.center,

              ),
            ],
          ),

        );
      },
    );
  }

}
//-----------------------------------------------------    [  Text Styles ]

class CustomTextStyles {
  static late TextStyle title32DarkLightBold;
  static late TextStyle text28DarkLightBold;
  static late TextStyle text20DarkLight700;
  static late TextStyle text16DarkLight600;
  static late TextStyle text14PrimaryToWhiteW500;
  static late TextStyle text12PrimaryToWhiteW600;
  static late TextStyle text14GreyA0ToC0W500;
  static late TextStyle text16GreyA0ToD9W600;
  static late TextStyle text14Grey73ToC0W500;
  static late TextStyle text14DarkLightW500;

  static late TextStyle text16Grey73ToC0600;
  static late TextStyle text16Grey73ToC0400;
  static late TextStyle text16Grey73ToC0500;
  static late TextStyle text20Grey73ToC0600;
  //      [ 🎉 32 ]
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
    fontFamily: 'IBM Plex Sans',
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
    fontFamily: 'IBM Plex Sans',
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
  static const TextStyle text16DarkLightW500 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
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

  static const TextStyle text14GreyW600 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: CustomAppColors.greyColor,
  );
  static const TextStyle text14Blue00B8C8W600 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: CustomAppColors.lightBlue00B8C8,
  );
  static const TextStyle text14LightOrangeW600 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: CustomAppColors.lightOrangeColor,
  );
  static const TextStyle text14PrimaryW600 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: CustomAppColors.primaryColor,
  );

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
  static const TextStyle text12WhiteW700 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: CustomAppColors.whiteColor,
  );

  static void update() {
    title32DarkLightBold = title32Black.copyWith(
      color: CustomAppColors.darkLightColor,
    );
    text28DarkLightBold = text28BlackBold.copyWith(
      color: CustomAppColors.darkLightColor,
    );
    text14PrimaryToWhiteW500 = text14WhiteW500.copyWith(
      color: CustomAppColors.primaryToWhite,
    );
    text12PrimaryToWhiteW600 = text12PrimaryW600.copyWith(
      color: CustomAppColors.primaryToWhite,
    );
    text20DarkLight700 = text20Black700.copyWith(
      color: CustomAppColors.darkLightColor,
    );
    text14GreyA0ToC0W500 = text14GreyA0A0A0W500.copyWith(
      color: CustomAppColors.greyA0ToC0,
    );
    text16GreyA0ToD9W600 = text16GreyA0A0A0W600.copyWith(
      color: CustomAppColors.greyA0ToD9,
    );
    text16DarkLight600 = text16Black600.copyWith(color: CustomAppColors.darkLightColor);
    text14Grey73ToC0W500 = text14GreyW500.copyWith(color: CustomAppColors.grey73ToC0);
    text14DarkLightW500 = text14WhiteW500.copyWith(color: CustomAppColors.darkLightColor);
    text16Grey73ToC0400 = text16GreyW400.copyWith(color: CustomAppColors.grey73ToC0);
    text16Grey73ToC0600 = text16GreyW600.copyWith(color: CustomAppColors.grey73ToC0);
    text16Grey73ToC0500 = text16DarkLightW500.copyWith(color: CustomAppColors.grey73ToC0);
    text20Grey73ToC0600 = text20Grey600.copyWith(color: CustomAppColors.grey73ToC0);

  }
}
