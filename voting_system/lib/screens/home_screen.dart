import 'package:flutter/material.dart';

// screens
import 'package:voting_system/screens/global/post_screen.dart';
import 'package:voting_system/screens/system/result_screen.dart';
import 'package:voting_system/screens/global/profile_screen.dart';
import 'package:voting_system/screens/admin/create_post_screen.dart';

// utils
import 'package:voting_system/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  final bool isAdmin;

  const HomeScreen({Key? key, required this.isAdmin}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<String> titles = ['Home', 'Result', 'Profile'];

  List<Widget> screens = const [PostScreen(), ResultScreen(), ProfileScreen()];

  List<BottomNavigationBarItem> navItems = const [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
        size: 28.0,
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.file_copy,
        size: 24.0,
      ),
      label: 'Result',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.person,
        size: 28.0,
      ),
      label: 'Profile',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<String> getTitles() {
    List<String> items = [];
    if (widget.isAdmin) {
      for (int i = 0; i < titles.length; i++) {
        if (i != 1) {
          items.add(titles[i]);
        }
      }
      return items;
    } else {
      return titles;
    }
  }

  List<Widget> getScreens() {
    List<Widget> items = [];
    if (widget.isAdmin) {
      for (int i = 0; i < screens.length; i++) {
        if (i != 1) {
          items.add(screens[i]);
        }
      }
      return items;
    } else {
      return screens;
    }
  }

  List<BottomNavigationBarItem> getNavItems() {
    List<BottomNavigationBarItem> items = [];
    if (widget.isAdmin) {
      for (int i = 0; i < navItems.length; i++) {
        if (i != 1) {
          items.add(navItems[i]);
        }
      }
      return items;
    } else {
      return navItems;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTitles()[_selectedIndex]),
        centerTitle: true,
        toolbarHeight: 65,
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: getScreens()[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        backgroundColor: kPrimaryColor,
        currentIndex: _selectedIndex,
        selectedItemColor: kLightColor,
        unselectedItemColor: kLightColor.withOpacity(0.7),
        onTap: _onItemTapped,
        items: getNavItems(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: widget.isAdmin
          ? SizedBox(
              width: 65,
              height: 65,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CreatePostScreen(),
                    ),
                  );
                },
                backgroundColor: kPrimaryColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                child: const Icon(
                  Icons.add,
                  size: 28.0,
                  color: kLightColor,
                ),
              ),
            )
          : null,
    );
  }
}
