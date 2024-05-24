import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../core/helper/color.dart';
import '../core/helper/globals.dart';
import '../core/helper/images.dart';
import '../core/helper/strings.dart';
import '../main.dart';
import 'create_project/create_project.dart';
import 'shares/app_main_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      body: SingleChildScrollView(
        child: SizedBox(
          width: width,
          height: height,
          child: Column(
            children: [
              SizedBox(
                  width: width / 1.2,
                  height: height / 2,
                  child: CustomImages.appLogo),
              AppMainButton(
                  buttontext: CustomStrings.create,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateProjectPage(),
                        ));
                  }),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: DottedBorder(
                    color: Colors.white,
                    dashPattern: [12],
                    radius: Radius.circular(15),
                    borderType: BorderType.RRect,
                    child: InkWell(
                      child: SizedBox(
                          width: width / 1.25,
                          height: height / 14,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 25),
                                child: CustomImages.addIcon,
                              ),
                              Text(
                                CustomStrings.join,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          )),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
