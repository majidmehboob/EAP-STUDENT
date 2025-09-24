import 'package:eap_student/constants/const.dart';
import 'package:flutter/material.dart';

import '../widgets/scaffold_second.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      titleCentr: "EAP Tutorials",
      mainBody: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Image.asset("assets/images/tutorial.png", width: 128, height: 128),
          SizedBox(height: 20),
          Text(
            "Getting Started with the App",
            style: CustomTextStyles.text20DarkLight700,
          ),
          SizedBox(height: 4),
          Text(
            "Learn the basics of navigating and using the app's core features.",
            style: CustomTextStyles.text16Grey73ToC0400,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "More Tutorials",
                style: CustomTextStyles.text20DarkLight700,
              ),

              tutorialContainer(
                "Getting Started with the App",
                "Learn the basics of navigating and using the app's core features.",
              ),
              tutorialContainer(
                "Mastering Practice Questions",
                "Dive deep into effective strategies for answering practice questions.",
              ),
              tutorialContainer(
                "Understanding Your Progress Reports",
                "How to interpret your performance analytics and identify areas for improvement.",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget tutorialContainer(String title, String description) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: CustomAppColors.greyF7To2E,
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: CustomAppColors.greyD9To4C,
            ),
            child: ImageIcon(
              AssetImage("assets/icons/play.png"),
              size: 20,
              color: CustomAppColors.grey73ToC0,
            ),
          ),
          SizedBox(width: 12,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: CustomTextStyles.text16DarkLightW500),
                Text(
                  description,
            
                  style: CustomTextStyles.text16Grey73ToC0400,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
