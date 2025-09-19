import 'package:eap_student/constants/const.dart';
import 'package:eap_student/views/splash_second.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_logo_design.dart';
import '../widgets/scaffold_first.dart';

class SplashFirst extends StatefulWidget {
  const SplashFirst({super.key});

  @override
  State<SplashFirst> createState() => _SplashFirstState();
}

class _SplashFirstState extends State<SplashFirst>
    with SingleTickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );

    // Delay the fade-in until background animation completes
    Future.delayed(const Duration(milliseconds: 1000), () {
      _fadeController.forward();
    });

    Future.delayed(Duration(seconds: 4), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SplashSecond()),
      );
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldFirst(
      showAppBar: false,
      isSplash: true,
      statusBarIconBrightness: Brightness.light,
      mainbody: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.2, end: 1.2),
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
        builder: (context, value, child) {
          return Stack(
            children: [
              ClipPath(
                clipper: DiagonalClipper(value),
                child: Container(color: CustomAppColors.primaryColor),
              ),
              FadeTransition(
                opacity: _fadeAnimation,
                child: Column(
                  children: [
                    CustomLogo(),

                    // Bottom RichText
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),

                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            "Ready to get top scores on your Test? We're \n with you every step of the way!",
                            style: CustomTextStyles.text16White600,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class DiagonalClipper extends CustomClipper<Path> {
  final double progress;
  DiagonalClipper(this.progress);

  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, size.height);
    path.lineTo(0, size.height - (size.height * progress));
    path.lineTo(
      size.width,
      size.height - (size.height * (progress - 0.2)).clamp(0, size.height),
    );
    path.lineTo(size.width, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant DiagonalClipper oldClipper) {
    return oldClipper.progress != progress;
  }
}
