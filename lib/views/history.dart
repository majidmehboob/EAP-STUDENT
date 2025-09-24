import 'package:eap_student/constants/const.dart';
import 'package:eap_student/views/revision_quiz.dart';
import 'package:eap_student/widgets/custom_inkwell.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Utils/providers.dart';
import '../widgets/scaffold_second.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        subjectContainer(
          "Physics",
          85,
          "Objective",
          25,
          "October 26th, 2023 at 10:30 am",
          () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => RevisionQuizScreen()),
            );
          },
        ),
      ],
    );
  }

  Widget subjectContainer(
    String subjectName,
    int percentage,
    String typeofQuiz,
    int time,
    String dateTime,
    VoidCallback onTap,
  ) {
    return CustomInkwell(
      isCircle: false,
      radius: 0,
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.all(12.0),
        color: CustomAppColors.greyF7To2E,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(subjectName, style: CustomTextStyles.text20DarkLight700),
                Text(
                  '${percentage.toString()}%',
                  style: CustomTextStyles.text20DarkLight700,
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 6.0,
                  ),
                  decoration: BoxDecoration(
                    color: CustomAppColors.primaryColor,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Text(
                    typeofQuiz,
                    style: CustomTextStyles.text16White600,
                  ),
                ),
                Text(
                  '${time.toString()} mints',
                  style: CustomTextStyles.text20Grey73ToC0600,
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ImageIcon(
                      AssetImage("assets/icons/calender.png"),
                      color: CustomAppColors.grey73ToC0,
                    ),
                    SizedBox(width: 8.0),
                    Text(dateTime, style: CustomTextStyles.text16Grey73ToC0600),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: CustomAppColors.grey73ToC0,
                  size: 16,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
