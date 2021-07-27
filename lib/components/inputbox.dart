import 'dart:convert';

import 'package:dtagapp/data/data_api.dart';
import 'package:dtagapp/data/data_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../color_utils.dart';
import 'package:intl/intl.dart';

var now = new DateTime.now();
var formatter = new DateFormat('dd MMM yyyy');
String formattedDate = formatter.format(now);
TextEditingController inputController = new TextEditingController();

class ShowDate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Padding(
          padding: EdgeInsets.only(right: 10, left: 50),
          child: Text('Date',
              style: GoogleFonts.nunito(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white))),
      Container(
        width: 90,
        height: 25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            formattedDate,
            style: GoogleFonts.nunito(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      Padding(padding: EdgeInsets.only(bottom: 50)),
    ]);
  }
}

class WhiteInputBox extends StatelessWidget {
  final String label;
  final String hint;
  final double width;

  const WhiteInputBox(
      {Key? key, required this.label, required this.hint, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Padding(
          padding: EdgeInsets.only(right: 5, left: 5),
          child: Text(label,
              style: GoogleFonts.nunito(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white))),
      SizedBox(
        width: width,
        height: 25,
        child: TextFormField(
          style: GoogleFonts.nunito(fontSize: 14, fontWeight: FontWeight.w600),
          decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.only(left: 10),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide.none)),
        ),
      ),
      Padding(padding: EdgeInsets.only(bottom: 50)),
    ]);
  }
}

class InputBox extends StatelessWidget {
  final String label;
  final String hint;
  final double width;
  final TextEditingController? ctrl;

  const InputBox(
      {Key? key,
      required this.label,
      required this.hint,
      required this.width,
      this.ctrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Padding(
          padding: EdgeInsets.only(right: 5, left: 5),
          child: Text(label,
              style: GoogleFonts.nunito(
                  fontSize: 14, fontWeight: FontWeight.w600))),
      SizedBox(
        width: width,
        height: 25,
        child: TextFormField(
          controller: ctrl,
          style: GoogleFonts.nunito(fontSize: 14, fontWeight: FontWeight.w600),
          decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: ColorUtils.skyblue,
              contentPadding: EdgeInsets.only(left: 10),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide.none)),
        ),
      ),
      Padding(padding: EdgeInsets.only(bottom: 50)),
    ]);
  }
}

class QtyBox extends StatelessWidget {
  final String label;
  final TextEditingController? ctrl;
  const QtyBox({Key? key, required this.label, this.ctrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: GoogleFonts.nunito(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
              width: 100,
              height: 50,
              child: TextField(
                controller: ctrl,
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                    fontSize: 20, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 10),
                    filled: true,
                    fillColor: ColorUtils.skyblue,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none)),
              ))
        ]);
  }
}
