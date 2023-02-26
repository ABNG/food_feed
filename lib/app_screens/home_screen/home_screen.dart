import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_feed/controller/change_screen.dart';
import 'package:food_feed/helper/search_data.dart';
import 'package:food_feed/model/category_model.dart';
import 'package:food_feed/model/item_model.dart';
import 'package:food_feed/utils/size_config.dart';
import 'package:food_feed/widget/CustomAppBar.dart';
import 'package:food_feed/widget/reusable_gridview.dart';
import 'package:food_feed/widget/reusable_sized_box.dart';
import 'package:get/get.dart';

import 'item_detail_page.dart';

class HomeScreen extends StatelessWidget {
  static const String PAGE_NAME = "HomePage";
  final changeScreen = Get.find<ChangeScreen>();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomAppbar(
        elevation: 0.0,
        title: Text(
          "Home",
          style: theme.headline6,
        ),
        actions: [
          Container(
            width: 45,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              // color: Colors.lightBlueAccent.withOpacity(0.5),
              // borderRadius: BorderRadius.circular(6),
              image: DecorationImage(
                image: AssetImage(
                  'assets/icons/foodfeed3.png',
                ),
                // fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  expandedHeight: 120,
                  backgroundColor: Colors.transparent,
                  flexibleSpace: FittedBox(
                    child: Container(
                      height: 120,
                      width: SizeConfig.screenWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi, Inverness",
                            style: theme.headline5?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const ReusableSizedBox(height: 5),
                          Text("Have a nice Shopping!",
                              style: theme.bodyText1?.copyWith(
                                color: Colors.grey[400],
                                fontWeight: FontWeight.w600,
                              )),
                          const ReusableSizedBox(height: 20),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 40.0),
                            child: InkWell(
                              onTap: () {
                                showSearch(
                                    context: context, delegate: SearchData());
                              },
                              child: IgnorePointer(
                                  ignoring: true,
                                  child: CupertinoSearchTextField()),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ReusableSizedBox(height: 30),
                //add popular items with obx, get name from reusable category and add to obx
                Obx(() {
                  return Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _ReusableCategory(
                          theme: theme,
                          name: changeScreen.name.value,
                        ),
                        const ReusableSizedBox(height: 15),
                        Text(
                          "Popular Items",
                          style: theme.bodyText1?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const ReusableSizedBox(height: 10),
                        Expanded(
                          child: FutureBuilder<List<Items>>(
                              key: UniqueKey(),
                              future: compute(getItems, {
                                "model": Items.getItems,
                                "value": changeScreen.name.value,
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
                                      Get.toNamed(ItemDetailPage.PAGE_NAME,
                                          arguments: {
                                            "item": snapshot.data![index],
                                          });
                                    });
                              }),
                        ),
                      ],
                    ),
                  );
                })
              ],
            ),
          )),
    );
  }

  static List<Items> getItems(Map<String, dynamic> categories) {
    List<Items> popularItems = categories['model']
        .where((element) =>
            element.category.name == categories['value'] &&
            element.isPopular == true)
        .toList();
    print(popularItems);
    return popularItems;
  }
}

class _ReusableCategory extends StatelessWidget {
  _ReusableCategory({
    required this.theme,
    required this.name,
  });
  final theme;
  final String name;

  final changeScreen = Get.find<ChangeScreen>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: CategoryModel.getcategories
            .map(
              (e) => InkResponse(
                onTap: () {
                  changeScreen.setName(e.name);
                },
                child: Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      padding: const EdgeInsets.all(5),
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: name == e.name
                            ? Colors.lightBlueAccent.withOpacity(0.5)
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          '${e.image}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const ReusableSizedBox(height: 5),
                    Text(
                      "${e.name}",
                      style: name == e.name
                          ? theme.bodyText1.copyWith(
                              color: Colors.lightBlueAccent.withOpacity(0.8),
                            )
                          : theme.bodyText1,
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
