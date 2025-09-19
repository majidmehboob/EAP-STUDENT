import 'package:eap_student/constants/const.dart';
import 'package:eap_student/utils/providers.dart';
import 'package:eap_student/views/splash_first.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) =>  OurProviderClass(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      title: 'EAP App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'IBM Plex Sans',
        scaffoldBackgroundColor: CustomAppColors.whiteColor,
        useMaterial3: true,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        appBarTheme: AppBarThemeData(

          backgroundColor: Colors.white
        ),
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: CustomAppColors.primaryColor,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: CustomAppColors.primaryColor,
        ),
      ),
      home: SplashFirst(),
    );
  }
}
