import 'package:flutter/material.dart';
import 'package:food_feed/utils/size_config.dart';
import 'package:food_feed/widget/reusable_button.dart';
import 'package:food_feed/widget/reusable_sized_box.dart';
import 'package:food_feed/widget/reusable_textfield.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

class ForgetScreen extends StatefulWidget {
  static const String PAGE_NAME = "ForgetPasswordPage";

  @override
  _ForgetScreenState createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  FocusNode _emailNode = new FocusNode();
  FocusNode _passwordNode = new FocusNode();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      ),
      body: ListView(
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
                    child: Text('Forget Password',
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
                        hintText: 'E-mail',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 9.0, bottom: 40),
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
                          hintText: 'Enter New Password',
                          showPasswordEye: true,
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
                            } else {
                              print("The form in invalid");
                            }
                          },
                          text: "Save"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
