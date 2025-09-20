import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/const.dart';

var primaryColor = CustomAppColors.primaryColor;

ThemeData lightTheme = ThemeData(
  textSelectionTheme: TextSelectionThemeData(
    selectionHandleColor: CustomAppColors.primaryColor,
  ),
  fontFamily: 'IBM Plex Sans',
  useMaterial3: true,
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  focusColor: Colors.transparent,
  splashFactory: NoSplash.splashFactory,
  brightness: Brightness.light,
  scaffoldBackgroundColor: customScaffoldBgColor(isDark: false),
  appBarTheme: appbarTheme(isDark: false),
);

ThemeData darkTheme = ThemeData(
  textSelectionTheme: TextSelectionThemeData(
    selectionHandleColor: CustomAppColors.primaryColor,
  ),

  fontFamily: 'IBM Plex Sans',
  useMaterial3: true,
  brightness: Brightness.dark,

  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  focusColor: Colors.transparent,
  splashFactory: NoSplash.splashFactory,

  appBarTheme: appbarTheme(),
  scaffoldBackgroundColor: customScaffoldBgColor(),
);



//------------------------------------[ Custom App Bar Theme ]--------------------------------------//

AppBarTheme appbarTheme({bool isDark = true}) => AppBarTheme(
  // backgroundColor:
  backgroundColor: Colors.transparent,
  elevation: 0,

  centerTitle: true,
iconTheme: IconThemeData(
  color: isDark?CustomAppColors.whiteColor:CustomAppColors.blackColor
),
  scrolledUnderElevation: 0,
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness: isDark
        ? Brightness.light
        : Brightness.dark,
  ),
);



Color customScaffoldBgColor({bool isDark = true}) =>
    isDark ? CustomAppColors.black232323 : CustomAppColors.whiteColor;
