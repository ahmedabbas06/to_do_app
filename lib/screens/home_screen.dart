import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/screens/setting_screens/settings_screen.dart';
import '../controller/theme_controller.dart';
import '../widgets/task_card.dart';
import 'add_task_screen.dart';
import 'done_task.dart';
import 'dart:io';

class HomeScreen extends StatefulWidget {
  final ThemeController theme;

  const HomeScreen({super.key, required this.theme});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var box = Hive.box("my_task");
  var doneBox = Hive.box("done_task");

  String name = "";
  String? profileImage;

  getProfileData() async {
    final SharedPreferences prefs =
    await SharedPreferences.getInstance();

    name = prefs.getString('profile_name') ?? "";
    profileImage = prefs.getString('profile_image');

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        centerTitle: false,

        title: Row(
          children: [

            CircleAvatar(
              radius: 20,
              backgroundImage: profileImage != null
                  ? FileImage(File(profileImage!))
                  : null,

              child: profileImage == null
                  ? Icon(Icons.person)
                  : null,
            ),

            SizedBox(width: 10),

            Text(
              'Welcome $name',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DoneTasks(
                    theme: widget.theme,
                  ),
                ),
              ).then((value) {
                setState(() {});
              });
            },

            icon: Icon(Icons.check_box_outlined),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        elevation: 4,

        child: Icon(
          Icons.add,
          size: 28,
        ),

        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTask(),
            ),
          ).then((value) {
            setState(() {});
          });
        },
      ),

      floatingActionButtonLocation:
      FloatingActionButtonLocation.endFloat,

      body: (box.isEmpty)
          ? Center(
        child: Lottie.asset(
          "assets/New Google Keep Icon.json",
          width: 300,
          height: 300,
        ),
      )

          : Padding(
        padding: EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              "My Tasks",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context)
                    .colorScheme
                    .onSurface,
              ),
            ),

            SizedBox(height: 16),

            Expanded(
              child: ListView.builder(
                itemCount: box.length,

                itemBuilder:
                    (BuildContext context, int index) {

                  return TaskCard(
                    title: box.getAt(index)["title"],
                    description:
                    box.getAt(index)["description"],
                    isCompleted:
                    box.getAt(index)["isCompleted"] == true,
                    showEdit: true,

                    onChanged: (value) {
                      setState(() {
                        box.getAt(index)["isCompleted"] =
                        value!;

                        doneBox.add(
                          box.getAt(index),
                        );

                        box.deleteAt(index);
                      });
                    },

                    onEdit: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AddTask(index: index),
                        ),
                      ).then((value) {
                        setState(() {});
                      });
                    },

                    onDelete: () {
                      box.deleteAt(index);
                      setState(() {});
                    },
                  );
                },
              ),
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
          currentIndex: 0,
          selectedItemColor: Colors.deepPurpleAccent,
          unselectedItemColor:
          Theme.of(context).colorScheme.onSurfaceVariant,
          backgroundColor:
          Theme.of(context).colorScheme.surface,
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
            if (value == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingScreen(
                    theme: widget.theme,
                  ),
                ),
              ).then((value) {
                getProfileData();
              });
            }
          },
        ),
      ),
    );
  }
}