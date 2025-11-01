// ignore_for_file: deprecated_member_use, must_be_immutable
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

List<String> levelOtions = ["intern", "mid", "expert"];

class UserExperience extends StatelessWidget {
  final void Function(String?) experienceValue;
  final String selectedExperience;

  const UserExperience({
    super.key,
    required this.experienceValue,
    required this.selectedExperience,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "have you freelanced before?",
          style: GoogleFonts.dmSans(fontSize: 3.h, fontWeight: FontWeight.bold),
        ),
        // Intern
        Padding(
          padding: EdgeInsets.only(top: 3.5.h),
          child: Container(
            width: 45.w,
            height: 18.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: selectedExperience == levelOtions[0]
                    ? Colors.green
                    : const Color.fromARGB(124, 172, 171, 171),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Radio(
                  value: levelOtions[0],
                  groupValue: selectedExperience,
                  onChanged: experienceValue,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset("assets/account/intern.png", height: 8.h),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "intern",
                    style: GoogleFonts.dmSans(
                      fontSize: 2.h,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // mid
        Padding(
          padding: EdgeInsets.symmetric(vertical: 3.5.h),
          child: Container(
            width: 45.w,
            height: 18.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: selectedExperience == levelOtions[1]
                    ? Colors.green
                    : const Color.fromARGB(124, 172, 171, 171),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Radio(
                  value: levelOtions[1],
                  groupValue: selectedExperience,
                  onChanged: experienceValue,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset("assets/account/mid.png", height: 8.h),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "mid",
                    style: GoogleFonts.dmSans(
                      fontSize: 2.h,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // expert
        Container(
          width: 45.w,
          height: 18.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: selectedExperience == levelOtions[2]
                  ? Colors.green
                  : const Color.fromARGB(124, 172, 171, 171),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Radio(
                value: levelOtions[2],
                groupValue: selectedExperience,
                onChanged: experienceValue,
              ),
              Align(
                alignment: Alignment.center,
                child: Image.asset("assets/account/expert.png", height: 8.h),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "expert",
                  style: GoogleFonts.dmSans(
                    fontSize: 2.h,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
