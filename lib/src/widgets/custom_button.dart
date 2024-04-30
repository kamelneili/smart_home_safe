import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final double? left;
  final double? right;
  const CustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.left,
      this.right});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: left ?? 26, right: right ?? 26),
      child: MaterialButton(
        color: Colors.blue,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none),
        onPressed: onPressed,
        minWidth: double.infinity,
        height: 60,
        child: Text(
          text,
          style: GoogleFonts.nunitoSans(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
    );
  }
}
