import 'package:flutter/material.dart';
import '../../controller/theme_controller.dart';
import '../../widgets/setting_item.dart';
import 'about_developer.dart';
import 'profile_screen.dart';
import 'theme_screen.dart';
import 'dart:io';

class SettingScreen extends StatefulWidget {
  final ThemeController theme;

  const SettingScreen({super.key , required this.theme});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(16),

        child: Column(
          children: [

            SizedBox(height: 10),

            SettingItem(
              icon: Icons.person_outline,
              title: "Profile",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(
                      theme: widget.theme,
                    ),
                  ),
                );
              }),

            SizedBox(height: 15),

            SettingItem(
              icon: Icons.palette_outlined,
              title: "Theme",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ThemeScreen(
                      theme: widget.theme,
                    ),
                  ),
                );
              },
            ),

            SizedBox(height: 15),

            SettingItem(
              icon: Icons.info_outline,
              title: "About Developer",
              onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutDeveloper(
                    theme: widget.theme,
                  ),
                ),
                );
              },
            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, -2),
            ),
          ],
        ),

        child: BottomNavigationBar(
          currentIndex: 1,
          selectedItemColor: Colors.deepPurpleAccent,
          unselectedItemColor: Theme.of(context).colorScheme.onSurfaceVariant,
          backgroundColor: Theme.of(context).colorScheme.surface,
          elevation: 0,

          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: "Home",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              activeIcon: Icon(Icons.settings),
              label: "Settings",
            ),
          ],

          onTap: (value) {
            if (value == 0) {
              Navigator.pop(context);
            }
          },
        ),
      ),
    );
  }
}