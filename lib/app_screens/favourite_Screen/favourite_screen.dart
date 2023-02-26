import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_feed/app_screens/home_screen/item_detail_page.dart';
import 'package:food_feed/model/item_model.dart';
import 'package:food_feed/widget/CustomAppBar.dart';
import 'package:food_feed/widget/reusable_gridview.dart';
import 'package:get/get.dart';

class FavouriteScreen extends StatelessWidget {
  static const String PAGE_NAME = "FavouritePage";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomAppbar(
        title: Text(
          "Favourite",
          style: theme.headline6,
        ),
      ),
      body: FutureBuilder<List<Items>>(
          future: compute(getFavouriteItems, {
            "model": Items.getItems,
          }),
          builder: (context, snapshot) {
            print(snapshot.hasData);
            if (!snapshot.hasData) {
              return Center(
                child: CupertinoActivityIndicator(
                  radius: 18,
                ),
              );
            }
            return ReusableGridView(
                data: snapshot.data!,
                theme: theme,
                onTap: (index) {
                  Get.toNamed(ItemDetailPage.PAGE_NAME, arguments: {
                    "item": snapshot.data![index],
                  });
                });
          }),
    );
  }

  static List<Items> getFavouriteItems(Map<String, dynamic> categories) {
    List<Items> favItems = categories['model']
        .where((element) => element.isFavourite == true)
        .toList();
    print(favItems);
    return favItems;
  }
}
