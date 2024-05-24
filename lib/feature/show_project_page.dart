import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_managment_bloc_riverpod/feature/login/login_page.dart';
import 'package:project_managment_bloc_riverpod/feature/logout_bloc/logout_bloc.dart';

import '../core/helper/color.dart';
import '../core/helper/globals.dart';
import '../core/helper/images.dart';
import 'shares/drawer_text_button.dart';

class ShowProject extends StatefulWidget {
  const ShowProject({super.key});

  @override
  State<ShowProject> createState() => _ShowProjectState();
}

class _ShowProjectState extends State<ShowProject> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogoutBloc(),
      child: Builder(
        builder: (context) {
          return Scaffold(
              drawer: Drawer(
                  width: width / 2.5,
                  backgroundColor: CustomColors.drawerColor,
                  child: ListView(
                    children: [
                      SizedBox(
                        height: height / 4,
                        width: width / 4,
                        child: DrawerHeader(
                          child: Column(
                            children: [
                              Spacer(
                                flex: 1,
                              ),
                              SizedBox(child: CustomImages.yeti2),
                              Spacer(
                                flex: 1,
                              ),
                              Text(
                                'Username',
                                style: TextStyle(color: Colors.white),
                              ),
                              Spacer(
                                flex: 3,
                              ),
                            ],
                          ),
                        ),
                      ),
                      DrawerTextButton(
                          text: 'Create & Join',
                          image: CustomImages.linkIcon,
                          ontap: () {}),
                      SizedBox(
                        height: height / 40,
                      ),
                      DrawerTextButton(
                          text: 'Change Language',
                          image: CustomImages.language,
                          ontap: () {}),
                      SizedBox(
                        height: height / 40,
                      ),
                      BlocListener<LogoutBloc, LogoutState>(
                        listener: (context, state) {
                          if (state is Success) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: Colors.green,
                                content: Text('Success')));
                            Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) => SignInPage(),));
                          }
                        },
                        child: DrawerTextButton(
                            text: 'Logout',
                            image: CustomImages.logout,
                            ontap: () {
                              print(token);
                              context.read<LogoutBloc>().add(Logout());
                            }),
                      ),
                      Divider()
                    ],
                  )),
              drawerEnableOpenDragGesture: false,
              backgroundColor: CustomColors.backgroundColor,
              body: SizedBox(
                height: height,
                width: width,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: CustomColors.authTextfieldColor),
                        width: width / 1.1,
                        height: height / 10,
                        child: Row(
                          children: [
                            Builder(builder: (context) {
                              return IconButton(
                                icon: Icon(
                                  Icons.menu,
                                  size: 40,
                                ),
                                onPressed: () {
                                  Scaffold.of(context).openDrawer();
                                },
                              );
                            })
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ));
        }
      ),
    );
  }
}
