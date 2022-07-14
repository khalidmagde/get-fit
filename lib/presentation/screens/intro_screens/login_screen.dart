import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_fit/constants/screenutil.dart';
import 'package:get_fit/constants/space.dart';
import 'package:get_fit/presentation/screens/home_screen.dart';
import 'package:get_fit/presentation/screens/intro_screens/AuthController/auth_cubit.dart';
import 'package:get_fit/presentation/screens/intro_screens/signup_screen.dart';
import 'package:get_fit/presentation/widgets/main_button.dart';
import 'package:lottie/lottie.dart';

import '../../../constants/text_styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: BlocProvider(
        create: (context) => AuthCubit(),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is LoginFailedState) {
              Fluttertoast.showToast(msg: "login failed");
            }
            if (state is LoginSuccessState) {
              Fluttertoast.showToast(msg: "login success");
              Get.offAll(const HomeScreen());
            }
          },
          builder: (context, state) {
            final cubit = AuthCubit.get(context);

            return Form(
              key: cubit.loginFormKey,
              child: ListView(
                padding: EdgeInsets.symmetric(
                    horizontal: width(15), vertical: height(100)),
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Log In',
                    style: registerScreensTitle,
                  ),
                  const Space(boxHeight: 100),
                  // padding: const EdgeInsets.all(10),
                  TextFormField(
                    controller: cubit.loginEmailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'email must not be empty';
                      } else if (!value.contains('@')) {
                        return 'please enter a valid email';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      border: const OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      labelText: 'Email',
                      labelStyle: labelTextField,
                    ),
                  ),
                  const Space(
                    boxHeight: 20,
                  ),
                  TextFormField(
                    obscureText: _isObscure,
                    controller: cubit.loginPasswordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'password must not be empty';
                      } else if (value.length < 6) {
                        return 'password must be at least 8 characters';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(_isObscure
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () => setState(() {
                            _isObscure = !_isObscure;
                          }),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                        labelText: 'Password',
                        labelStyle: labelTextField),
                  ),
                  const Space(boxHeight: 70),
                  state is LoginLoadingState
                      ? const CupertinoActivityIndicator(
                          radius: 16.0,
                          animating: true,
                        )
                      : MainButton(
                          text: 'Login',
                          onPressed: () => cubit.loginWithEmail(),
                        ),
                  const Space(
                    boxHeight: 50,
                  ),
                  Center(
                    child: Text(
                      'Or Log in with',
                      style: labelTextField,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: screenHeight * 0.055,
                        child: Lottie.asset('assets/lotties/facebook.json'),
                      ),
                      const Space(
                        boxWidth: 15,
                      ),
                      SizedBox(
                        height: screenHeight * 0.055,
                        child: Lottie.asset('assets/lotties/google.json'),
                      ),
                    ],
                  ),
                  const Space(
                    boxHeight: 30,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Does not have account?',
                        style: labelTextField,
                      ),
                      // ignore: deprecated_member_use
                      FlatButton(
                        textColor: Colors.blue,
                        child: const Text(
                          'SignUp',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          Get.offAll(const SignupPage());
                          //signup screen
                        },
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
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
