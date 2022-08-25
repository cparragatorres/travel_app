import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/ui/general/colors.dart';

class PointWidget extends StatelessWidget {

  String text;

  PointWidget({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 12.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: kBrandPrimaryColor,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12.0,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: Text(text,style: GoogleFonts.poppins(color: Colors.white)),
    );
  }
}
