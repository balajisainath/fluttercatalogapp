import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class mythemes{
  static ThemeData lightTheme(BuildContext context)=> ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.lato().fontFamily,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      )
  );
  static ThemeData datkTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,
  );

}
