import 'dart:developer';

import 'package:eap_student/constants/const.dart';
import 'package:eap_student/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/providers.dart';
import 'custom_bottom_navbar.dart';
import 'custom_inkwell.dart';
import 'package:eap_student/views/add.dart';
import 'package:eap_student/views/dashboard.dart';
import 'package:eap_student/views/history.dart';
import 'package:eap_student/views/quiz.dart';
import 'package:eap_student/views/user.dart';
class CustomScaffold extends StatefulWidget {
  final Widget? mainBody;
  final double? appBarHeight;

  const CustomScaffold({super.key, this.mainBody, this.appBarHeight = 88});

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    double appheight = Provider.of<OurProviderClass>(context,listen: false).getIndex ==0 ?88.0:56.0;
    return Scaffold(
      key: scaffoldKey,
      drawerScrimColor: Colors.transparent,
      drawer: CustomDrawer(),
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appheight),
        child: AppBar(
          toolbarHeight: appheight,
          scrolledUnderElevation: 0,
          elevation: 0,
          actionsPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 0,
          ),
          automaticallyImplyLeading: false,
          backgroundColor: CustomAppColors.primaryColor,

          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Hi, Kristin", style: CustomTextStyles.text24White600),
              const SizedBox(height: 4),
              Text(
                "Let’s start learning",
                style: CustomTextStyles.text14WhiteW400,
              ),
            ],
          ),

          leading:!ModalRoute.of(context)!.isFirst
              ? CustomInkwell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(0.0), // better touch area
                      child: Icon(Icons.arrow_back, color: Colors.black),
                    ),
                  ),
                )
              : CustomInkwell(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    scaffoldKey.currentState?.openDrawer();
                  },
                  child: ImageIcon(
                    AssetImage("assets/icons/menue.png"),
                    size: 12,
                    color: CustomAppColors.grey_f5f5f5,
                  ),
                ),
          actions: [
            const ImageIcon(
              AssetImage("assets/icons/notifications.png"),
              size: 28,
              color: CustomAppColors.grey_f5f5f5,
            ),
            const SizedBox(width: 10),
            Image.asset("assets/images/Avatar.png", width: 40, height: 40),
          ],
        ),
      ),

      body:

          IndexedStack(
            index:Provider.of<OurProviderClass>(context).getIndex,
            children: AppScreens().screenLst,
          ),
      bottomNavigationBar: CustomBottomNavBar(
        onItemTapped: (index) {

          Provider.of<OurProviderClass>(
            context,
            listen: false,
          ).changeBottomNavBarIndex(index);
        },
      ),
    );
  }
}

//--------------------------------[ 🎍 Custom Drawer ] ----------------------------------//

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Drawer(
        width: MediaQuery.sizeOf(context).width * 0.75,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        elevation: 10,
        backgroundColor: CustomAppColors.whiteColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              Expanded(
                child: Column(
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
                              style: CustomTextStyles.text20Black700,
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
                    Divider(color: CustomAppColors.lightGreyColor),
                    SizedBox(height: 12),
                    drawerItemContainer("Notifications", "notifications"),
                    drawerItemContainer("History", "history"),
                    drawerItemContainer("Tutorials", "tutorials"),
                    drawerItemContainer("Settings", "settings"),
                    drawerItemContainer("Support", "contact_support"),
                    drawerItemContainer(
                      "Terms & Conditions",
                      "term_and_conditions",
                    ),
                  ],
                ),
              ),

              drawerItemContainer(
                "Theme",
                "light_mode",
                iconColor: CustomAppColors.greyColor,
                trailing: Switch(
                  trackOutlineColor: WidgetStatePropertyAll(
                    CustomAppColors.grey_a0a0a0,
                  ),
                  inactiveTrackColor: CustomAppColors.grey_a0a0a0,
                  inactiveThumbColor: CustomAppColors.whiteColor,
                  value: isDark,
                  onChanged: (value) => setState(() {
                    isDark = true;
                  }),
                ),
              ),

              SizedBox(height: 4),
              CustomButtonWidget(
                btnTxtStyle: CustomTextStyles.text18WhiteBold,
                btntext: "Logout",
                isReverse: false,
                btnonPressed: () {},
                iconPath: "assets/icons/logout.png",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget drawerItemContainer(
  String title,
  String iconPath, {
  Color? iconColor,
  Widget? trailing,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: CustomInkwell(
      onTap: () {},
      child: Row(
        children: [
          ImageIcon(
            AssetImage("assets/icons/${iconPath}.png"),
            color: iconColor ?? CustomAppColors.grey_a0a0a0,
            size: 26,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(title, style: CustomTextStyles.text16GreyA0A0A0W500),
          ),
          if (trailing != null) trailing,
        ],
      ),
    ),
  );
}
