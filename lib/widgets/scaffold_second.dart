import 'dart:developer';

import 'package:eap_student/constants/const.dart';
import 'package:eap_student/views/terms_conditions.dart';
import 'package:eap_student/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/providers.dart';
import '../views/notifications.dart';
import '../views/settings.dart';
import '../views/support.dart';
import 'custom_bottom_navbar.dart';
import 'custom_inkwell.dart';

class CustomScaffold extends StatefulWidget {
  final Widget? mainBody;

  final String? titleCentr;

  const CustomScaffold({super.key, this.mainBody,this.titleCentr});

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool isDark = false;
  final List<String> title = ["","Setup Your Test","Add The Test","History","Profile"];
  @override
  Widget build(BuildContext context) {
    int currentIndex= Provider.of<OurProviderClass>(context,listen: false).getIndex;
    double appheight = currentIndex ==0 ?88.0:76.0;

    return Scaffold(
      key: scaffoldKey,
      drawerScrimColor: Colors.transparent,
      drawer: CustomDrawer(),
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appheight),
        child: AppBar(
          centerTitle: currentIndex !=0?true:false,
          toolbarHeight: appheight,
          scrolledUnderElevation: 0,
          elevation: 0,
          actionsPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 0,
          ),
          automaticallyImplyLeading: false,
          backgroundColor: CustomAppColors.primaryColor,

          title:currentIndex ==0?
          Column(
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
          )
              :Text(widget.titleCentr?? title[currentIndex],style: CustomTextStyles.text24White600,),

          leading:!ModalRoute.of(context)!.isFirst
              ? CustomInkwell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                )
              : Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CustomInkwell(

                            color: CustomAppColors.grey_a0a0a0,
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      scaffoldKey.currentState?.openDrawer();
                    },

                    child:ImageIcon(
                      AssetImage("assets/icons/menue.png"),

                      color: CustomAppColors.grey_f5f5f5,
                    ),
                  ),
              ),
          actions: [
            CustomInkwell(
              radius: 20,
              color: CustomAppColors.grey_a0a0a0,
              onTap: (){},
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: const ImageIcon(
                  AssetImage("assets/icons/notifications.png"),
                  size: 28,
                  color: CustomAppColors.grey_f5f5f5,
                ),
              ),
            ),
            const SizedBox(width: 10),
            if(currentIndex==0)
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
                    drawerItemContainer(
                        title: "Notifications",
                        page: NotificationsScreen(),
                        iconPath: "notifications"),
                    drawerItemContainer(
                        title: "History",
                        onTap: (){Provider.of<OurProviderClass>(context,listen: false).changeBottomNavBarIndex(3);},
                        iconPath: "history"),
                    drawerItemContainer(
                        title: "Tutorials",
                        iconPath: "tutorials"),
                    drawerItemContainer(
                        title: "Settings",
                        page: SettingsScreen(),
                        iconPath: "settings"),
                    drawerItemContainer(
                      page: SupportScreen(),
                        title: "Support",
                        iconPath: "contact_support"),
                    drawerItemContainer(
                      page: TermsConditionsScreen(),
                      title: "Terms & Conditions",
                      iconPath: "term_and_conditions",
                    ),
                  ],
                ),
              ),

              drawerItemContainer(
                title: "Theme",
               iconPath:  "light_mode",
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




class drawerItemContainer extends StatefulWidget {
  final String title;
  final String iconPath;
  final Color? iconColor;
  final VoidCallback? onTap;
  final Widget? page;
  final Widget? trailing;
  const drawerItemContainer({super.key,this.iconColor,this.onTap, this.page,required this.title,this.trailing, required this.iconPath});

  @override
  State<drawerItemContainer> createState() => _drawerItemContainerState();
}

class _drawerItemContainerState extends State<drawerItemContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: CustomInkwell(
        isCircle: false,
        onTap: () {

          // Run custom onTap if provided
          widget.onTap?.call();

          // Navigate if a page is provided
          if (widget.page != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => widget.page!),
            );
          }
        },
        child: Row(
          children: [
            ImageIcon(
              AssetImage("assets/icons/${widget.iconPath}.png"),
              color: widget.iconColor ?? CustomAppColors.grey_a0a0a0,
              size: 26,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(widget.title, style: CustomTextStyles.text16GreyA0A0A0W500),
            ),
             (widget.trailing != null) ? widget.trailing! : const SizedBox(),

          ],
        ),
      ),
    );
  }
}
