

import 'package:eap_student/constants/const.dart';
import 'package:eap_student/views/otp_sending_and_verifying_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_textformfield.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isAccountExisting = false;
  bool isLoading = false;

  void _checkPasswordsMatch() {
    if (passwordController.text != confirmPasswordController.text) {
      formKey.currentState?.validate(); // Trigger validation
    }
  }

  @override
  void dispose() {
    super.dispose();
    confirmPasswordController.removeListener(_checkPasswordsMatch);
  }

  @override
  void initState() {
    super.initState();
    confirmPasswordController.addListener(_checkPasswordsMatch);
  }

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
                  Text("Create your account", style: CustomTextStyles.text28DarkLightBold),
                  const SizedBox(height: 4),
                  Text("Sign up to organize, draft, and deliver with ease.!", style: CustomTextStyles.text16GreyA0ToD9W600, textAlign: TextAlign.center,),
                  const SizedBox(height: 12),
                  TextFormFieldCustomerBuilt(
                    topLable: 'Full Name',
                    prefixIcon: 'email',
                    textInputType: TextInputType.name,
                    controller: nameController,
                    hintTxt: "Enter full name...",
                    ontap: () {},
                  ),
                  TextFormFieldCustomerBuilt(
                    topLable: 'Phone Number',
                    prefixIcon: 'mobile',
                    textInputType: TextInputType.phone,
                    addBottomMargin: true,
                    controller: mobileNumberController,
                    hintTxt: "+92 XXX XXXXXXX",
                    ontap: () {},
                  ),
                  TextFormFieldCustomerBuilt(
                    topLable: 'Email',
                    isEmail: true,
                    prefixIcon: 'email',
                    textInputType: TextInputType.emailAddress,
                    controller: emailController,
                    hintTxt: "Enter your email...",
                    ontap: () {},
                  ),
                  TextFormFieldCustomerBuilt(
                    topLable: "Password",
                    obscText: true,
                    showEyeIcon: true,
                    prefixIcon: 'lock',
                    textInputType: TextInputType.text,
                    addBottomMargin: true,
                    controller: passwordController,
                    hintTxt: "*******",
                    ontap: () {},
                  ),
                  TextFormFieldCustomerBuilt(
                    topLable: 'Confirm Password',
                    obscText: true,
                    showEyeIcon: true,
                    prefixIcon: 'lock',
                    textInputType: TextInputType.text,
                    controller: confirmPasswordController,
                    hintTxt: "*******",
                    ontap: () {},
                  ),

                  const SizedBox(height: 20),
                  CustomButtonWidget(
                    btntext: 'Sign Up',
                    isReverse: false,
                    btnonPressed: () =>
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OTPSendingAndVerificationScreen()),
                        ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),


        if (MediaQuery.of(context).viewInsets.bottom == 0)
            Padding(
              padding: const EdgeInsets.only(top:10,bottom: 20),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: CustomTextStyles.text14GreyA0A0A0W500,
                  children: [
                    const TextSpan(text: "By signing up, you agree to the "),
                    TextSpan(
                      text: "Terms of service",
                      style: CustomTextStyles.text14GreyA0A0A0W500.copyWith(
                        color: CustomAppColors.primaryToWhite,
                        decoration: TextDecoration.underline,


                      ),
                    ),
                    const TextSpan(text: " and "),
                    TextSpan(
                      text: "Privacy policy.",
                      style: CustomTextStyles.text14GreyA0A0A0W500.copyWith(
                        color: CustomAppColors.primaryToWhite,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),

      ],
    );
  }
}