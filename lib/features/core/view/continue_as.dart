// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hustlehub/features/freelancer/auth/freelancer_db.dart';
import 'package:hustlehub/features/freelancer/auth/freelancer_setup_account/freelancer_setup_account.dart';
import 'package:sizer/sizer.dart';

class ContinueAs extends StatefulWidget {
  const ContinueAs({super.key});

  @override
  State<ContinueAs> createState() => _ContinueAsState();
}

List<String> groubOtions = ["freelancer", "client"];

class _ContinueAsState extends State<ContinueAs> {
  String currentOption = groubOtions[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Continue As",
                  style: GoogleFonts.dmSans(
                    fontSize: 3.h,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.5.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 45.w,
                        height: 18.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color.fromARGB(124, 172, 171, 171),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Radio(
                              value: groubOtions[0],
                              groupValue: currentOption,
                              onChanged: (value) {
                                setState(() {
                                  currentOption = value.toString();
                                });
                              },
                            ),

                            Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                "assets/account/freelancer.png",
                                height: 7.h,
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "freelancer",
                                style: GoogleFonts.dmSans(
                                  fontSize: 2.h,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 45.w,
                        height: 18.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color.fromARGB(124, 172, 171, 171),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Radio(
                              value: groubOtions[1],
                              groupValue: currentOption,
                              onChanged: (value) {
                                setState(() {
                                  currentOption = value.toString();
                                });
                              },
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                "assets/account/client.png",
                                height: 7.h,
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "client",
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
                  ),
                ),

                GestureDetector(
                  onTap: () async {
                    if (currentOption == groubOtions[0]) {
                      await FreelancerDb().addFreelancer();
                      print("freelancer ++++++++++++++++");
                    } else {
                      print("client++++++++++++++++++++++++++++++++");
                    }

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => currentOption == "freelancer"
                            ? FreelancerSetupAccount()
                            : ContinueAs(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 10.w),
                    child: Container(
                      width: 100.w,
                      height: 7.h,
                      decoration: BoxDecoration(
                        color: Color(0xff130160),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Text(
                          "continue",
                          style: GoogleFonts.dmSans(
                            fontSize: 2.h,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
