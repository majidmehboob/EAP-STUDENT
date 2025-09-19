import 'package:flutter/material.dart';

import '../constants/const.dart';
import '../widgets/custom_button.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.fromLTRB(20, 20, 20, 6),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Student Test Pack",style: CustomTextStyles.text20Black700,),
                Text("See all",style: CustomTextStyles.text14WhiteW500,)
              ],
            ),
            SizedBox(height: 12,),
            Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: CustomAppColors.lightOrangeColor
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/test_pack.png",width: 75,),
                      SizedBox(width: 12,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Premium Test Pack",style: CustomTextStyles.text18PrimaryBold,),
                          SizedBox(height: 8,),
                          Row(children: [
                            ImageIcon(AssetImage("assets/icons/credits.png"),color: CustomAppColors.greyColor,),
                            SizedBox(width: 4,),
                            Text("Available Credits",style: CustomTextStyles.text14GreyW400,),
                            SizedBox(width: 1,),
                            Text(": 50",style: CustomTextStyles.text14GreyW600,),
                          ],),
                          SizedBox(height: 4,),
                          Row(children: [
                            ImageIcon(AssetImage("assets/icons/calender.png"),color: CustomAppColors.greyColor,),
                            SizedBox(width: 4,),
                            Text("Expires: 2024-12-31",style: CustomTextStyles.text14GreyW400,),

                          ],),
                        ],
                      )

                    ],
                  ),
                  SizedBox(height: 12,),
                  CustomButtonWidget(btntext: 'Buy/Top-Up', isReverse: false, btnonPressed: (){})
                ],
              ),
            ),
            SizedBox(height: 28,),
            Container(
              width: 249,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: CustomAppColors.lightBlueColor
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Start a new Test session?",style: CustomTextStyles.text20PrimaryW700,),

                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),);
  }
}
