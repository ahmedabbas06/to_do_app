import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/theme_controller.dart';
import '../../widgets/profile_text_field.dart';

class ProfileScreen extends StatefulWidget {
  final ThemeController theme;

  const ProfileScreen({super.key, required this.theme});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final picker = ImagePicker();

  XFile? image;

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    final SharedPreferences prefs =
    await SharedPreferences.getInstance();

    nameController.text = prefs.getString('profile_name') ?? '';
    ageController.text = prefs.getString('profile_age') ?? '';

    String? imagePath = prefs.getString('profile_image');

    if (imagePath != null) {
      image = XFile(imagePath);
    }

    setState(() {});
  }

  Future<void> chooseImage() async {
    image = await picker.pickImage(
      source: ImageSource.gallery,
    );

    setState(() {});
  }

  saveData() async {
    final SharedPreferences prefs =
    await SharedPreferences.getInstance();

    await prefs.setString(
      'profile_name',
      nameController.text,
    );

    await prefs.setString(
      'profile_age',
      ageController.text,
    );

    if (image != null) {
      await prefs.setString(
        'profile_image',
        image!.path,
      );
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Profile saved successfully"),
      ),
    );
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
          "Profile",
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
        
          child: Column(
            children: [
        
              SizedBox(height: 20),
        
              GestureDetector(
                onTap: () {
                  chooseImage();
                },
        
                child: Container(
                  width: 120,
                  height: 120,
        
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
        
                  child: ClipOval(
                    child: image == null
                        ? Icon(
                      Icons.person,
                      size: 65,
                      color: Colors.grey,
                    )
                        : Image.file(
                      File(image!.path),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
        
              SizedBox(height: 10),
        
              Text(
                "Tap to change photo",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  fontSize: 13,
                ),
              ),
        
              SizedBox(height: 35),

              ProfileTextField(
                controller: nameController,
                label: "Name",
                icon: Icons.person_outline,
              ),
        
              SizedBox(height: 18),

              ProfileTextField(
                controller: ageController,
                label: "Age",
                icon: Icons.cake_outlined,
                keyboardType: TextInputType.number,
              ),
        
              SizedBox(height: 30),
        
              SizedBox(
                width: double.infinity,
                height: 52,
        
                child: ElevatedButton(
                  onPressed: () {
                    saveData();
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
      ),
    );
  }
}

