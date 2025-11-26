import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hustlehub/features/core/auth/log_in/log_in_view.dart';
import 'package:hustlehub/features/core/auth/sign_up/sign_up_sevices.dart';
import 'package:hustlehub/features/core/widgets/custom_button.dart';
import 'package:hustlehub/features/core/widgets/custom_field.dart';
import 'package:sizer/sizer.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Create an Account",
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
                    "full name",
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
                  hintText: "amr fadel",
                  obscureText: false,
                  controller: _nameController,
                  textInputType: TextInputType.text,
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 5.w),
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
                child: CustomButton(
                  onTap: () {
                    if (!RegExp(
                          "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]",
                        ).hasMatch(_emailController.text) ||
                        _emailController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("enter valid email")),
                      );
                      return;
                    }

                    if (_passwordController.text.isEmpty) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text("not valid.")));
                      return;
                    }

                    AccountCreation().createAccount(
                      _emailController.text,
                      _passwordController.text,
                      context,
                    );
                  },
                  title: "Sign up",
                  width: 80.w,
                ),
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
                        MaterialPageRoute(builder: (context) => LogInView()),
                      );
                    },
                    child: Text(
                      "Log In",
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
      ),
    );
  }
}
