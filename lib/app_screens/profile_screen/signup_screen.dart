import 'package:flutter/material.dart';
import 'package:food_feed/utils/size_config.dart';
import 'package:food_feed/widget/reusable_button.dart';
import 'package:food_feed/widget/reusable_sized_box.dart';
import 'package:food_feed/widget/reusable_textfield.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

class SignUpScreen extends StatefulWidget {
  static const String PAGE_NAME = "SignUpPage";

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _confirmPasswordController =
      new TextEditingController();
  FocusNode _nameNode = new FocusNode();
  FocusNode _emailNode = new FocusNode();
  FocusNode _passwordNode = new FocusNode();
  FocusNode _confirmPasswordNode = new FocusNode();
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
                    child: Text('Register',
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
                          _nameNode.requestFocus();
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
                      ReusableTextField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                        onEditingComplete: () {
                          _passwordNode.requestFocus();
                        },
                        focusNode: _nameNode,
                        controller: _nameController,
                        keyboardType: TextInputType.text,
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(top: 10, right: 20),
                          child: Image.asset('assets/images/user.png',
                              height: 4,
                              width: 4,
                              color: Theme.of(context).primaryColor),
                        ),
                        hintText: 'Name',
                      ),
                      ReusableTextField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                        onEditingComplete: () {
                          _confirmPasswordNode.requestFocus();
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
                        hintText: 'Password',
                        showPasswordEye: true,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40.0, top: 9),
                        child: ReusableTextField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Required';
                            } else if (value != _passwordController.text) {
                              return 'Password and confirm password are not same';
                            }
                          },
                          onEditingComplete: () {
                            FocusScope.of(context).unfocus();
                          },
                          focusNode: _confirmPasswordNode,
                          controller: _confirmPasswordController,
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
                          hintText: 'Confirm password',
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
                          text: "Register")
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
