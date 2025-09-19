import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/const.dart';
import '../utils/providers.dart';

class CustomBottomNavBar extends StatefulWidget {
  final ValueChanged<int> onItemTapped;
  CustomBottomNavBar({super.key, required this.onItemTapped});
  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {



  Widget _buildAnimatedItem(String title, String path, bool isSelected) {

    return

      AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? CustomAppColors.primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          ImageIcon(
            AssetImage("assets/bottom-icons/$path.png",),
            size: 26,
            color: isSelected ? Colors.white : CustomAppColors.greyColor,
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: isSelected
                ? Padding(
              padding: const EdgeInsets.only(left:6),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    int  selectedIndex=Provider.of<OurProviderClass>(context).getIndex;
    log(Provider.of<OurProviderClass>(context).getIndex.toString());
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        border: Border(top: BorderSide(color: CustomAppColors.grey_d9d9d9)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -2),
            color: Color(0x14000000),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: selectedIndex,
          onTap: (index) {
            widget.onItemTapped(index);
          },
          // type: BottomNavigationBarType.fixed,

          selectedItemColor: CustomAppColors.primaryColor,
          unselectedItemColor: CustomAppColors.greyColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                label: '',
                icon: _buildAnimatedItem("Home", "home", selectedIndex == 0),
                backgroundColor: CustomAppColors.whiteColor
            ),
            BottomNavigationBarItem(
                label: '',
                icon: _buildAnimatedItem("School", "school", selectedIndex == 1),
                backgroundColor: CustomAppColors.whiteColor
            ),
            BottomNavigationBarItem(
                label: '',
                icon: _buildAnimatedItem("Add", "add", selectedIndex == 2),
                backgroundColor: CustomAppColors.whiteColor
            ),
            BottomNavigationBarItem(
                label: '',
                icon: _buildAnimatedItem("History", "history", selectedIndex == 3),
                backgroundColor: CustomAppColors.whiteColor
            ),
            BottomNavigationBarItem(
                label: '',
                icon: _buildAnimatedItem("User", "user", selectedIndex == 4),
                backgroundColor: CustomAppColors.whiteColor
            ),
          ],
        ),
      ),
    );
  }
}

// class _NavItem {
//   final IconData icon;
//   final String label;
//   _NavItem({required this.icon, required this.label});
// }
// final List<_NavItem> items = [
//   _NavItem(icon: Icons.home, label: "Home"),
//   _NavItem(icon: Icons.search, label: "Search"),
//   _NavItem(icon: Icons.notifications, label: "Alerts"),
//   _NavItem(icon: Icons.person, label: "Profile"),
// ];
// return SafeArea(child: Container(
//   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
//   decoration: BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
//     border: Border(top: BorderSide(color: CustomAppColors.grey_d9d9d9)),
//     boxShadow: [
//       BoxShadow(
//         offset: Offset(0, -2),
//         color: Color(0x14000000),
//         blurRadius: 8,
//         spreadRadius: 0,
//       )
//     ],
//   ),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceAround,
//     children: List.generate(items.length, (index) {
//       final item = items[index];
//       final isSelected = selectedIndex == index;
//
//       return GestureDetector(
//         onTap: () {
//           setState(() => selectedIndex = index);
//         },
//         child: AnimatedContainer(
//           duration: Duration(milliseconds: 200),
//           curve: Curves.easeInOut,
//           padding: EdgeInsets.symmetric(horizontal: isSelected ? 12 : 0, vertical: 8),
//           decoration: BoxDecoration(
//             color: isSelected ? CustomAppColors.primaryColor : Colors.transparent,
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Row(
//             children: [
//               Icon(
//                 item.icon,
//                 color: isSelected ?CustomAppColors.whiteColor : CustomAppColors.greyColor,
//               ),
//               AnimatedSize(
//                 duration: Duration(milliseconds: 300),
//                 curve: Curves.easeInOut,
//                 child: isSelected
//                     ? Padding(
//                   padding: const EdgeInsets.only(left: 6.0),
//                   child: Text(
//                     item.label,
//                     style: TextStyle(
//                       color: CustomAppColors.whiteColor,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 )
//                     : SizedBox.shrink(),
//               )
//             ],
//           ),
//         ),
//       );
//     }),
//   ),
// ));