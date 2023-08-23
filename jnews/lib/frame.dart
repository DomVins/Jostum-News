import 'package:flutter/material.dart';
import 'package:jnews/pages/chats.dart';
import 'package:jnews/pages/gallery.dart';
import 'pages/home.dart';

class Frame extends StatefulWidget {
  const Frame({super.key, required this.title});

  final String title;

  @override
  State<Frame> createState() => _FrameState();
}

class _FrameState extends State<Frame> {
  int index = 0;

  final screens = const [
    Home(),
    Gallery(),
    Center(
      child: Text("News Feed"),
    ),
    Center(
      child: Text("Notification"),
    ),
    Center(
      child: Chats(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    const double iconSizeSelected = 30;
    const double iconSizeUnselected = 25;
    return Scaffold(
      // backgroundColor: backgroundColor,
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            indicatorColor: Colors.transparent,
            labelTextStyle: MaterialStateProperty.all(const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.black))),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          child: NavigationBar(
            height: 60,
            backgroundColor: Colors.grey.shade200,
            selectedIndex: index,
            onDestinationSelected: (value) => setState(() {
              index = value;
            }),
            destinations: [
              NavigationDestination(
                  selectedIcon: Image.asset(
                    'assets/icons/home_filled.png',
                    width: iconSizeSelected,
                    height: iconSizeSelected,
                  ),
                  icon: Image.asset(
                    'assets/icons/home_outlined.png',
                    width: iconSizeUnselected,
                    height: iconSizeUnselected,
                  ),
                  label: 'Home'),
              NavigationDestination(
                  selectedIcon: Image.asset(
                    'assets/icons/gallery_filled.png',
                    width: iconSizeSelected,
                    height: iconSizeSelected,
                  ),
                  icon: Image.asset(
                    'assets/icons/gallery_outlined.png',
                    width: iconSizeUnselected,
                    height: iconSizeUnselected,
                  ),
                  label: 'Gallery'),
              NavigationDestination(
                  selectedIcon: Image.asset(
                    'assets/icons/newspaper_filled.png',
                    width: iconSizeSelected,
                    height: iconSizeSelected,
                  ),
                  icon: Image.asset(
                    'assets/icons/newspaper_outlined.png',
                    width: iconSizeUnselected,
                    height: iconSizeUnselected,
                  ),
                  label: 'News Feed'),
              NavigationDestination(
                  selectedIcon: Image.asset(
                    'assets/icons/notifications_filled.png',
                    width: iconSizeSelected,
                    height: iconSizeSelected,
                  ),
                  icon: Image.asset(
                    'assets/icons/notifications_outlined.png',
                    width: iconSizeUnselected,
                    height: iconSizeUnselected,
                  ),
                  label: 'Notifications'),
              NavigationDestination(
                  selectedIcon: Image.asset(
                    'assets/icons/chat_filled.png',
                    width: iconSizeSelected,
                    height: iconSizeSelected,
                  ),
                  icon: Image.asset(
                    'assets/icons/chat_outlined.png',
                    width: iconSizeUnselected,
                    height: iconSizeUnselected,
                  ),
                  label: 'Chats'),
            ],
          ),
        ),
      ),
    );
  }
}
