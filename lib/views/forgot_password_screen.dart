import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Utils/providers.dart';
import '../Widgets/custom_button.dart';

import '../Widgets/custom_textformfield.dart';
import '../Widgets/scaffold_first.dart';
import '../constants/const.dart';
import '../widgets/custom_inkwell.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldFirst(
      showAppBar: true,
      leading: CustomInkwell(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.arrow_back,),
        ),
      ),
      mainbody: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Forgot Password',
                    style: CustomTextStyles.text28DarkLightBold,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Enter your registered email address and we’ll send you a link to reset your password.",
                    style: CustomTextStyles.text16GreyA0ToD9W600,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  TextFormFieldCustomerBuilt(
                    // isLoginPage: true,
                    isEmail: true,
                    textInputType: TextInputType.emailAddress,
                    controller: emailController,
                    hintTxt: "Enter your Email",
                    ontap: () {},
                  ),
                  SizedBox(height: 20),
                  CustomButtonWidget(
                    btntext: 'Get OTP',
                    isReverse: false,
                    btnonPressed: () async {
                      if (formKey.currentState!.validate()) {
                        // bool response=await sendOTPInInitStateForForgotPassword();
                        // if(response==true){
                        // Navigator.push(
                        //     context, ScreenNavigationSlide(page: OTPVerifyScreen(userEmail: emailController.text,isForgotPasswordOTP: true,)));
                        // CustomToast.showTopToast(context: context,
                        //     bgColor: CustomAppColors.successColor,
                        //     msg: "Please Enter the OTP code sent on \n${emailController.text}", iconName: "email");
                      } else {
                        // CustomToast.showTopToast(context: context, msg:'Email is invalid / does not exist', iconName:'warning');
                      }

                      // }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Future<bool> sendOTPInInitStateForForgotPassword() async {
  //   setState(() {
  //     Provider.of<OurProviderClass>(context, listen: false).showBlurEffectFirst(true);
  //   });
  //
  //
  //   bool result = await AuthController().sendOTPForgotPassword(
  //     context: context,
  //     email: emailController.text,
  //   );
  //
  //   setState(() {
  //     Provider.of<OurProviderClass>(context, listen: false).showBlurEffectFirst(false);
  //   });
  //
  //   return result;
  // }
}
