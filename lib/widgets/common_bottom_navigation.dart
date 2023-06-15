import 'package:firstcry/constants/app_colors.dart';
import 'package:firstcry/constants/size_constants.dart';
import 'package:flutter/material.dart';

class CommonBottomNavigation extends StatelessWidget {
  const CommonBottomNavigation(
      {super.key, required this.currentTab, required this.onSelectTab});

  final int currentTab;
  final ValueChanged<int> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      unselectedItemColor: black.withOpacity(0.74),
      unselectedIconTheme: const IconThemeData(color: black),
      selectedIconTheme: const IconThemeData(color: orange),
      selectedItemColor: orange,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: const TextStyle(
        color: orange,
        fontSize: 12,
      ),
      unselectedLabelStyle: const TextStyle(
        color: black,
        fontSize: 12,
      ),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: SizeConstants.height_23),
          label: 'Shopping',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.play_circle_outline, size: SizeConstants.height_23),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.heart_broken_sharp, size: SizeConstants.height_23),
          label: 'Parenting',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.perm_identity, size: SizeConstants.height_23),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu, size: SizeConstants.height_23),
          label: 'Menu',
        ),
      ],
      onTap: (index) {
        onSelectTab(index);
      },
      currentIndex: currentTab,
    );
  }
}
