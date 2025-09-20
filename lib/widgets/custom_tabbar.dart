import 'dart:developer';

import 'package:flutter/material.dart';

import '../constants/const.dart';

class CustomTabBar extends StatefulWidget {
  int tabLength;
  List<Widget> tabBarViewLst;
  List<Widget> tabsLst;
  int? defaultTabIndex;

  CustomTabBar({
    super.key,
    required this.tabLength,
    required this.tabBarViewLst,
    required this.tabsLst,
    this.defaultTabIndex,
  });

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return DefaultTabController(
      initialIndex: widget.defaultTabIndex ?? 0,
      length: widget.tabLength,
      child: Builder(
        builder: (context) {
          final tabController = DefaultTabController.of(context);



          // Listen to changes
          tabController!.addListener(() {
            if (mounted)
              setState(() {
                // log("message");
              });
          });

          return Column(
            children: [
              // Make container width match tabs
              Container(
                padding: const EdgeInsets.all(8.0),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: CustomAppColors.lightGreyColor),
                  color: Colors.transparent,
                ),
                // child: Theme(
                //   data: theme.copyWith(
                //     colorScheme: theme.colorScheme.copyWith(
                //       surfaceContainerHighest: Colors.transparent,
                //     ),
                //   ),
                child: TabBar(
                  controller: tabController,
                  tabAlignment: TabAlignment.fill,
                  dividerColor: Colors.transparent,
                  padding: EdgeInsets.zero,
                  labelPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  indicator: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    color: CustomAppColors.primaryColor,
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,

                  unselectedLabelStyle: CustomTextStyles.text20Grey600,

                  labelStyle: CustomTextStyles.text20White600,

                  tabs: widget.tabsLst,
                  // tabs: [
                  //   Container(
                  //       decoration: BoxDecoration(
                  //         color:
                  //
                  //         tabController.index==0?Colors.transparent:
                  //         Colors.grey,
                  //         borderRadius: const BorderRadius.all(Radius.circular(8)),
                  //       ),
                  //
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           Text("data"),
                  //         ],
                  //       )),
                  //   Container(
                  //       decoration: BoxDecoration(
                  //         color:
                  //
                  //         tabController.index==0?Colors.grey:
                  //         Colors.transparent,
                  //         borderRadius: const BorderRadius.all(Radius.circular(8)),
                  //       ),
                  //
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           Text("data"),
                  //         ],
                  //       ))
                  // ],
                ),

                // ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TabBarView(
                    children: widget.tabBarViewLst.map((e) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 2),
                        child: e,
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
