import 'package:flutter/material.dart';

import '../../core/helper/color.dart';
import '../../core/helper/globals.dart';
import '../../core/helper/strings.dart';
import 'general_text_field.dart';
import 'password_textfield.dart';
import 'remember_me_widget.dart';

import '../../main.dart';

bool rememberme = false;

class SignUpContainer extends StatelessWidget {
  double customheight;
  TextEditingController firstnamecontroller;
  TextEditingController lastnamecontroller;
  TextEditingController emailcontroller;
  TextEditingController passwordcontroller;

  SignUpContainer({
    super.key,
    required this.customheight,
    required this.firstnamecontroller,
    required this.lastnamecontroller,
    required this.emailcontroller,
    required this.passwordcontroller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width / 1.5,
      height: height / customheight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: CustomColors.authBoardColor,
      ),
      child: Padding(
        padding: EdgeInsets.only(
            left: width / 10.4, top: height / 10, right: width / 10.4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: width / 50),
              child: Text(
                CustomStrings.firstName,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height / 120),
              child: GeneralTextField(controller: firstnamecontroller),
            ),
            Spacer(
              flex: 2,
            ),
            Padding(
              padding: EdgeInsets.only(left: width / 50),
              child: Text(
                CustomStrings.lastName,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height / 120),
              child: GeneralTextField(controller: lastnamecontroller),
            ),
            Spacer(
              flex: 2,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: width / 50,
              ),
              child: Text(
                CustomStrings.email,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height / 120),
              child: GeneralTextField(controller: emailcontroller),
            ),
            Spacer(
              flex: 2,
            ),
            Padding(
              padding: EdgeInsets.only(left: width / 50),
              child: Text(
                CustomStrings.password,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height / 120),
              child: PasswordTextField(
                passwordcontroller: passwordcontroller,
              ),
            ),
            Spacer(
              flex: 2,
            ),
            RememberMeWidget(),
            Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
