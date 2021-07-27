import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../color_utils.dart';

class GradientButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const GradientButton({Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          padding: MaterialStateProperty.all(EdgeInsets.all(0.0)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
          )),
      child: Ink(
        padding: EdgeInsets.all(0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
          gradient: LinearGradient(
            colors: <Color>[ColorUtils.sblue, ColorUtils.eblue],
          ),
        ),
        child: Container(
            alignment: Alignment.center,
            constraints: BoxConstraints(maxWidth: 150, maxHeight: 40),
            child: Text(text,
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white))),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color color;
  final double width;
  final double height;
  final double borderRadius;
  final double top;
  final double bottom;
  const Button(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.color,
      required this.width,
      required this.height,
      required this.borderRadius,
      required this.top,
      required this.bottom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: top, bottom: bottom),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(color),
              padding: MaterialStateProperty.all(EdgeInsets.all(0.0)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius)),
              )),
          child: Container(
              alignment: Alignment.center,
              constraints: BoxConstraints(maxWidth: width, maxHeight: height),
              child: Text(text,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white))),
        ));
  }
}
