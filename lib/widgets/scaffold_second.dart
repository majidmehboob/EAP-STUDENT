import 'dart:developer';

import 'package:eap_student/constants/const.dart';
import 'package:eap_student/views/terms_conditions.dart';
import 'package:eap_student/views/tutorial.dart';
import 'package:eap_student/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../theme/theme_manager.dart';
import '../utils/providers.dart';
import '../views/notifications.dart';
import '../views/settings.dart';
import '../views/support.dart';
import 'custom_bottom_navbar.dart';
import 'custom_inkwell.dart';

class CustomScaffold extends StatefulWidget {
  final Widget? mainBody;
  final Widget? bottomWidget;
  final String? titleCentr;
  final bool? isScrollAllow;


  const CustomScaffold({super.key, this.mainBody, this.titleCentr,this.isScrollAllow = true,  this.bottomWidget,});

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();



  @override
  Widget build(BuildContext context) {
    int currentIndex = Provider.of<OurProviderClass>(
      context,
      listen: false,
    ).getIndex;

    // Provider.of<ThemeManager>(context, listen: true);
    bool ishome = currentIndex == 0 && ModalRoute.of(context)!.isFirst;
    double appheight = ishome ? 88.0 : 76.0;

    return Scaffold(
      key: scaffoldKey,
      drawerScrimColor: Colors.transparent,
      drawer: CustomDrawer(),
      // resizeToAvoidBottomInset: false,

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appheight),
        child: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
          ),
          centerTitle: currentIndex != 0 || !ModalRoute.of(context)!.isFirst ? true : false,
          toolbarHeight: appheight,
          scrolledUnderElevation: 0,
          elevation: 0,
          actionsPadding: EdgeInsets.symmetric(
            horizontal: ishome ? 12 : 0,
            vertical: 0,
          ),
          automaticallyImplyLeading: false,
          backgroundColor: CustomAppColors.primaryColor,

          title: ishome
              ? Column(
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
              : Consumer<OurProviderClass>(
            builder: (context, provider, _) {
              final List<String> pageQuizTitles = [
                "Setup Your Test",
                "Choose Your Subject",
                "Choose Your Book",
                "Select Your Chapter",
                "Select Your Topic"
              ];

              final List<dynamic> title = [
                "",
                pageQuizTitles[provider.getCurrentPageForGeneratePaperWizard],
                "Add The Test",
                "History",
                "Profile",
              ];

              return Text(
                widget.titleCentr ?? title[provider.getIndex],
                style: CustomTextStyles.text24White600,
              );
            },
          ),

          leading: !ModalRoute.of(context)!.isFirst
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

                    child: ImageIcon(
                      AssetImage("assets/icons/menue.png"),

                      color: CustomAppColors.grey_f5f5f5,
                    ),
                  ),
                ),
          actions: [
            CustomInkwell(
              radius: 20,
              color: CustomAppColors.grey_a0a0a0,
              onTap: () {

              },
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
            if (ishome)
              Image.asset("assets/images/Avatar.png", width: 40, height: 40),
          ],
        ),
      ),


      body: PopScope(
        canPop: currentIndex == 0 && widget.mainBody == null,
          onPopInvokedWithResult: (bool didPop, result) async {
          if(!didPop && widget.mainBody!=null && !ModalRoute.of(context)!.isFirst){
            Navigator.pop(context);
          }
            if (!didPop && currentIndex != 0 && widget.mainBody == null) {
              Provider.of<OurProviderClass>(context, listen: false)
                  .changeBottomNavBarIndex(0);
            }
          },


        child: SafeArea(
          child: Padding(
            padding: ConstValues.pagePadding,
            child:
                widget.mainBody!=null ?
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: widget.isScrollAllow!
                              ? SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: widget.mainBody,
                          )
                              :widget. mainBody ?? const SizedBox(),
                        ),
                        // bottom content (button etc.)
                        if (widget.bottomWidget != null)
                          SafeArea(

                            child: widget.bottomWidget!,
                          ),
                      ],
                    )
                 :


                IndexedStack(
                  index: Provider.of<OurProviderClass>(context).getIndex,
                  children: AppScreens().screenLst,
                ),
          ),
        ),
      ),

      bottomNavigationBar: (ModalRoute.of(context)!.isFirst && widget.mainBody==null )?CustomBottomNavBar(
        onItemTapped: (index)async {
          final provider = Provider.of<OurProviderClass>(context, listen: false);

          if (Navigator.of(context).canPop()) {
            await Navigator.of(context).maybePop();
            // Navigator.of(context).popUntil((route) => route.isFirst);
          }

          provider.changeBottomNavBarIndex(index);
        },
      ):null,

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
                    Divider(color: CustomAppColors.lightGreyColor),
                    SizedBox(height: 12),
                    drawerItemContainer(
                      title: "Notifications",
                      page: NotificationsScreen(),
                      iconPath: "notifications",
                    ),
                    drawerItemContainer(
                      title: "History",
                      onTap: () {
                        Navigator.pop(context);
                        Provider.of<OurProviderClass>(
                          context,
                          listen: false,
                        ).changeBottomNavBarIndex(3);
                      },
                      iconPath: "history",
                    ),
                    drawerItemContainer(
                      title: "Tutorials",
                      iconPath: "tutorials",
                      page: TutorialScreen(),

                    ),
                    drawerItemContainer(
                      title: "Settings",
                      page: SettingsScreen(),
                      iconPath: "settings",
                    ),
                    drawerItemContainer(
                      page: SupportScreen(),
                      title: "Support",
                      iconPath: "contact_support",
                    ),
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
                iconPath: "light_mode",
                iconColor: CustomAppColors.greyColor,
                trailing: Switch(
                  trackOutlineColor: WidgetStatePropertyAll(
                    CustomAppColors.greyA0ToC0,
                  ),
                  inactiveTrackColor: CustomAppColors.grey_a0a0a0,
                  inactiveThumbColor: CustomAppColors.whiteColor,
                  activeThumbColor: CustomAppColors.primaryColor,
                  activeTrackColor: CustomAppColors.greyA0ToC0,
                  value:
                      Provider.of<ThemeManager>(
                        context,
                        listen: false,
                      ).themeData ==
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

              SizedBox(height: 4),
              CustomButtonWidget(
                btnTxtStyle: CustomTextStyles.text18WhiteBold,
                btntext: "Logout",
                isReverse: false,
                btnonPressed: () {
                  ConstFunctions.showDialogBox(context: context, yes: (){}, no: (){}, title: "Logout Account");
                },
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
  const drawerItemContainer({
    super.key,
    this.iconColor,
    this.onTap,
    this.page,
    required this.title,
    this.trailing,
    required this.iconPath,
  });

  @override
  State<drawerItemContainer> createState() => _drawerItemContainerState();
}

class _drawerItemContainerState extends State<drawerItemContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: CustomInkwell(
        color: widget.trailing!=null?Colors.transparent:null,
        isCircle: false,
        onTap: () {
          // Run custom onTap if provided
          widget.onTap?.call();

          // Navigate if a page is provided
          if (widget.page != null) {
            Navigator.pop(context);
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
              child: Text(
                widget.title,
                style: CustomTextStyles.text16GreyA0A0A0W500,
              ),
            ),
            (widget.trailing != null) ? widget.trailing! : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
