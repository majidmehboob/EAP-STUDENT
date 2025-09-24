import 'package:eap_student/Widgets/custom_button.dart';
import 'package:eap_student/constants/const.dart';
import 'package:flutter/material.dart';

import '../widgets/scaffold_second.dart';

class RevisionQuizScreen extends StatefulWidget {
  const RevisionQuizScreen({super.key});

  @override
  State<RevisionQuizScreen> createState() => _RevisionQuizScreenState();
}

class _RevisionQuizScreenState extends State<RevisionQuizScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      titleCentr: "Revision Test",
      isScrollAllow: true,
      mainBody: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          subjectContainer("Physics - Chapter 1: Kinematics", "4 flagged questions"),
          subjectContainer("Chemistry - Chapter 3: Solutions", "5 flagged questions"),
          subjectContainer("Biology - Chapter 5: Respiration", "3 flagged questions"),
          
        ],
      ),
      bottomWidget: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: CustomButtonWidget(
          btntext: "Start Revision Quiz",
          isReverse: false,
          btnonPressed: () {},
        ),
      ),
    );

  }

  Widget subjectContainer(String title,String description) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: CustomAppColors.greyF7To2E,
        borderRadius: BorderRadius.circular(8.0),

      ),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: CustomTextStyles.text20DarkLight700,),
          SizedBox(height: 12,),
          Text(description, style: CustomTextStyles.text16Grey73ToC0400,)

      ],
    ),
    );
  }
}
