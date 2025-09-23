import 'package:eap_student/widgets/customContainer.dart';
import 'package:flutter/material.dart';

import '../constants/const.dart';
import '../widgets/custom_button.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headingRow("Student Test Pack", true),

          Container(
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: CustomAppColors.lightOrangeColor,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset("assets/images/test_pack.png", width: 75),
                    SizedBox(width: 12),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Premium Test Pack",
                          style: CustomTextStyles.text18PrimaryBold,
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            ImageIcon(
                              AssetImage("assets/icons/credits.png"),
                              color: CustomAppColors.greyColor,
                            ),
                            SizedBox(width: 12),
                            Text(
                              "Available Credits",
                              style: CustomTextStyles.text14GreyW400,
                            ),
                            SizedBox(width: 1),
                            Text(": 50", style: CustomTextStyles.text14GreyW600),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            ImageIcon(
                              AssetImage("assets/icons/calender.png"),
                              color: CustomAppColors.greyColor,
                            ),
                            SizedBox(width: 12),
                            Text(
                              "Expires: 2024-12-31",
                              style: CustomTextStyles.text14GreyW400,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 12),
                CustomButtonWidget(
                  btntext: 'Buy/Top-Up',
                  isReverse: false,
                  btnonPressed: () {},
                ),
              ],
            ),
          ),

          SizedBox(height: 28),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 155,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                sessionContainer(
                  CustomAppColors.blueCETo68,
                  "Start a new Test \nsession?",
                ),
                SizedBox(width: 12),
                sessionContainer(
                  CustomAppColors.pinkLightToC9,
                  "Start resume quiz  \nsession?",
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          headingRow("Courses Quiz", false),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomContainer(
                      txtAlgn: TextAlign.left,
                      txt: "English",
                      bg: CustomAppColors.pinkFFEFE2ToFFD1AB,
                      icnName: "english",
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: CustomContainer(
                      txtAlgn: TextAlign.left,
                      txt: "Math",
                      bg: CustomAppColors.orangelightToFF6905,
                      icnName: "math",
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: CustomContainer(
                      txtAlgn: TextAlign.left,
                      txt: "Computer",
                      bg: Color(0xFFCEECFE),
                      icnName: "computer",
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: CustomContainer(
                      txtAlgn: TextAlign.left,
                      txt: "Science",
                      bg: Color(0xFFEDFFD7),
                      icnName: "science",
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          headingRow("Preparation Test", true),
          testInfoContainer(
            "Mathematics - Chapter Test",
            "Score: 85/100",
            "CBSE",
            "1 hour",
            "Medium",
            "October 26th, 2023 at 10:30 am",
          ),
          headingRow('Subject Mastery', false),
          slideSubjectContainer("Physics", "75%", CustomAppColors.lightBlueColor),
          slideSubjectContainer(
            "Chemistry",
            "65%",
            CustomAppColors.lightYellowFFEA7E,
          ),
          slideSubjectContainer(
            "Mathematics",
            "85%",
            CustomAppColors.lightPinkFFD1AB,
          ),
          slideSubjectContainer(
            "Biology",
            "50%",
            CustomAppColors.lightGreenBDFF6D,
          ),
        ],
      ),
    );
  }

  Widget sessionContainer(Color bgClr, String title) {
    return Container(
      width: 250,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: bgClr,
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: CustomTextStyles.text20PrimaryW700),
              CustomButtonWidget(
                btntext: "Get Started",
                isReverse: false,
                backgroundColor: CustomAppColors.orangeColor,
                btnTxtStyle: CustomTextStyles.text12WhiteW700,
                btnonPressed: () {},
                shrinkHeight: true,
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset("assets/images/start_session.png", height: 100),
          ),
        ],
      ),
    );
  }

  Widget headingRow(String title, bool isShowSeeAll) {
    return Container(
      margin: ConstValues.vertical12Padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: CustomTextStyles.text20DarkLight700),
          if (isShowSeeAll)
            Text("See all", style: CustomTextStyles.text14PrimaryToWhiteW500),
        ],
      ),
    );
  }

  Widget testInfoContainer(
    String title,
    String scorePoints,
    String board,
    String duration,
    String difficulty,
    String date,
  ) {
    return Container(
      margin: ConstValues.vertical12Padding,

      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: ConstValues.borderRadius,
        color: CustomAppColors.greyF1To2E,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(title, style: CustomTextStyles.text16DarkLight600),
              ),
              CustomButtonWidget(
                btntext: scorePoints,
                shrinkHeight: true,
                isReverse: true,
                btnonPressed: () {},
                backgroundColor: CustomAppColors.primaryColor,
                btnTxtStyle: CustomTextStyles.text12WhiteW600,
              ),
            ],
          ),
          SizedBox(height: 12),
          Text("Board: ${board}", style: CustomTextStyles.text14Grey73ToC0W500),
          SizedBox(height: 12),
          Row(
            children: [
              Text(
                "Duration: ${duration}",
                style: CustomTextStyles.text14Grey73ToC0W500,
              ),
              SizedBox(width: 62),
              Text(
                "Difficulty: ${difficulty}",
                style: CustomTextStyles.text14Grey73ToC0W500,
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              ImageIcon(
                AssetImage("assets/icons/calender.png"),
                color: CustomAppColors.grey73ToC0,
              ),
              SizedBox(width: 8.0),
              Text("${date}", style: CustomTextStyles.text14Grey73ToC0W500),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: CustomButtonWidget(
                  btntext: "Reviews",
                  shrinkHeight: true,
                  iconPath: "assets/icons/review.png",
                  isReverse: false,
                  btnonPressed: () {},
                  backgroundColor: CustomAppColors.blueF3ToB4,
                  iconColor: CustomAppColors.lightBlue00B8C8,
                  btnTxtStyle: CustomTextStyles.text14Blue00B8C8W600,
                ),
              ),

              SizedBox(width: 10),
              Expanded(
                child: CustomButtonWidget(
                  btntext: "Revision",
                  isReverse: false,
                  btnonPressed: () {},
                  iconPath: "assets/icons/revision.png",
                  backgroundColor: CustomAppColors.pinkLightToOrangeFFB584  ,
                  shrinkHeight: true,
                  iconColor: CustomAppColors.lightOrangeColor,
                  btnTxtStyle: CustomTextStyles.text14LightOrangeW600,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: CustomButtonWidget(
                  btntext: "Retake",
                  btnonPressed: () {},
                  iconPath: "assets/icons/repeat.png",
                  iconColor: CustomAppColors.primaryColor,
                  backgroundColor: CustomAppColors.blueLightToPurpleAAABD6 ,
                  isReverse: false,
                  shrinkHeight: true,
                  btnTxtStyle: CustomTextStyles.text14PrimaryW600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget slideSubjectContainer(String subject, String perentage, Color bgClr) {
    double PercentageValue =
        double.tryParse(perentage.replaceAll("%", "")) ?? 0.0;
    return Container(
      margin: ConstValues.vertical10Padding,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(subject, style: CustomTextStyles.text16DarkLightW500),

              Text(perentage, style: CustomTextStyles.text14DarkLightW500),
            ],
          ),
          Slider(
            activeColor: bgClr,
            min: 0,
            max: 100,
            value: PercentageValue.clamp(0, 100),
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
