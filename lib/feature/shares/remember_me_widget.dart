import 'package:flutter/material.dart';
import '../../core/helper/color.dart';
import '../../core/helper/strings.dart';
import 'sign_up_container.dart';

class RememberMeWidget extends StatefulWidget {
  RememberMeWidget({super.key});

  @override
  State<RememberMeWidget> createState() => _RememberMeWidgetState();
}

class _RememberMeWidgetState extends State<RememberMeWidget> {
  @override
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 1.5,
          child: Checkbox(
            activeColor: CustomColors.authTextfieldColor,
            side: const BorderSide(width: 0, color: CustomColors.checkcolor),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            fillColor: MaterialStateProperty.resolveWith((states) {
              if (!states.contains(MaterialState.selected)) {
                return CustomColors.checkcolor;
              }
            }),
            value: rememberme,
            onChanged: (value) {
              setState(() {
                rememberme = value!;
              });
            },
          ),
        ),
        Text(CustomStrings.remember)
      ],
    );
  }
}
