import 'package:food_feed/app_screens/address_Screen/add_address.dart';
import 'package:food_feed/app_screens/bottom_app_bar/bottom_app_bar.dart';
import 'package:food_feed/app_screens/home_screen/item_detail_page.dart';
import 'package:food_feed/app_screens/profile_screen/forget_password.dart';
import 'package:food_feed/app_screens/profile_screen/profile_screen.dart';
import 'package:food_feed/app_screens/profile_screen/signup_screen.dart';
import 'package:food_feed/view_order/track_order_Screen.dart';
import 'package:food_feed/view_order/view_order_Screen.dart';

import 'package:get/get.dart';

class AppPages {
  static final String INITIALPAGE = BottomAppBarScreen.PAGE_NAME;
  static List<GetPage> get ROUTES => [
        GetPage(
          name: BottomAppBarScreen.PAGE_NAME,
          page: () => BottomAppBarScreen(),
        ),
        GetPage(
          name: ItemDetailPage.PAGE_NAME,
          page: () => ItemDetailPage(),
        ),
        GetPage(
          name: AddAddress.PAGE_NAME,
          page: () => AddAddress(),
        ),
        GetPage(
          name: SignUpScreen.PAGE_NAME,
          page: () => SignUpScreen(),
        ),
        GetPage(
          name: ForgetScreen.PAGE_NAME,
          page: () => ForgetScreen(),
        ),
        GetPage(
          name: ProfileScreen.PAGE_NAME,
          page: () => ProfileScreen(),
        ),
        GetPage(
          name: ViewOrderScreen.PAGE_NAME,
          page: () => ViewOrderScreen(),
        ),
        GetPage(
          name: TrackOrderScreen.PAGE_NAME,
          page: () => TrackOrderScreen(),
        ),
      ];
}
