import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:led_banner/home/templates/template_model.dart';

class SingleTemplatePage extends StatelessWidget {
  final int templateId;
  const SingleTemplatePage({
    Key? key,
    @PathParam() required this.templateId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final template = Template.templates[templateId - 1];
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                template.title,
                style: Theme.of(context).textTheme.headline3,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                template.author,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
