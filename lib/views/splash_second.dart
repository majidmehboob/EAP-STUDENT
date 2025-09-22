import 'package:eap_student/constants/const.dart';
import 'package:eap_student/views/signin_signup_screen.dart';
import 'package:eap_student/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme_manager.dart';
import '../widgets/custom_logo_design.dart';
import '../widgets/scaffold_first.dart';
import 'onboarding_screen.dart';

class SplashSecond extends StatefulWidget {
  const SplashSecond({super.key});

  @override
  State<SplashSecond> createState() => _SplashSecondState();
}

class _SplashSecondState extends State<SplashSecond> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffoldFirst(

      statusBarIconBrightness:Provider.of<ThemeManager>(context, listen: false).themeData == ThemeMode.dark?Brightness.light:Brightness.dark,
      showAppBar: false,
      isSplash: true,
      mainbody: Container(
          decoration:  BoxDecoration(

            image: DecorationImage(

              image: AssetImage('assets/backgrounds/splash_bg.png'),
              fit:BoxFit.contain,

            ),
          ),
          child: Column(
        children: [
          CustomLogo(isBlack: true, isShowBg:false),


          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomButtonWidget(
                  btntext: "Get Started",
                  isReverse: false,
                  btnonPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> OnboardingScreen()));
                  },
                ),
              ),
            ),
          ),
        ],
      ))
    );
  }
}
