// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '/core/helper/color.dart';

class AppMainButton extends StatelessWidget {
  String buttontext;
  dynamic onPressed;

  AppMainButton({super.key, required this.buttontext, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height / 14,
      width: width / 1.25,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: CustomColors.authbuttoncolor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
          onPressed: onPressed,
          child: Text(
            buttontext,
            style: const TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.w400),
          )),
    );
  }
}
