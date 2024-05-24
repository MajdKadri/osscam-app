import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../core/domain/models/signin_model.dart';
import '../../core/helper/color.dart';
import '../../core/helper/globals.dart';
import '../../core/helper/images.dart';
import '../../core/helper/strings.dart';
import '../../main.dart';
import '../home_page.dart';
import '../shares/account_existence.dart';
import '../shares/app_main_button.dart';
import '../shares/sign_in_container.dart';
import '../signup/signup_page.dart';
import 'login_bloc/login_bloc.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('render');
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: CustomColors.backgroundColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: width,
                  height: height / 1.3,
                  child: Stack(
                    children: [
                      Positioned(
                          top: height / 4.65,
                          left: width / 11.5,
                          right: width / 11.5,
                          child: SignInContainer(
                            passwordcontroller: passwordcontroller,
                            emailcontroller: emailcontroller,
                            customheight: 2.2,
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
                  padding: EdgeInsets.only(bottom: height / 30),
                  child: BlocConsumer<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if (state is Loading) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text('Loading')));
                      } else if (state is ErrorState) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text('Error')));
                      } else if (state is LoggedIn) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text('Success')));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ));
                      }
                    },
                    builder: (context, state) {
                      if (state is Loading) {
                        return CircularProgressIndicator();
                      } else {
                        return AppMainButton(
                          buttontext: CustomStrings.signIn,
                          onPressed: () {
                            context.read<LoginBloc>().add(Login(
                                  signInModel: SignInModel(
                                      email: emailcontroller.text,
                                      password: passwordcontroller.text),
                                ));
                          },
                        );
                      }
                    },
                  ),
                ),
                AccountExistence(
                    routingWidget: SignupPage(),
                    accountExistenceMessage: CustomStrings.alreadyHave,
                    routingMessage: CustomStrings.signUp)
              ],
            ),
          ),
        );
      }),
    );
  }
}
