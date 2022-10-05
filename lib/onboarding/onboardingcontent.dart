import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        SizedBox(
          height: 200,
          width: 200,
          child: Image.asset(image),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          title,
          style: GoogleFonts.outfit(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
        ),
        const SizedBox(
          height: 23,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            description,
            style: GoogleFonts.outfit(
                color: Color.fromARGB(255, 143, 143, 153), fontSize: 17),
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'Terms of Use',
                  style: GoogleFonts.outfit(
                      color: Color.fromARGB(255, 143, 143, 153), fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Restore',
                  style: GoogleFonts.outfit(
                      color: Color.fromARGB(255, 143, 143, 153), fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Privacy Policy',
                  style: GoogleFonts.outfit(
                      color: Color.fromARGB(255, 143, 143, 153), fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }
}
