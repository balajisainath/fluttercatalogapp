import 'package:flutter/material.dart';
import 'package:flutterapp1/pages/Loginpage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/Homepage.dart';

void main(){
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Homepage(),
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.lato().fontFamily,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
     // initialRoute: "/home",
      routes: {
        "/" :(context)=>Loginpage(),
        "/home":(context)=> Homepage(),
        "/login":(context)=> Loginpage(),
      },
    );
  }
}
