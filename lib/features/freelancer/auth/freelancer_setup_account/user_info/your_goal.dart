// ignore_for_file: deprecated_member_use, must_be_immutable
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hustlehub/features/freelancer/auth/freelancer_setup_account/user_info/widget/freelancer_info_card.dart';
import 'package:sizer/sizer.dart';

List<String> goalOtions = ["main income", "experience", "not sure"];

class YourGoal extends StatelessWidget {
  final void Function(String?) goalValue;
  final String selectedGoal;

  const YourGoal({
    super.key,
    required this.goalValue,
    required this.selectedGoal,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "What's your biggest goal for freelancing?",
          textAlign: TextAlign.center,
          style: GoogleFonts.dmSans(fontSize: 3.h, fontWeight: FontWeight.bold),
        ),

        // money
        FreelancerInfoCard(
          color: selectedGoal == goalOtions[0]
              ? Colors.green
              : const Color.fromARGB(183, 199, 199, 199),
          radio: Radio(
            value: goalOtions[0],
            groupValue: selectedGoal,
            onChanged: goalValue,
          ),
          image: "assets/account/main_income.png",
          state: "main income",
          height: 8.h,
        ),

        // exp
        FreelancerInfoCard(
          color: selectedGoal == goalOtions[1]
              ? Colors.green
              : const Color.fromARGB(183, 199, 199, 199),
          radio: Radio(
            value: goalOtions[1],
            groupValue: selectedGoal,
            onChanged: goalValue,
          ),
          image: "assets/account/experience medal.png",
          state: "experience",
          height: 8.h,
        ),

        // not sure
        FreelancerInfoCard(
          color: selectedGoal == goalOtions[2]
              ? Colors.green
              : const Color.fromARGB(183, 199, 199, 199),
          radio: Radio(
            value: goalOtions[2],
            groupValue: selectedGoal,
            onChanged: goalValue,
          ),
          image: "assets/account/not sure.png",
          height: 8.h,
          state: "not sure",
        ),
      ],
    );
  }
}
