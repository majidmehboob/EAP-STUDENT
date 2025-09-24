import 'package:eap_student/constants/const.dart';
import 'package:flutter/material.dart';

import '../Widgets/custom_textformfield.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final emailController = TextEditingController();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final classController = TextEditingController();
  final cityController = TextEditingController();
  final birthController = TextEditingController();
  final boardController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Form(
            key: formKey,
            child: Column(
              children: [
                TextFormFieldCustomerBuilt(
                  backgroundColor: CustomAppColors.greyF1To2E,
                  borderColor: CustomAppColors.greyF1To2E,
                  topLable: 'Your Name',
                  textInputType: TextInputType.text,
                  addBottomMargin: true,
                  controller: nameController,
                  hintTxt: "John henry",
                  ontap: () {},
                ),
                TextFormFieldCustomerBuilt(
                  topLable: 'Email',
                  prefixIcon: 'email',
                  textInputType: TextInputType.emailAddress,
                  controller: emailController,
                  hintTxt: "abc@gmail.com",

                  ontap: () {},
                ),

                TextFormFieldCustomerBuilt(
                  topLable: 'Phone number',

                  textInputType: TextInputType.number,
                  controller: phoneController,
                  hintTxt: "+92 *** *******",

                  ontap: () {},
                ),
                TextFormFieldCustomerBuilt(
                  topLable: 'Class',

                  textInputType: TextInputType.text,
                  addBottomMargin: true,
                  controller: classController,
                  hintTxt: "Type/select",
                  ontap: () {},
                ),
                TextFormFieldCustomerBuilt(
                  topLable: 'City',

                  textInputType: TextInputType.text,
                  controller: cityController,
                  hintTxt: "Type/select",

                  ontap: () {},
                ),
                TextFormFieldCustomerBuilt(
                  topLable: 'Date of Birth',

                  textInputType: TextInputType.text,
                  addBottomMargin: true,
                  controller: birthController,
                  hintTxt: "DD/MM/YYYY",
                  ontap: () {},
                ),
                TextFormFieldCustomerBuilt(
                  topLable: 'Board',

                  textInputType: TextInputType.text,
                  controller: boardController,
                  hintTxt: "Type/select",

                  ontap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
