import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hustlehub/features/core/auth/sign_up/sign_up_view.dart';
import 'package:hustlehub/features/core/widgets/custom_button.dart';
import 'package:hustlehub/features/core/widgets/custom_field.dart';
import 'package:sizer/sizer.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome Back",
              style: GoogleFonts.dmSans(
                fontSize: 3.h,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.w, top: 5.h),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "email",
                  style: GoogleFonts.dmSans(
                    color: const Color.fromARGB(171, 0, 0, 0),
                    fontSize: 1.8.h,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 50,
                    color: Color.fromARGB(76, 153, 171, 198),
                  ),
                ],
              ),
              child: CustomField(
                hintText: "example@gmail.com",
                obscureText: false,
                controller: _emailController,
                textInputType: TextInputType.text,
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 5.w, top: 2.h),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "password",
                  style: GoogleFonts.dmSans(
                    fontSize: 1.8.h,
                    color: const Color.fromARGB(171, 0, 0, 0),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 50,
                    color: Color.fromARGB(76, 153, 171, 198),
                  ),
                ],
              ),
              child: CustomField(
                hintText: "*************",
                obscureText: true,
                controller: _passwordController,
                textInputType: TextInputType.text,
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              child: CustomButton(onTap: () {}, title: "LOGIN", width: 80.w),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "You don't have an account yet?",
                  style: GoogleFonts.dmSans(
                    fontSize: 1.5.h,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(width: 2.w),

                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => SignUpView()),
                    );
                  },
                  child: Text(
                    "Sign up",
                    style: GoogleFonts.dmSans(
                      fontSize: 1.8.h,
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xffFCA34D),
                      color: Color(0xffFCA34D),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
