import 'package:flutter/material.dart';

import '../constants/const.dart';
import '../widgets/scaffold_second.dart';
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      titleCentr: "Settings",
      mainBody: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                child: Image.asset(
                  "assets/images/user.png",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Kristin Watson",
                    style: CustomTextStyles.text20DarkLight700,
                  ),

                  Text(
                    "alexmorgan@gmail.com",
                    style: CustomTextStyles.text14GreyW500,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Text("Settings",style: CustomTextStyles.text20DarkLight700,),
          rightArrowContiner(),
        ],
      ),
    );
  }
  Widget rightArrowContiner(){
    return Container(
      padding: EdgeInsets.all(12),
      margin:ConstValues.vertical12Padding,
      decoration: BoxDecoration(
        color: CustomAppColors.greyF1To2E,
        borderRadius: ConstValues.borderRadius,

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ImageIcon(AssetImage("assets/icons/settings.png")),
          Text("Manage Notifications",style: CustomTextStyles.text14GreyA0ToC0W500),

          Icon(Icons.arrow_forward_ios,color: CustomAppColors.grey_a0a0a0,size: 16,)

        ],
      ),
    );
  }
}
