import 'package:flutter/material.dart';

import '../../core/helper/color.dart';
import '../../core/helper/strings.dart';
import 'general_text_field.dart';
import 'password_textfield.dart';
import 'remember_me_widget.dart';

class SignInContainer extends StatelessWidget {
  double customheight;

  TextEditingController emailcontroller;
  TextEditingController passwordcontroller;

  SignInContainer({
    super.key,
    required this.customheight,
    required this.emailcontroller,
    required this.passwordcontroller,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
            SizedBox(
              height: height * 0.03,
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
            SizedBox(
              height: height * 0.05,
            ),
            RememberMeWidget(),
          ],
        ),
      ),
    );
  }
}
