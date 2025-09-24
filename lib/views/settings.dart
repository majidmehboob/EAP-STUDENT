

import 'package:eap_student/Widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/const.dart';
import '../theme/theme_manager.dart';
import '../widgets/scaffold_second.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      titleCentr: "Settings",
      mainBody: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

              CustomButtonWidget(
                btntext: "Edit Profile",
                backgroundColor: Color(0xFFE0EFF7),
                btnTxtStyle: CustomTextStyles.text14PrimaryW600,
                isReverse: false,
                btnonPressed: () {},
                shrinkHeight: true,
              ),
            ],
          ),
          SizedBox(height: 20),
          Text("Settings", style: CustomTextStyles.text20DarkLight700),
          rightArrowContainer("settings", "Manage Notifications"),
          rightArrowContainer(
            "light_mode",
            "Theme",
            switchableWidget: Switch(
              trackOutlineColor: WidgetStatePropertyAll(Colors.transparent),
              inactiveTrackColor: CustomAppColors.grey_a0a0a0,
              inactiveThumbColor: CustomAppColors.whiteColor,
              activeThumbColor: CustomAppColors.whiteColor,
              activeTrackColor: CustomAppColors.primaryColor,
              value:
                  Provider.of<ThemeManager>(context, listen: false).themeData ==
                  ThemeMode.dark,
              onChanged: (value) {
                Provider.of<ThemeManager>(
                  context,
                  listen: false,
                ).toggleTheme(value);
                setState(() {});
              },
            ),
          ),
          SizedBox(height: 20),
          Text("Help & Support", style: CustomTextStyles.text20DarkLight700),
          rightArrowContainer("notifications", "FAQ’s"),
          rightArrowContainer("contact_support_2", "Contact Support"),
          rightArrowContainer("terms_and_conditions_2", "Terms & Policy"),
          SizedBox(height: 20),
          Text("Account", style: CustomTextStyles.text20DarkLight700),
          rightArrowContainer("logout", "Logout"),
          rightArrowContainer("delete", "Delete Account"),
        ],
      ),
    );
  }

  Widget rightArrowContainer(
    String iconName,
    String title, {
    Widget? switchableWidget,
  }) {
    return Container(
      height: 52,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        color: CustomAppColors.greyF1To2E,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ImageIcon(
                AssetImage("assets/icons/${iconName}.png"),
                color: CustomAppColors.grey73ToC0,
                size: 24,
              ),
              const SizedBox(width: 12),
              Text(title, style: CustomTextStyles.text16Grey73ToC0600),
            ],
          ),
          (switchableWidget != null)
              ? switchableWidget
              : Icon(
                  Icons.arrow_forward_ios,
                  color: CustomAppColors.grey73ToC0,
                  size: 16,
                ),
        ],
      ),
    );
  }
}
