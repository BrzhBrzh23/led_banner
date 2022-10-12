import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:led_banner/home/banner/widgets/background_video.dart';
import 'package:led_banner/home/templates/template_model.dart';
import 'package:led_banner/home/templates/template_tile.dart';
import 'package:led_banner/routes/router.gr.dart';

class TemplatesScreen extends StatelessWidget {
  TemplatesScreen({Key? key}) : super(key: key);

  
  final templates = Template.templates;
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      backgroundColor: Color.fromRGBO(45, 42, 56, 1),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Templates', 
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < templates.length; i++)
                TemplateTile(
                    author: templates[i].author,
                    title: templates[i].title,
                    onTileTap: () => context.router.push(
                        SingleTemplateRoute(templateId: templates[i].id))),
            ],
          ),
        ),
      ),
    );
  }
}
