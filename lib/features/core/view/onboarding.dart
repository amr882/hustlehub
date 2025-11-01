import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hustlehub/features/core/auth/log_in/log_in_view.dart';
import 'package:sizer/sizer.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Align(
              alignment: AlignmentGeometry.center,
              child: Text(
                'hustlehub',
                style: GoogleFonts.dmSans(
                  fontSize: 2.5.h,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Align(
              alignment: AlignmentGeometry.center,
              child: Image.asset(
                "assets/account/onboarding_image.png",
                height: 35.h,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Find Your",
                    style: GoogleFonts.dmSans(
                      fontSize: 3.h,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Dream Job",
                    style: GoogleFonts.dmSans(
                      fontSize: 3.5.h,
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xffFCA34D),
                      color: Color(0xffFCA34D),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Here!",
                    style: GoogleFonts.dmSans(
                      fontSize: 3.h,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    "Explore all the most exciting job roles based\non your interest and study major.",
                    style: GoogleFonts.dmSans(
                      fontSize: 1.5.h,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LogInView()),
                      );
                    },
                    child: Align(
                      alignment: AlignmentGeometry.centerRight,
                      child: Container(
                        width: 7.h,
                        height: 7.h,
                        decoration: BoxDecoration(
                          color: Color(0xff130160),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_forward_rounded,
                            color: Colors.white,
                            size: 3.5.h,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
