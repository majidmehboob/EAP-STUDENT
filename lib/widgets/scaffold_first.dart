import 'package:eap_student/constants/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomScaffoldFirst extends StatelessWidget {
  final Color? backgroundColor;
  final Widget mainbody;
  final bool? showAppBar;
  final bool? isSplash;
  final Color? statusBarColor;
  final Brightness? statusBarIconBrightness;
  final Widget? leading;
  final List<Widget>? actions;
  const CustomScaffoldFirst({
    super.key,
    this.isSplash = false,
    // this.
     this.backgroundColor,
    this.statusBarColor,
    this.statusBarIconBrightness,
    this.leading,
    this.actions,
    required this.mainbody,
    this.showAppBar = true,

  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        // statusBarColor: statusBarColor ??Colors.transparent,
        // statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: statusBarIconBrightness ?? Brightness.dark, // default white icons
      ),
    );
    return Scaffold(

      // backgroundColor: backgroundColor??Theme.of(context).scaffoldBackgroundColor,
      appBar: showAppBar == true
          ? AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        leading: leading != null
            ? Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: leading,
        )
            : null,
        actions: actions
            ?.map((action) => Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: action,
        ))
            .toList() ??
            [],
        elevation: 0,
          )
          : null,
      body: isSplash == true?mainbody:SafeArea(child:mainbody),
    );
  }
}
