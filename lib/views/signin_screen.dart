import 'dart:io';

import 'package:eap_student/constants/const.dart';
import 'package:eap_student/views/signin_signup_screen.dart';
import 'package:eap_student/widgets/custom_inkwell.dart';

import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_textformfield.dart';
class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Welcome Back!",style: CustomTextStyles.text28BlackBold,),
            const SizedBox(height: 4),
            Text("Log in and take the next step toward excellence.",style: CustomTextStyles.text16GreyA0A0A0W600,textAlign: TextAlign.center,),
            SizedBox(height: 12),
            TextFormFieldCustomerBuilt(
              topLable: 'Email',
              prefixIcon: 'email',
              textInputType: TextInputType.emailAddress,
              controller: emailController,
              hintTxt: "abc@gmail.com",
              ontap: () {},
            ),
            TextFormFieldCustomerBuilt(
              topLable: 'Password',
              obscText: true,
              showEyeIcon: true,
              prefixIcon: 'lock',
              textInputType: TextInputType.text,
              addBottomMargin: true,
              controller: passwordController,
              hintTxt: "********",
              ontap: () {},
            ),
            SizedBox(height: 4),
          Align(
            alignment:Alignment.centerRight,
            child:CustomInkwell(
            isCircle: false,
          onTap: (){},
            child: Text("Forgot Password?",style:CustomTextStyles.text12PrimaryW600,)),
          ),
          SizedBox(height: 20),
            CustomButtonWidget(
          btntext: 'Login',
              isReverse: false,
              btnonPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SigninSignupScreen())),
            ),

            const SizedBox(height: 20),


            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: CustomAppColors.lightGreyColor,
                    thickness: 1,
                    endIndent: 10,
                  ),
                ),
                 Text(
                    "or Continue with",
                    style: CustomTextStyles.text14GreyA0A0A0W500,
                  ),
                Expanded(
                  child: Divider(
                    color: CustomAppColors.lightGreyColor,
                    thickness: 1,
                    indent: 10,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Platform.isAndroid?

                SocialMediaSignInContainer(
              text: 'Continue with Google',
              imagePath: 'google',
              onPressed: () {
                // signInWithGoogle();
              },
            )
                : SocialMediaSignInContainer(
              text: 'Continue with Apple',
              imagePath: 'mac',
              onPressed: () {
                // signInWithApple();
              },
            ),

            const SizedBox(height: 20),

            ImageIcon(AssetImage("assets/icons/faceid.png") ,size: 50, color: CustomAppColors.primaryColor,)



            // const SizedBox(height: 20),
            // bioMetricType.isEmpty
            //     ? Container()
            //     : GestureDetector(
            //   onTap: () async {
            //     await signInWithBiometric();
            //   },
            //   child: ImageIcon(
            //     bioMetricType.contains(BiometricType.face)
            //         ? const AssetImage("assets/icons/faceid.png")
            //         : const AssetImage(
            //         "assets/icons/fingerprint.png"),
            //     size: 50,
            //     color: CustomAppColors.greyColor,
            //   ),
            // ),





          ],
            ),
          ),
          ),
        ),
        SizedBox(height: 2,),
        if (MediaQuery.of(context).viewInsets.bottom == 0)
           Image.asset("assets/logos/itech_logo.png",height: 30)
      ],
    );

  }
}
class SocialMediaSignInContainer extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;
  final String text;

  const SocialMediaSignInContainer({
    Key? key,
    required this.imagePath,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

     height: 52,
       decoration:BoxDecoration(
         borderRadius: BorderRadius.circular(8),
         color: CustomAppColors.lightWhiteColor
       ),

      child :
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/$imagePath.png',
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: CustomTextStyles.text16GreyA0A0A0W400,
            ),
          ],
        ),
    );
  }
}