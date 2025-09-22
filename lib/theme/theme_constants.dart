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
  bottomNavigationBarTheme: customBottomNavBarTheme(isDark: false),
  scaffoldBackgroundColor: customScaffoldBgColor(isDark: false),
  drawerTheme: customDrawerTheme(isDark: false),
  appBarTheme: appbarTheme(isDark: false),
  sliderTheme: customSliderTheme(isDark: false),
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
  bottomNavigationBarTheme: customBottomNavBarTheme(),
  appBarTheme: appbarTheme(),
  scaffoldBackgroundColor: customScaffoldBgColor(),
  drawerTheme: customDrawerTheme(),
  sliderTheme: customSliderTheme(),
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
//------------------------------------[ Custom Drawer Theme ]--------------------------------------//
DrawerThemeData customDrawerTheme({bool isDark = true}) => DrawerThemeData(
  backgroundColor: isDark ? CustomAppColors.black232323 : CustomAppColors.whiteColor,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(40),
      bottomRight: Radius.circular(40),
    ),
  ),
  elevation: 10,
);
//------------------------------------[ Custom Scaffold Theme ]--------------------------------------//

Color customScaffoldBgColor({bool isDark = true}) =>
    isDark ? CustomAppColors.black232323 : CustomAppColors.whiteColor;

//------------------------------------[ Custom BottomNavBar Theme ]----------------------------------//

BottomNavigationBarThemeData customBottomNavBarTheme({bool isDark = true}) =>BottomNavigationBarThemeData(
  backgroundColor: isDark? CustomAppColors.grey2E2E2E :CustomAppColors.whiteColor,
  unselectedItemColor: isDark?CustomAppColors.whiteColor:CustomAppColors.greyColor,
);

//------------------------------------[ Custom Switch Theme ]--------------------------------------//

SliderThemeData customSliderTheme({bool isDark = true}) => SliderThemeData(
  trackHeight: 8,

  padding: ConstValues.vertical12Padding,
  thumbShape: SliderComponentShape.noThumb,
  overlayShape: SliderComponentShape.noOverlay,
  trackShape: FullWidthTrackShape(),
  inactiveTrackColor:isDark? CustomAppColors.grey2E2E2E:CustomAppColors.lightWhiteColor,
);




class FullWidthTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight ?? 2.0;
    final double trackLeft = offset.dx;
    final double trackTop = offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
