// ignore_for_file: deprecated_member_use, must_be_immutable
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hustlehub/features/freelancer/auth/freelancer_setup_account/user_info/widget/freelancer_info_card.dart';
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

        FreelancerInfoCard(
          color: selectedExperience == levelOtions[0]
              ? Colors.green
              : const Color.fromARGB(183, 199, 199, 199),

          cardValue: levelOtions[0],
          groupValue: selectedExperience,
          onChanged: experienceValue,

          radio: Radio(
            value: levelOtions[0],
            groupValue: selectedExperience,
            onChanged: experienceValue,
          ),
          image: "assets/account/intern.png",
          state: "intern",
          height: 8.h,
        ),

        FreelancerInfoCard(
          color: selectedExperience == levelOtions[1]
              ? Colors.green
              : const Color.fromARGB(183, 199, 199, 199),

          cardValue: levelOtions[1],
          groupValue: selectedExperience,
          onChanged: experienceValue,

          radio: Radio(
            value: levelOtions[1],
            groupValue: selectedExperience,
            onChanged: experienceValue,
          ),
          image: "assets/account/mid.png",
          state: "mid",
          height: 8.h,
        ),

        FreelancerInfoCard(
          color: selectedExperience == levelOtions[2]
              ? Colors.green
              : const Color.fromARGB(183, 199, 199, 199),

          cardValue: levelOtions[2],
          groupValue: selectedExperience,
          onChanged: experienceValue,

          radio: Radio(
            value: levelOtions[2],
            groupValue: selectedExperience,
            onChanged: experienceValue,
          ),
          image: "assets/account/expert.png",
          state: "expert",
          height: 8.h,
        ),
      ],
    );
  }
}
