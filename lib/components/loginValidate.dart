import 'package:dtagapp/components/button.dart';
import 'package:dtagapp/screen/home.dart';
import 'package:flutter/material.dart';
import '../color_utils.dart';

class LoginValidate extends StatefulWidget {
  static String username = 'username';
  @override
  _LoginValidateState createState() => _LoginValidateState();
}

class _LoginValidateState extends State<LoginValidate> {
  final formKey = GlobalKey<FormState>();
  late String password;

  
  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 45),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter username';
                  }
                  LoginValidate.username = value;
                  return null;
                },
                obscureText: false,
                decoration: InputDecoration(
                  prefixIconConstraints:
                      BoxConstraints(minWidth: 0, maxHeight: 50),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(right: 2),
                    child: Icon(
                      Icons.person,
                      color: ColorUtils.blue,
                      size: 15,
                    ),
                  ),
                  labelText: 'Username',
                  labelStyle: TextStyle(color: ColorUtils.blue, fontSize: 14),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorUtils.blue),
                  ),
                ),
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: ColorUtils.sblue),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 45),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter password';
                  } else if (value != 'admin' || LoginValidate.username != 'admin') {
                    return 'Incorrect username or password';
                  }
                  return null;
                },
                
                obscureText: true,
                decoration: InputDecoration(
                  prefixIconConstraints:
                      BoxConstraints(minWidth: 0, maxHeight: 50),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(right: 2),
                    child: Icon(
                      Icons.lock,
                      color: ColorUtils.blue,
                      size: 15,
                    ),
                  ),
                  labelText: 'Password',
                  labelStyle: TextStyle(color: ColorUtils.blue, fontSize: 14),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorUtils.blue),
                  ),
                ),
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: ColorUtils.sblue),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 25),child: 
            GradientButton(onPressed: (){ 
                if (formKey.currentState!.validate()) {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ));
                } 
              }
                          , text: 'LOGIN')
            )
          ],
        ));
  }
}
