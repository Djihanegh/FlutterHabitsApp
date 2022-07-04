import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// All the text styles used in the app
class TextStyles {
  static final bold = GoogleFonts.manrope(
    fontWeight: FontWeight.bold,
  );

  static final regular = GoogleFonts.manrope(
      fontWeight: FontWeight.w400); //.montserrat(fontWeight: FontWeight.w400);

  static final italic = GoogleFonts.manrope(fontStyle: FontStyle.italic);

  static final mediumItalic = GoogleFonts.manrope(
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w400,
      color: Colors.black);

  static final semiBold = GoogleFonts.manrope(
    fontWeight: FontWeight.w600,
  );

  static final extraBold = GoogleFonts.manrope(
    fontWeight: FontWeight.w800,
  );

  static final interSemiBold = GoogleFonts.inter(
    fontWeight: FontWeight.w600,
  );

  static final semiBoldItalic = GoogleFonts.manrope(
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w600,
  );

  static final medium = GoogleFonts.manrope(
    fontWeight: FontWeight.w500,
  );
}
