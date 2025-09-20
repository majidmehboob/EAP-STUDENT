import 'package:eap_student/constants/const.dart';
import 'package:eap_student/views/signin_screen.dart';
import 'package:eap_student/views/signup_screen.dart';
import 'package:eap_student/widgets/custom_tabbar.dart';
import 'package:eap_student/widgets/scaffold_first.dart';
import 'package:flutter/material.dart';

class SigninSignupScreen extends StatefulWidget {
  const SigninSignupScreen({super.key});

  @override
  State<SigninSignupScreen> createState() => _SigninSignupScreenState();
}

class _SigninSignupScreenState extends State<SigninSignupScreen> {
  int selectedIndex = 0;


  @override
  Widget build(BuildContext context) {

    return
    CustomScaffoldFirst(

        showAppBar: false,
        mainbody:
        Padding(

            padding:   EdgeInsets.fromLTRB(20.0,25.0,20.0,4.0),

        child: CustomTabBar(tabLength: 2,
            tabBarViewLst:
            [
              SigninScreen(),
              SignUpScreen()
            ]
            , tabsLst:
            [
              Text("Login"),
              Text("Sign Up"),
            ]
        )
      // Padding(
      //   padding: const EdgeInsets.fromLTRB(20.0,25.0,20.0,4.0),
      //   child: Column(
      //     children: [
      //       // Toggle Buttons
      //       Container(
      //         padding: const EdgeInsets.all(8),
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(8),
      //           border: Border.all(color: CustomAppColors.lightGreyColor),
      //           color: Colors.transparent,
      //         ),
      //         child: Row(
      //           children: [
      //             Expanded(
      //               child: _buildToggleButton(
      //                 title: "Login",
      //                 index: 0,
      //               ),
      //             ),
      //             const SizedBox(width: 10),
      //             Expanded(
      //               child: _buildToggleButton(
      //                 title: "Sign Up",
      //                 index: 1,
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       const SizedBox(height: 20),
      //
      //       // Show different pages depending on selectedIndex
      //       Expanded(
      //         child: selectedIndex == 0
      //             ? const SigninScreen()
      //             : SignUpScreen()
      //       ),
      //     ],
      //   ),
      // ),
    ),);
  }


  Widget _buildToggleButton({required String title, required int index}) {
    final bool isSelected = selectedIndex == index;
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedIndex = index;
        });
      },
      style: ElevatedButton.styleFrom(
        splashFactory: NoSplash.splashFactory,
        minimumSize: const Size(double.infinity, 48),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: isSelected
            ? CustomAppColors.primaryColor // active → primary
            : CustomAppColors.lightWhiteColor, // inactive → grey
      ),
      child: Text(
        title,
        style: isSelected
            ? CustomTextStyles.text20White600 // white text on active
            : CustomTextStyles.text20Grey600, // black text on inactive
      ),
    );
  }
}
