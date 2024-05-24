import 'package:flutter/material.dart';

import '../../core/helper/color.dart';
import '../../core/helper/globals.dart';
import '../../main.dart';

class DrawerTextButton extends StatelessWidget {
  String text;
  Image image;
  dynamic ontap;

  DrawerTextButton(
      {required this.text, required this.image, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: ontap,
        child: SizedBox(
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: width / 60, right: width / 60),
                child: image,
              ),
              Text(
                text,
                style: TextStyle(color: CustomColors.authTextfieldColor),
              ),
            ],
          ),
        ));
  }
}
