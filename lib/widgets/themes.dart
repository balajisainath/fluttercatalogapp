import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:google_fonts/google_fonts.dart';

class mythemes{
  static ThemeData lightTheme(BuildContext context)=> ThemeData(
    accentColor: darkBlueColour,
      primarySwatch: Colors.deepPurple,
      cardColor: Colors.white,
      canvasColor: mythemes.creamcolour,
      buttonColor: mythemes.darkBlueColour,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      )
  );
  static ThemeData datkTheme(BuildContext context) => ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      brightness: Brightness.dark,
      accentColor: Colors.white,
      cardColor: Colors.black,
      canvasColor: mythemes.Darkcreamcolour,
      buttonColor: mythemes.lighblucolour,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
      )
  );
  static Color darkBlueColour=Color(0xff403b58);
  static Color Darkcreamcolour=Vx.gray900;
  static Color creamcolour=Color(0xfff5f5f5);
  static Color lighblucolour=Vx.indigo500;

}
