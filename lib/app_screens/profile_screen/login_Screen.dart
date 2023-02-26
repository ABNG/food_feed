import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_feed/app_screens/profile_screen/forget_password.dart';
import 'package:food_feed/app_screens/profile_screen/profile_screen.dart';
import 'package:food_feed/app_screens/profile_screen/signup_screen.dart';
import 'package:food_feed/utils/size_config.dart';
import 'package:food_feed/widget/reusable_button.dart';
import 'package:food_feed/widget/reusable_sized_box.dart';
import 'package:food_feed/widget/reusable_textfield.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  static const String PAGE_NAME = "LoginPage";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  FocusNode _emailNode = new FocusNode();
  FocusNode _passwordNode = new FocusNode();
  bool isLoading = false;

  @override
  void initState() {
    if (kDebugMode) {
      _emailController.text = "test@t.com";
      _passwordController.text = "test";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const ReusableSizedBox(
          height: 100,
        ),
        Image.asset(
          'assets/icons/foodfeed3.png',
          width: 120,
          height: 120,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Login',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          color: Theme.of(context).primaryColor)),
                ),
              ),
              const ReusableSizedBox(
                height: 10,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    ReusableTextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Required';
                        } else if (!GetUtils.isEmail(value)) {
                          return 'Please enter a valid email.';
                        }
                        return null;
                      },
                      onEditingComplete: () {
                        _passwordNode.requestFocus();
                      },
                      focusNode: _emailNode,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(top: 18, right: 20),
                        child: Image.asset('assets/images/e-mail.png',
                            height: 5,
                            width: 5,
                            color: Theme.of(context).primaryColor),
                      ),
                      hintText: 'Enter your e-mail',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40.0, top: 9),
                      child: ReusableTextField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                        onEditingComplete: () {
                          FocusScope.of(context).unfocus();
                        },
                        focusNode: _passwordNode,
                        controller: _passwordController,
                        keyboardType: TextInputType.text,
                        ispass: true,
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(
                            top: 8,
                            right: 20,
                          ),
                          child: Image.asset('assets/images/password.png',
                              height: 4,
                              width: 4,
                              color: Theme.of(context).primaryColor),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(left: 6.0, top: 20),
                          child: InkResponse(
                            onTap: () {
                              Get.toNamed(ForgetScreen.PAGE_NAME);
                            },
                            child: Text(
                              'Forgot?',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                        ),
                        hintText: 'Enter your password',
                      ),
                    ),
                    const ReusableSizedBox(
                      height: 10,
                    ),
                    ReusableButton(
                        width: SizeConfig.screenWidth * 0.8,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            print('The form is valid');
                            Get.toNamed(ProfileScreen.PAGE_NAME);
                          } else {
                            print("The form in invalid");
                          }
                        },
                        text: "Login")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('New to Food Feed?',
                        style:
                            TextStyle(color: Theme.of(context).primaryColor)),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(SignUpScreen.PAGE_NAME);
                      },
                      child: Text('Register',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w900)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
