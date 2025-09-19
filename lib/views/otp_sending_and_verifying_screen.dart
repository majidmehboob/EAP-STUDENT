import 'dart:async';
import 'package:eap_student/Widgets/scaffold_first.dart';
import 'package:eap_student/widgets/scaffold_second.dart';
import 'package:flutter/material.dart';

import '../constants/const.dart';
import '../widgets/custom_textformfield.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_inkwell.dart';


class OTPSendingAndVerificationScreen extends StatefulWidget {
  const OTPSendingAndVerificationScreen({
    super.key,
    // required this.emailController,
    // required this.confirmPasswordController,
    // required this.passwordController,
    // required this.nameController,
    // required this.mobileNumberController,
  });

  // final TextEditingController emailController;
  // final TextEditingController nameController;
  // final TextEditingController passwordController;
  // final TextEditingController confirmPasswordController;
  // final TextEditingController mobileNumberController;

  @override
  State<OTPSendingAndVerificationScreen> createState() =>
      _OTPSendingAndVerificationScreenState();
}

class _OTPSendingAndVerificationScreenState
    extends State<OTPSendingAndVerificationScreen> {
  final List<TextEditingController> otpControllers =
  List.generate(6, (_) => TextEditingController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isAccountCreation = false;
  bool otpSent = false;
  int secondsRemaining = 59;

  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (mounted) {
        setState(() {
          if (secondsRemaining > 0) {
            secondsRemaining--;
          } else {
            t.cancel();
          }
        });
      } else {
        t.cancel();
      }
    });
  }

  // Future<void> verifyOTP() async {
  //   String enteredOTP =
  //   otpControllers.map((controller) => controller.text).join();
  //
  //   if (enteredOTP.isEmpty || enteredOTP.length < 6) {
  //     // CustomToast.showToast(message: "Enter a valid 6-digit OTP");
  //     return;
  //   }
  //
  //   setState(() {
  //     isAccountCreation = true;
  //   });
  //
  //   if (AppSharedPreferences.getOTPCode() == enteredOTP &&
  //       DateTime.now().isBefore(
  //         DateTime.parse(AppSharedPreferences.getExpOTPTime() ??
  //             DateTime.now().toString())
  //             .add(const Duration(minutes: 5)),
  //       )) {
  //     CustomToast.showToast(
  //       message: "OTP verified successfully and account creating Please Wait...",
  //       bgColor: CustomAppColors.greenAppColor,
  //     );
  //
  //     bool accountCreated = await SignUpCTR().signUp(
  //       name: widget.nameController.text,
  //       username: widget.emailController.text,
  //       email: widget.emailController.text,
  //       password: widget.passwordController.text,
  //       confirmPassword: widget.confirmPasswordController.text,
  //       mobileNumber: widget.mobileNumberController.text,
  //       token: "",
  //     );
  //
  //     if (accountCreated) {
  //       CustomToast.showToast(
  //         message: 'Account created successfully',
  //         bgColor: CustomAppColors.greenAppColor,
  //       );
  //
  //       setState(() {
  //         isAccountCreation = false;
  //       });
  //
  //       Navigator.of(context).pushAndRemoveUntil(
  //         MaterialPageRoute(
  //           builder: (context) => SignInScreen(),
  //           settings:
  //           const RouteSettings(name: ConstStrings.scaffoldRouteName),
  //         ),
  //             (Route<dynamic> route) => false,
  //       );
  //       return;
  //     }
  //   } else {
  //     CustomToast.showToast(message: "Invalid OTP or expired");
  //   }
  //
  //   setState(() {
  //     isAccountCreation = false;
  //   });
  // }

  @override
  void dispose() {
    timer?.cancel();
    for (var controller in otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return CustomScaffoldFirst(
      showAppBar: true,
     leading: CustomInkwell(

       onTap: () {
       Navigator.pop(context);
       },
       child: const Padding(
         padding: EdgeInsets.all(8.0), // better touch area
         child: Icon(Icons.arrow_back, color: Colors.black),
       ),

     ),
      mainbody:
          SingleChildScrollView(child: Form(
            key: formKey,
            child: Padding(
              // padding: EdgeInsets.zero,
              padding: const EdgeInsets.fromLTRB(20.0,25.0,20.0,20.0),
              child: Column(

                children: [

                  Text("Enter the OTP",style: CustomTextStyles.text28BlackBold,),
                  const SizedBox(height: 4),
                  Text("We have sent a 5 digit verification code to student.example@email.com",style: CustomTextStyles.text16GreyA0A0A0W600,textAlign: TextAlign.center,),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(5, (index) {
                      return otpField(otpControllers[index]);
                    }),
                  ),


                  const SizedBox(height: 80),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Didn’t receive the verification code.",
                            style: CustomTextStyles.text14GreyA0A0A0W500,
                          ),
                          secondsRemaining == 0
                              ? CustomInkwell(
                            isCircle: false,
                            onTap: () {
                              setState(() {
                                secondsRemaining = 59;
                                startTimer();
                              });
                            },
                            child: Text(
                              "Resend",
                              style: CustomTextStyles.text14GreyA0A0A0W500.copyWith(color: CustomAppColors.primaryColor),
                            ),
                          )
                              : Text(
                            "00 : $secondsRemaining",
                            style: CustomTextStyles.text14GreyA0A0A0W500,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      CustomButtonWidget(
                          btntext: "Verify",
                          isReverse: false,
                          btnonPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (_) => const CustomScaffold()),
                                  (Route<dynamic> route) => false,
                            );

                          }
                        // btnonPressed: verifyOTP,
                      ),

                    ],
                  ),



                ],
              ),
            ),
          ),)
    );
  }

  TextFormFieldCustomerBuilt otpField(TextEditingController controller) {
    return TextFormFieldCustomerBuilt(
      onChangeTextField: (s) {
        if (s.length == 1) {
          FocusScope.of(context).nextFocus();
        }
      },
      isOTP: true,
      isNumber: true,
      textInputType: TextInputType.number,
      controller: controller,
      textStyle: CustomTextStyles.text24GreyBold,
    );
  }
}

