import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../core/helper/color.dart';

class AccountExistence extends StatelessWidget {
  String accountExistenceMessage;
  String routingMessage;

  Widget routingWidget;

  AccountExistence(
      {super.key,
      required this.accountExistenceMessage,
      required this.routingWidget,
      required this.routingMessage});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(text: accountExistenceMessage, children: [
        WidgetSpan(
            child: SizedBox(
          width: 8,
        )),
        TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => routingWidget,
                  )),
            text: routingMessage,
            style: TextStyle(color: CustomColors.authTextfieldColor))
      ]),
    );
  }
}
