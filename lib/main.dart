import 'package:flutter/material.dart';
import 'package:food_feed/app_screens/not_found_Screen/not_found.dart';
import 'package:food_feed/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_strategy/url_strategy.dart';
import 'bindings/app_state_binding.dart';

void main() {
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Food Feed',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      initialBinding: AppStateBindings(),
      unknownRoute: GetPage(name: "/notfound", page: () => Error404Screen2()),
      initialRoute: AppPages.INITIALPAGE,
      getPages: AppPages.ROUTES,
    );
  }
}
