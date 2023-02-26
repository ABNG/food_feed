import 'package:flutter/material.dart';
import 'package:food_feed/view_order/view_order_Screen.dart';
import 'package:food_feed/widget/CustomAppBar.dart';
import 'package:food_feed/widget/reusable_sized_box.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  static const String PAGE_NAME = "ProfilePage";
  final List<_ProfileOptions> options = [
    _ProfileOptions(
      leading: Icon(
        Icons.reorder,
        size: 30,
      ),
      text: "View Orders",
      trailing: Icon(Icons.arrow_forward_ios),
    ),
    // _ProfileOptions(
    //   leading: Icon(
    //     Icons.notifications,
    //     size: 30,
    //   ),
    //   text: "Notification",
    //   trailing: Icon(Icons.arrow_forward_ios),
    // ),
    _ProfileOptions(
      leading: Image.asset(
        'assets/icons/language.png',
        width: 30,
      ),
      text: "Change Language",
      trailing: Icon(Icons.arrow_forward_ios),
    ),
    _ProfileOptions(
      leading: Image.asset(
        'assets/icons/support.png',
        width: 30,
      ),
      text: "Support",
      trailing: Icon(Icons.arrow_forward_ios),
    ),
    _ProfileOptions(
      leading: Icon(
        Icons.power_settings_new,
        color: Colors.red,
        size: 30,
      ),
      text: "Log Out",
      trailing: Icon(Icons.arrow_forward_ios),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomAppbar(),
      body: ListView(
        children: [
          const ReusableSizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/welcome-unscreen.gif',
                width: 120,
                height: 120,
              ),
              RichText(
                text: TextSpan(
                  text: 'Welcome, ',
                  style: theme.headline5?.copyWith(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  children: [
                    TextSpan(
                      text: 'Investor',
                      style: theme.headline5?.copyWith(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const ReusableSizedBox(
            height: 50,
          ),
          for (int i = 0; i < options.length; i++)
            _ReusableContainer(
              leading: options[i].leading,
              text: options[i].text,
              trailing: options[i].trailing,
              onTap: () {
                switch (options[i].text) {
                  case "View Orders":
                    Get.toNamed(ViewOrderScreen.PAGE_NAME);
                    break;
                  case "Change Language":
                    break;
                  case "Support":
                    break;
                  case "Log Out":
                    break;
                }
              },
            ),
          const ReusableSizedBox(
            height: 120,
          ),
          Image.asset(
            'assets/icons/foodfeed3.png',
            // fit: BoxFit.cover,
            width: 60,
            height: 60,
          ),
        ],
      ),
    );
  }
}

class _ReusableContainer extends StatelessWidget {
  final Widget leading;
  final String text;
  final Widget trailing;
  final Function() onTap;

  _ReusableContainer(
      {required this.leading,
      required this.text,
      required this.trailing,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[200]!,
          ),
        ),
      ),
      child: ListTile(
        leading: leading,
        title: Text(
          "$text",
          style: theme.bodyText1?.copyWith(
            fontSize: 16,
          ),
        ),
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }
}

class _ProfileOptions {
  final Widget leading;
  final String text;
  final Widget trailing;

  _ProfileOptions(
      {required this.leading, required this.text, required this.trailing});
}
