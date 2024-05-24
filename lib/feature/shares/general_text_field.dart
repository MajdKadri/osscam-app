import 'package:flutter/material.dart';

import '../../core/helper/color.dart';

class GeneralTextField extends StatelessWidget {
  TextEditingController controller;

  GeneralTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
        height: height / 19,
        width: width / 1.3,
        child: TextField(
            controller: controller,
            decoration: const InputDecoration(
                filled: true,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                fillColor: CustomColors.authTextfieldColor)));
  }
}
