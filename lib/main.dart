import 'package:flutter/material.dart';

import 'package:dtagapp/color_utils.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screen/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: GoogleFonts.nunitoTextTheme(
            Theme.of(context).textTheme,
          ),
          dividerColor: ColorUtils.blue),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
