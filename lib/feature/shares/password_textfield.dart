import 'package:flutter/material.dart';

import '../../core/helper/color.dart';

class PasswordTextField extends StatefulWidget {
  TextEditingController passwordcontroller;

  PasswordTextField({super.key, required this.passwordcontroller});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  @override
  void initState() {
    passwordvisible = true;
  }

  late bool passwordvisible;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
        height: height / 19,
        width: width / 1.3,
        child: TextField(
            enableInteractiveSelection: false,
            obscureText: passwordvisible,
            controller: widget.passwordcontroller,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        passwordvisible = !passwordvisible;
                      });
                    },
                    icon: passwordvisible
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility)),
                filled: true,
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                fillColor: CustomColors.authTextfieldColor)));
  }
}
