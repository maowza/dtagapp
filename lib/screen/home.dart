import 'package:flutter/material.dart';
import 'package:dtagapp/screen/login.dart';
import 'package:dtagapp/screen/tag_info.dart';
import 'package:dtagapp/screen/tag_regis.dart';
import 'package:dtagapp/components/loginValidate.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isRadioSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Home.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 35, left: 40),
              child: Text('Plant',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
            LabeledRadio(
                plant: 1211,
                padding: EdgeInsets.only(top: 28),
                groupValue: _isRadioSelected,
                value: true,
                onChanged: (bool newValue) {
                  setState(() {
                    _isRadioSelected = newValue;
                  });
                }),
            LabeledRadio(
                plant: 1212,
                padding: EdgeInsets.only(top: 28),
                groupValue: _isRadioSelected,
                value: false,
                onChanged: (bool newValue) {
                  setState(() {
                    _isRadioSelected = newValue;
                  });
                }),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                },
                child: Text('logout',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        decoration: TextDecoration.underline)),
              ),
            ),
          ]),
          Padding(
            padding: EdgeInsets.only(left: 40, bottom: 35),
            child: Text('User : ${LoginValidate.username}',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: ActivityButton(
                      icn: 'assets/icons/tagi.png',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TagInfo(),
                            ));
                      })),
              Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: ActivityButton(
                    icn: 'assets/icons/tag register.png',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TagRegis(),
                          ));
                    },
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: ActivityButton(
                    icn: 'assets/icons/receive.png',
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: ActivityButton(
                    icn: 'assets/icons/sell.png',
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 55),
                  child: ActivityButton(
                    icn: 'assets/icons/Transfer.png',
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 55),
                  child: ActivityButton(
                    icn: 'assets/icons/count.png',
                  )),
            ],
          ),
        ],
      ),
    ));
  }
}

class ActivityButton extends StatelessWidget {
  final String icn;
  final VoidCallback? onPressed;
  const ActivityButton({
    Key? key,
    required this.icn,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.all(0.0)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))),
      child: Container(
        width: 105,
        height: 95,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(icn),
          fit: BoxFit.cover,
        )),
      ),
    );
  }
}

class LabeledRadio extends StatelessWidget {
  const LabeledRadio(
      {Key? key,
      required this.padding,
      required this.groupValue,
      required this.value,
      required this.onChanged,
      required this.plant})
      : super(key: key);

  final EdgeInsets padding;
  final bool groupValue;
  final bool value;
  final Function onChanged;
  final int plant;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) {
          onChanged(value);
        }
      },
      child: Padding(
        padding: padding,
        child: Row(children: <Widget>[
          Transform.scale(
            scale: 0.6,
            child: Radio<bool>(
              splashRadius: 0,
              fillColor: MaterialStateProperty.all<Color>(Colors.black),
              groupValue: groupValue,
              value: value,
              onChanged: (bool? newValue) {
                onChanged(newValue);
              },
            ),
          ),
          Text(plant.toString(),
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
        ]),
      ),
    );
  }
}
