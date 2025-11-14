import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class FreelancerInfoCard extends StatelessWidget {
  final Color color;
  final Widget radio;
  final String image;
  final String state;
  final double height;
  final String cardValue;
  final String groupValue;
  final ValueChanged<String?> onChanged;

  const FreelancerInfoCard({
    super.key,
    required this.color,
    required this.radio,
    required this.image,
    required this.state,
    required this.height,
    required this.cardValue,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 3.5.h),
      child: GestureDetector(
        onTap: () {
          onChanged(cardValue);
        },
        child: Container(
          width: 45.w,
          height: 18.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),

            border: Border.all(color: color, width: 2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              radio,
              Align(
                alignment: Alignment.center,
                child: Image.asset(image, height: height),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  state,
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
    );
  }
}
