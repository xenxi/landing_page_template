import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static ThemeData get dark =>
      ThemeData.dark().copyWith(textTheme: GoogleFonts.fredokaOneTextTheme());
}
