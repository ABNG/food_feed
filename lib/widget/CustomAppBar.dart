import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? bottom;
  final Widget? title;
  final String? text;
  final List<Widget> actions;
  final Widget? leading;
  final String? backgroundImage;
  final double elevation;

  CustomAppbar(
      {this.bottom,
      this.text,
      this.title,
      this.leading,
      this.backgroundImage,
      this.elevation = 0.0,
      this.actions = const []});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      leading: leading == null && navigator!.canPop()
          ? Platform.isIOS
              ? IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
//                    color:
//                        Provider.of<MyThemeData>(context).gender == Gender.Male
//                            ? textColorMale
//                            : textColorFemale,
                  ),
                  onPressed: () =>
                      navigator!.canPop() ? navigator!.pop() : null,
                )
              : IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: () =>
                      navigator!.canPop() ? navigator!.pop() : null,
                )
          : leading,
      title: title != null
          ? title
          : text != null
              ? Text(
                  text!,
                  style: TextStyle(
//                    color: textColor,
                    fontSize: 20,
                  ),
                )
              : Image.asset(
                  'assets/icons/foodfeed3.png',
                  // fit: BoxFit.cover,
                  width: 60,
                  height: 60,
                ),
      actions: <Widget>[
        ...actions,
      ],
      bottom: bottom == null
          ? null
          : PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight), child: bottom!),
//      flexibleSpace: Container(
//        decoration: BoxDecoration(
//          image: DecorationImage(
//            fit: BoxFit.cover,
//            image: AssetImage(
//                Provider.of<MyThemeData>(context, listen: false).gender ==
//                        Gender.Male
//                    ? 'assets/icons/menstopbanner.png'
//                    : 'assets/icons/womenstopbanner.png'), //backgroundImage
//          ),
//        ),
//      ),
      elevation: elevation,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(bottom != null ? kToolbarHeight + 45 : kToolbarHeight);
}
