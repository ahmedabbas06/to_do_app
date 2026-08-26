import 'package:flutter/material.dart';
import '../../controller/theme_controller.dart';
import '../../widgets/theme_item.dart';

class ThemeScreen extends StatefulWidget {
  final ThemeController theme;

  const ThemeScreen({super.key, required this.theme});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  bool darkTheme = false;

  @override
  void initState() {
    super.initState();

    darkTheme = widget.theme.themeMode == ThemeMode.dark;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Theme",
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: Column(
          children: [

            SizedBox(height: 20),
            ThemeItem(
              icon: Icons.light_mode_outlined,
              title: "Light Theme",
              value: false,
              groupValue: darkTheme,
              onChanged: (value) {
                setState(() {
                  darkTheme = value!;
                });
              },
            ),

            SizedBox(height: 15),
            ThemeItem(
              icon: Icons.dark_mode_outlined,
              title: "Dark Theme",
              value: true,
              groupValue: darkTheme,
              onChanged: (value) {
                setState(() {
                  darkTheme = value!;
                });
              },
            ),

            SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 52,

              child: ElevatedButton(
                onPressed: () {
                  widget.theme.changeTheme(darkTheme);
                  Navigator.pop(context);
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  foregroundColor: Colors.white,
                  elevation: 3,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),

                child: Text(
                  "Save Editing",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}