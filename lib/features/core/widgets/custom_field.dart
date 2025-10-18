import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class CustomField extends StatefulWidget {
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType textInputType;
  final String hintText;
  final String? Function(String?)? validator;

  final Widget? suffixIcon;
  const CustomField({
    super.key,

    required this.obscureText,
    required this.controller,
    required this.textInputType,
    required this.hintText,
    this.validator,

    this.suffixIcon,
  });

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
        child: TextFormField(
          style: GoogleFonts.rubik(color: const Color.fromARGB(255, 0, 0, 0)),
          cursorColor: Colors.black,
          obscureText: widget.obscureText,
          controller: widget.controller,
          keyboardType: widget.textInputType,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color.fromARGB(255, 255, 255, 255),
            hintStyle: TextStyle(
              color: Color.fromARGB(185, 148, 145, 145),
              fontWeight: FontWeight.w400,
              fontSize: 1.8.h,
            ),
            border: OutlineInputBorder(),

            // focused
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.transparent),
            ),

            // unfocused
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            hintText: widget.hintText,
          ),
          validator: widget.validator,
        ),
      ),
    );
  }
}
