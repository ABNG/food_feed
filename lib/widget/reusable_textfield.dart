import 'package:flutter/material.dart';

class ReusableTextField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function() onEditingComplete;
  final FocusNode? focusNode;
  final bool ispass;
  final TextInputType? keyboardType;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool showPasswordEye;

  ReusableTextField(
      {this.hintText,
      this.controller,
      required this.validator,
      required this.onEditingComplete,
      this.focusNode,
      this.prefix,
      this.prefixIcon,
      this.suffixIcon,
      this.showPasswordEye = false,
      this.ispass = false,
      this.keyboardType});

  @override
  _ReusableTextFieldState createState() => _ReusableTextFieldState();
}

class _ReusableTextFieldState extends State<ReusableTextField> {
  late bool _passwordVisible;
  @override
  void initState() {
    // TODO: implement initState
    _passwordVisible = widget.ispass;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      textInputAction: TextInputAction.next,
      focusNode: widget.focusNode,
      onEditingComplete: widget.onEditingComplete,
      validator: widget.validator,
      obscureText: _passwordVisible,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 20),
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        prefix: widget.prefix,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.showPasswordEye
            ? Padding(
                padding: const EdgeInsets.only(top: 13.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                  child: Icon(_passwordVisible
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined),
                ))
            : widget.suffixIcon,
      ),
    );
  }
}
