import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:led_banner/constants/gradient_icon.dart';
import 'package:led_banner/home/settings/setting_model.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Setting> settings = [
      Setting(name: 'Terms Of Use', icon: GradientIcon(Icons.info)),
      Setting(name: 'Privacy Policy', icon: GradientIcon(Icons.privacy_tip)),
      Setting(name: 'Support', icon: GradientIcon(Icons.support)),
      Setting(name: 'Share the App', icon: GradientIcon(Icons.share)),
      Setting(name: 'Rate the App', icon: GradientIcon(Icons.star_border)),
    ];

    return Scaffold(
        backgroundColor: const Color.fromRGBO(27, 29, 41, 1),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Settings',
            style: GoogleFonts.outfit(fontSize: 22, color: Colors.white),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Center(
            child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: ListView.builder(
                    itemCount: settings.length,
                    itemBuilder: (context, i) => TextButton(
                        onPressed: () {},
                        child: Container(
                            height: 80,
                            child: Card(
                              color: const Color.fromRGBO(45, 42, 56, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              margin: const EdgeInsets.only(bottom: 24),
                              child: Row(children: [
                                SizedBox(width: 26),
                                settings[i].icon,
                                SizedBox(width: 26),
                                Text(
                                  settings[i].name,
                                  style: GoogleFonts.outfit(
                                      fontSize: 17, color: Colors.white),
                                )
                              ]),
                            )))))));
  }
}
