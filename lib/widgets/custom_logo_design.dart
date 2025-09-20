import 'package:flutter/material.dart';

import '../constants/const.dart';

class CustomLogo extends StatefulWidget {
  final bool? isBlack;
  final bool? isShowBg;
  const CustomLogo({super.key, this.isBlack = false, this.isShowBg = false});

  @override
  State<CustomLogo> createState() => _CustomLogoState();
}

class _CustomLogoState extends State<CustomLogo> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final logoWidth = 150.0; //size.width * 0.45;
    final logoHeight = 150.0; //logoWidth * 0.85;
    return Expanded(
      child: Container(
        // decoration: widget.isShowBg == true
        //     ? BoxDecoration(
        //         image: DecorationImage(
        //           image: AssetImage('assets/backgrounds/splash_bg.png'),
        //           fit: BoxFit.cover,
        //
        //         ),
        //       )
        //     : null,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: "logo",

                child: Image.asset(
                  'assets/logos/Score_Up_512.png',
                  width: logoWidth,
                  height: logoHeight,
                  fit: BoxFit.contain,
                ),
              ),

              SizedBox(height: 12),
              Text(
                "ScoreUp",
                style: widget.isBlack == true
                    ? CustomTextStyles.title32DarkLightBold
                    : CustomTextStyles.title32White,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
