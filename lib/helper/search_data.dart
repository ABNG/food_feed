import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_feed/app_screens/home_screen/item_detail_page.dart';
import 'package:food_feed/model/item_model.dart';
import 'package:food_feed/widget/reusable_gridview.dart';
import 'package:get/get.dart';

class SearchData extends SearchDelegate<Items?> {
  List<Items> itemList = [];
  List<Items> filteritemList = [];
  @override
  List<Widget> buildActions(BuildContext context) {
    //action for appbar

    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //leading icon on left of appbar
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    //show some result based on selection
    return suggestion(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //show when someone searches for something
    return SizedBox.shrink();
  }

  Widget suggestion(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    if (itemList.isEmpty) itemList = Items.getItems;
    filteritemList = query.isEmpty
        ? [] //itemList
        : itemList
            .where((element) =>
                element.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
    return filteritemList.isEmpty
        ? Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 2 - 120),
            child: Center(child: Text("No Product Available")))
        : ReusableGridView(
            data: filteritemList,
            theme: theme,
            onTap: (index) {
              Get.toNamed(ItemDetailPage.PAGE_NAME, arguments: {
                "item": filteritemList[index],
              });
            });
    // ),
    //),
  }
}
