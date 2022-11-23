import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BottomWidget extends StatefulWidget {
  const BottomWidget({
    super.key,
    required int selectedIndex,
  });

  @override
  State<BottomWidget> createState() => _BottomWidgetState();
}

class _BottomWidgetState extends State<BottomWidget> {
  int selectedIndex = 0;
  onTap(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onTap,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      items: [
        BottomNavigationBarItem(
            icon: Image.asset(
              "assets/home.png",
              color: selectedIndex == 0 ? Color(0xff1ED760) : Color(0xff808080),
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: Image.asset(
              "assets/discovery.png",
              color: selectedIndex == 1 ? Color(0xff1ED760) : Color(0xff808080),
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: Image.asset(
              "assets/heart.png",
              color: selectedIndex == 2 ? Color(0xff1ED760) : Color(0xff808080),
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: Image.asset(
              "assets/profile.png",
              color: selectedIndex == 3 ? Color(0xff1ED760) : Color(0xff808080),
            ),
            label: ""),
      ],
      
    );
  }
}
