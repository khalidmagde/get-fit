import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_fit/constants/screenutil.dart';
import 'package:get_fit/constants/space.dart';
import 'package:get_fit/presentation/screens/home_screen.dart';
import 'package:get_fit/presentation/screens/intro_screens/AuthController/auth_cubit.dart';
import 'package:lottie/lottie.dart';

import '../../../constants/text_styles.dart';
import '../../widgets/main_button.dart';
import '../../widgets/register_text_field.dart';
import 'login_screen.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: BlocProvider(
        create: (context) => AuthCubit(),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is SignUpFailedState) {
              print(state.msg);
              Fluttertoast.showToast(msg: "login failed");
            }
            if (state is SignUpSuccessState) {
              Fluttertoast.showToast(msg: "login success");

              Get.offAll(const HomeScreen());
            }
          },
          builder: (context, state) {
            final cubit = AuthCubit.get(context);

            return Form(
              key: cubit.signUpFormKey,
              child: ListView(
                padding: EdgeInsets.symmetric(
                    horizontal: width(15), vertical: height(70)),
                children: <Widget>[
                  Text(
                    'Create Your Account',
                    style: registerScreensTitle,
                  ),
                  const Space(
                    boxHeight: 40,
                  ),
                  RegisterTextField(
                    controller: cubit.signUpUserNameController,
                    labelText: "User Name",
                    isSecure: false,
                    prefixIcon: Icons.person,
                    suffixVisible: false,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'This field is required';
                      }
                      if (value.trim().length < 4) {
                        return 'Username must be at least 4 characters in length';
                      }
                      return null;
                    },
                  ),
                  RegisterTextField(
                    controller: cubit.signUpEmailController,
                    labelText: "Email",
                    isSecure: false,
                    prefixIcon: Icons.email_outlined,
                    suffixVisible: false,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'email must not be empty';
                      } else if (!value.contains('@')) {
                        return 'please enter a valid email';
                      } else {
                        return null;
                      }
                    },
                  ),
                  RegisterTextField(
                    controller: cubit.signUpPasswordController,
                    labelText: "Password",
                    isSecure: true,
                    prefixIcon: Icons.lock,
                    suffixVisible: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'password must not be empty';
                      } else if (value.length < 6) {
                        return 'password must be at least 8 characters';
                      } else {
                        return null;
                      }
                    },
                  ),
                  RegisterTextField(
                    controller: cubit.signUpConfirmPassword,
                    labelText: "Confirm password",
                    isSecure: true,
                    prefixIcon: Icons.lock,
                    suffixVisible: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'password must not be empty';
                      } else if (value.length < 6) {
                        return 'password must be at least 8 characters';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const Space(
                    boxHeight: 40,
                  ),
                  state is SignUpLoadingState
                      ? const CupertinoActivityIndicator(
                          radius: 16.0,
                          animating: true,
                        )
                      : MainButton(
                          text: 'Sign Up',
                          onPressed: () => cubit.signUpWithEmail(),
                        ),
                  const Space(
                    boxHeight: 15,
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Get.offAll(const LoginPage());
                      },
                      child: const Text(
                        "already i have an account",
                        style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                  const Space(
                    boxHeight: 15,
                  ),
                  Center(
                    child: Text(
                      'Or Sign up with',
                      style: labelTextField,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: screenHeight * 0.055,
                          child: Lottie.asset('assets/lotties/facebook.json')),
                      const Space(
                        boxWidth: 15,
                      ),
                      SizedBox(
                          height: screenHeight * 0.055,
                          child: Lottie.asset('assets/lotties/google.json')),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      )),
    );
  }
}
