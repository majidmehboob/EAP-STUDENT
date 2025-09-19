import 'package:eap_student/views/signin_signup_screen.dart';
import 'package:eap_student/widgets/customContainer.dart';
import 'package:eap_student/widgets/custom_inkwell.dart';
import 'package:flutter/material.dart';
import '../constants/const.dart';
import '../widgets/custom_button.dart';
import '../widgets/scaffold_first.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;


  final List<Widget> pages = [];

  @override
  void initState() {
    super.initState();

    // Initialize pages here
    pages.addAll([
      OnboardPage(
        imgName: "boarding_1",
        title: "AI Powered Interactive Test, Right at Your Fingertips",
        description:
        "Get ready for your Pakistan Board exams with our comprehensive, customizable tests — designed to assess your knowledge chapter by chapter",
      ),
      OnboardPage(
        imgName: "boarding_2",
        title: "Empower Your Test Prep",
        description:
        "Discover a suite of powerful features designed to streamline your studies and boost your scores.",
        extra: GridView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2.5,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
          ),
          children: [
            CustomContainer(txt: "AI-Powered Tests", bg: CustomAppColors.lightBlueColor, icnName: 'test'),
            CustomContainer(txt: "AI-Reasoning Lessons", bg: CustomAppColors.lightGreenColor, icnName: 'reasoning'),
            CustomContainer(txt: "Performance Analytics", bg: CustomAppColors.lightPink_FF8500F, icnName: 'analytics'),
            CustomContainer(txt: "Expert Support", bg: CustomAppColors.lightOrangeColor, icnName: 'support'),
          ],
        ),
      ),
      OnboardPage(
        imgName: "boarding_3",
        title: "Unlock the Power of AI",
        description:
        "Discover how our app revolutionizes learning with intelligent features.",
        extra:ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            CustomContainer(txt: "Intelligent Test Reasoning", bg: CustomAppColors.lightBlueColor, icnName: 'ai',txtAlgn: TextAlign.start),
            SizedBox(height: 12,),
            CustomContainer(txt: "Detailed Explanations", bg: CustomAppColors.lightPurpleColor, icnName: 'detail',txtAlgn: TextAlign.start),
            SizedBox(height: 12,),
            CustomContainer(txt: "Automated Paper Generation", bg: CustomAppColors.lightPink_FFEFE2, icnName: 'page_generate',txtAlgn: TextAlign.start),
          ]
        )
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldFirst(
      leading: currentPage == 0
          ? null
          : CustomInkwell(

            onTap: () {
              _pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0), // better touch area
              child: Icon(Icons.arrow_back, color: Colors.black),
            ),

      ),

      actions: [
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SigninSignupScreen()),
            );
          },
          child: Text(
            "Skip",
            style: CustomTextStyles.text16GreyW600,
          ),
        )
      ],
      showAppBar: true,
      mainbody:  Column(
          children: [

            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return pages[index];
                },
              ),
            ),

            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pages.length,
                    (index) => _buildDot(index),
              ),
            ),

            const SizedBox(height: 10),


           Padding(padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
           child:  CustomButtonWidget(
             btntext: currentPage == pages.length - 1
                 ? 'Start Now'
                 : 'Next',
             isReverse: false,
             btnonPressed: () {
               if (currentPage < pages.length - 1) {
                 _pageController.nextPage(
                   duration: const Duration(milliseconds: 300),
                   curve: Curves.easeInOut,
                 );
               } else {
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => SigninSignupScreen()),
                 );
               }
             },
           ),)
          ],
        ),

    );
  }

  // 🔹 Dot Widget
  Widget _buildDot(int index) {
    return Container(
      padding: EdgeInsets.all(currentPage == index ? 1 : 0),
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        border: currentPage == index
            ? Border.all(color: CustomAppColors.primaryColor)
            : null,
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        height: 10,
        width: 10,
        decoration: BoxDecoration(
          color: currentPage == index
              ? CustomAppColors.primaryColor
              : CustomAppColors.grey_Cccccc,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}


class OnboardPage extends StatelessWidget {
  final String imgName;
  final String title;
  final String description;
  final Widget? extra;

  const OnboardPage({
    super.key,
    required this.imgName,
    required this.title,
    required this.description,
    this.extra,
  });

  @override
  Widget build(BuildContext context) {
    return
       SingleChildScrollView(
         physics: BouncingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.fromLTRB(20.0,0,20.0,4.0),
            margin: EdgeInsets.symmetric(horizontal: 4),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/images/$imgName.png'),
              const SizedBox(height: 20),

              Text(
                title,
                textAlign: TextAlign.center,
                style: CustomTextStyles.text28BlackBold,
              ),
              const SizedBox(height: 8),

              Text(
                description,
                textAlign: TextAlign.center,
                style: CustomTextStyles.text16GreyW400,
              ),

              const SizedBox(height: 20),

              if (extra != null) extra!,
            ],
          ),)
       );
  }
}
