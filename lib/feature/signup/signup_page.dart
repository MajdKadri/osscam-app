import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/domain/models/signup_model.dart';
import '../../core/helper/color.dart';
import '../../core/helper/globals.dart';
import '../../core/helper/images.dart';
import '../../core/helper/strings.dart';
import '../../main.dart';
import '../home_page.dart';
import '../login/login_page.dart';
import '../shares/account_existence.dart';
import '../shares/app_main_button.dart';
import '../shares/sign_up_container.dart';
import 'signup_bloc/sign_up_bloc.dart';

class SignupPage extends StatefulWidget {
  SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController firstnamecontroller = TextEditingController();

  TextEditingController lastnamecontroller = TextEditingController();

  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: CustomColors.backgroundColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: width,
                  height: height / 1.25,
                  child: Stack(
                    children: [
                      Positioned(
                          top: height / 4.65,
                          left: width / 11.5,
                          right: width / 11.5,
                          child: SignUpContainer(
                            passwordcontroller: passwordcontroller,
                            emailcontroller: emailcontroller,
                            customheight: 1.8,
                            firstnamecontroller: firstnamecontroller,
                            lastnamecontroller: lastnamecontroller,
                          )),
                      Positioned(
                        child: CustomImages.yeti,
                        top: height / 8.5,
                        left: width / 4,
                        right: width / 4,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: height / 50, bottom: height / 30),
                  child: BlocConsumer<SignUpBloc, SignUpState>(
                    listener: (context, state) {
                      if (state is SuccessStateSignup) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text('Success')));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ));
                      } else if (state is LoadingStateSignup) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text('Loading')));
                      }
                    },
                    builder: (context, state) {
                      print(state.toString());
                      if (state is SignUpInitial) {
                        return AppMainButton(
                          buttontext: CustomStrings.signUp,
                          onPressed: () {
                            context.read<SignUpBloc>().add(SignUp(
                                signupModel: (SignupModel(
                                    firstName: firstnamecontroller.text,
                                    lastName: lastnamecontroller.text,
                                    password: passwordcontroller.text,
                                    email: emailcontroller.text))));
                          },
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                ),
                AccountExistence(
                    routingWidget: SignInPage(),
                    accountExistenceMessage: CustomStrings.donthaveaccount,
                    routingMessage: CustomStrings.login)
              ],
            ),
          ),
        );
      }),
    );
  }
}
