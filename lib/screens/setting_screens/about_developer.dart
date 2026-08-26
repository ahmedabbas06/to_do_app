import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/theme_controller.dart';
import '../../widgets/social_link_card.dart';

class AboutDeveloper extends StatefulWidget {
  final ThemeController theme;

  const AboutDeveloper({super.key, required this.theme});

  @override
  State<AboutDeveloper> createState() => _AboutDeveloperState();
}

class _AboutDeveloperState extends State<AboutDeveloper> {

  Future<void> openLink(String url) async {
    final Uri uri = Uri.parse(url);

    await launchUrl(
      uri,
      mode: LaunchMode.externalNonBrowserApplication,
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
          "About Developer",
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

              SizedBox(height: 30),

              Container(
                width: 130,
                height: 130,

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

                child: Icon(
                  Icons.person,
                  size: 75,
                  color: Colors.deepPurpleAccent,
                ),
              ),

              SizedBox(height: 20),

              Text(
                "Ahmed Abbas",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),


              SizedBox(height: 30),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(16),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),

                child: Column(
                  children: [

                    Text(
                      "About Me",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),

                    SizedBox(height: 12),

                    Text(
                      "I am a Flutter Developer interested in building modern and user-friendly mobile applications.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurfaceVariant,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 25),

              SocialLinkCard(
                icon: Icons.link,
                title: "LinkedIn",
                onTap: () {
                  openLink(
                    "https://www.linkedin.com/in/ahmed-abdullah-abbas",
                  );
                },
              ),

              SizedBox(height: 15),

              SocialLinkCard(
                icon: Icons.chat_outlined,
                title: "WhatsApp",
                onTap: () {
                  openLink(
                    "https://wa.me/+201110795772",
                  );
                },
              ),

              SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Icon(
                    Icons.code,
                    color: Colors.deepPurpleAccent,
                  ),

                  SizedBox(width: 8),

                  Text(
                    "Flutter Developer",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}