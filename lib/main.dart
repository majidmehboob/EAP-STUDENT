import 'package:eap_student/constants/const.dart';
import 'package:eap_student/theme/theme_constants.dart';
import 'package:eap_student/theme/theme_manager.dart';
import 'package:eap_student/utils/providers.dart';
import 'package:eap_student/utils/shared-preferences.dart';
import 'package:eap_student/views/splash_first.dart';
import 'package:eap_student/widgets/scaffold_second.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSharedPreferences.init();

  final themeManager = ThemeManager();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OurProviderClass()),
        ChangeNotifierProvider<ThemeManager>.value(value: themeManager),
      ],
      child: const MyApp(),
    ),
  );
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ThemeManager>(
//       builder: (context, themeManager, _) {
//         SystemChrome.setPreferredOrientations([
//           DeviceOrientation.portraitUp,
//           DeviceOrientation.portraitDown,
//         ]);
//
//         return MaterialApp(
//           title: 'EAP App',
//           debugShowCheckedModeBanner: false,
//           theme: lightTheme,
//           darkTheme: darkTheme,
//           themeMode: themeManager.themeData, // listens automatically
//           home: SplashFirst(),
//         );
//       },
//     );
//   }
// }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  ThemeManager? themeManager;

  @override
  void initState() {
    super.initState();
    themeManager = Provider.of<ThemeManager>(context, listen: false);
    themeManager!.addListener(themeListener);
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    themeManager!.removeListener(themeListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'EAP App',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeManager.themeData, // this will now update properly
      home: CustomScaffold(),
    );
  }
}

// class _MyAppState extends State<MyApp> {
//   @override
//   void initState() {
//     super.initState();
//     ThemeManager().addListener(themeListener);
//   }
//
//   themeListener() {
//     if (mounted) {
//       setState(() {});
//     }
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     ThemeManager().removeListener(themeListener);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final themeManager = Provider.of<ThemeManager>(context, listen: false);
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//     ]);
//     return MaterialApp(
//       title: 'EAP App',
//       debugShowCheckedModeBanner: false,
//       theme: lightTheme,
//       darkTheme: darkTheme,
//       themeMode: themeManager.themeData,
//       // theme: ThemeData(
//       //   fontFamily: 'IBM Plex Sans',
//       //   scaffoldBackgroundColor: CustomAppColors.whiteColor,
//       //   useMaterial3: true,
//       //   highlightColor: Colors.transparent,
//       //   splashColor: Colors.transparent,
//       //   focusColor: Colors.transparent,
//       //   appBarTheme: AppBarThemeData(
//       //
//       //     backgroundColor: Colors.white
//       //   ),
//       //   textSelectionTheme: TextSelectionThemeData(
//       //     selectionHandleColor: CustomAppColors.primaryColor,
//       //   ),
//       //   colorScheme: ColorScheme.fromSeed(
//       //     seedColor: CustomAppColors.primaryColor,
//       //   ),
//       //
//       // ),
//       // darkTheme: ThemeData(
//       //   fontFamily: 'IBM Plex Sans',
//       //   scaffoldBackgroundColor: CustomAppColors.black_232323,
//       //   useMaterial3: true,
//       //   highlightColor: Colors.transparent,
//       //   splashColor: Colors.transparent,
//       //   focusColor: Colors.transparent,
//       //
//       //   appBarTheme: AppBarThemeData(
//       //
//       //       backgroundColor: CustomAppColors.black_232323
//       //   ),
//       //   textSelectionTheme: TextSelectionThemeData(
//       //     selectionHandleColor: CustomAppColors.primaryColor,
//       //   ),
//       //   colorScheme: ColorScheme.fromSeed(
//       //     seedColor: CustomAppColors.primaryColor,
//       //   ),
//       // ),
//       home: SplashFirst(),
//     );
//   }
// }
