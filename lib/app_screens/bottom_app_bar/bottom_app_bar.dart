import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:food_feed/app_screens/cart_screen/cart_screen.dart';
import 'package:food_feed/app_screens/favourite_Screen/favourite_screen.dart';
import 'package:food_feed/app_screens/home_screen/home_screen.dart';
import 'package:food_feed/app_screens/profile_screen/login_Screen.dart';
import 'package:food_feed/controller/change_screen.dart';
import 'package:food_feed/utils/size_config.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class BottomAppBarScreen extends StatelessWidget {
  static const String PAGE_NAME = "/home";
  final changeScreen = Get.find<ChangeScreen>();
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: DoubleBackToCloseApp(
          snackBar: const SnackBar(
            content: Text('Tap again to exit'),
          ),
          child: Obx(
            () => getSelectedPage(changeScreen.index.value),
          ),
        ),
        bottomNavigationBar: GNav(
          padding: EdgeInsets.all(16),
          tabs: [
            GButton(
              icon: LineIcons.home,
              text: 'Home',
              gap: 5,
              backgroundGradient: LinearGradient(
                  colors: [Colors.blue.shade400, Colors.blue.shade200],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.2, 0.9]),
              borderRadius: BorderRadius.circular(12),
              margin: EdgeInsets.only(left: 8, bottom: 5),
              iconActiveColor: Colors.white,
              textColor: Colors.white,
            ),
            GButton(
              icon: LineIcons.heart,
              text: 'Likes',
              gap: 5,
              backgroundGradient: LinearGradient(
                  colors: [Colors.blue.shade400, Colors.blue.shade200],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.2, 0.9]),
              margin: EdgeInsets.only(bottom: 5),
              borderRadius: BorderRadius.circular(12),
              iconActiveColor: Colors.white,
              textColor: Colors.white,
            ),
            GButton(
              icon: LineIcons.shoppingCart,
              text: 'Cart',
              gap: 5,
              backgroundGradient: LinearGradient(
                  colors: [Colors.blue.shade400, Colors.blue.shade200],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.2, 0.9]),
              borderRadius: BorderRadius.circular(12),
              margin: EdgeInsets.only(bottom: 5),
              iconActiveColor: Colors.white,
              textColor: Colors.white,
            ),
            GButton(
              icon: LineIcons.user,
              text: 'Profile',
              gap: 5,
              backgroundGradient: LinearGradient(
                  colors: [Colors.blue.shade400, Colors.blue.shade200],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.2, 0.9]),
              borderRadius: BorderRadius.circular(12),
              margin: EdgeInsets.only(right: 12, bottom: 5),
              iconActiveColor: Colors.white,
              textColor: Colors.white,
            )
          ],
          onTabChange: (int index) {
            changeScreen.index(index);
          },
        ));
  }

  Widget getSelectedPage(int index) {
    switch (index) {
      case 0:
        return HomeScreen();
        break;
//      case 1:
//        return SearchScreen();
//        break;
      case 1:
        return FavouriteScreen();
        break;
      case 2:
        return CartScreen();
        break;
      case 3:
        return LoginScreen();
        break;
//      case 4:
//        return SharedPref.pref.getString('token') == null
//            ? LoginScreen()
//            : ProfileScreen();
//        break;
      default:
        return HomeScreen();
        break;
    }
  }
}
