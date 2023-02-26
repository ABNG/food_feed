import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_feed/model/item_model.dart';
import 'package:food_feed/widget/CustomAppBar.dart';
import 'package:food_feed/widget/reusable_ratingbar.dart';
import 'package:food_feed/widget/reusable_sized_box.dart';
import 'package:get/get.dart';

class ItemDetailPage extends StatelessWidget {
  static const String PAGE_NAME = "/DetailPage";
  final Items item = Get.arguments['item'];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
//    bool isFavourite = false;
    return Scaffold(
      appBar: CustomAppbar(
        elevation: 0.0,
        title: Text(
          "Product Detail",
          style: theme.headline6,
        ),
        actions: [
          Container(
            width: 45,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent.withOpacity(0.5),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(
              Icons.share,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 380,
            child: Stack(
              fit: StackFit.expand,
              clipBehavior: Clip.none,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 130),
                  child: CarouselSlider.builder(
                      unlimitedMode: true,
                      enableAutoSlider: true,
                      autoSliderDelay: const Duration(seconds: 3),
                      slideBuilder: (index) {
                        return Container(
                          child: Image.asset(
                            item.slider[index],
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                      slideTransform: DepthTransform(),
//                      slideIndicator: CircularSlideIndicator(
//                        padding: EdgeInsets.only(bottom: 32),
//                      ),
                      itemCount: item.slider.length),
                ),
                Positioned(
                  bottom: 5,
                  left: 30,
                  right: 30,
                  child: Container(
                    width: 120,
                    height: 170,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 3,
                            spreadRadius: 1),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: theme.headline6,
                        ),
                        const ReusableSizedBox(
                          height: 10,
                        ),
                        Text(
                          item.desc,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: theme.bodyText1?.copyWith(
                            color: Colors.grey[400],
                            fontSize: 12,
                            height: 1.4,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const ReusableSizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            if (item.offerPrice > 0)
                              Text(
                                "\$${item.offerPrice}",
                                style: theme.bodyText1?.copyWith(
                                  color: Colors.grey[400],
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.lineThrough,
                                  decorationThickness: 2.0,
                                ),
                              ),
                            const ReusableSizedBox(width: 10),
                            Text(
                              "\$${item.price}",
                              style: theme.bodyText1?.copyWith(
                                color: Colors.lightBlueAccent.withOpacity(0.5),
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            Spacer(),
                            ReusableRating(
                              item.rating,
                              20,
                              (rating) {
                                print(rating);
                              },
                            ),
                            const ReusableSizedBox(
                              width: 5,
                            ),
                            Text(
                              "${item.rating}",
                              style: theme.bodyText1?.copyWith(
                                color: Colors.lightBlueAccent.withOpacity(0.5),
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Select Size",
                    style: theme.bodyText1?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: _MyRow(
                    theme: theme,
                    item: item,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Quantity",
                        style: theme.bodyText1?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      QuantityButtons(theme),
                    ],
                  ),
                ),
                const ReusableSizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Product Number",
                      style: theme.bodyText1?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "ff-10001",
                      style: theme.bodyText1?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const ReusableSizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.lightBlueAccent,
                            padding: EdgeInsets.symmetric(vertical: 25),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Add to Cart",
                            style: theme.bodyText1?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    StatefulBuilder(
                      //i can also use obx or getbuilder to update the state ripple coder video 13.
                      builder: (context, setState) => InkResponse(
                        onTap: () {
//                            setState(() {
//                              isFavourite = !isFavourite;
//                            });
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.lightBlueAccent.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.favorite,
                            color: item.isFavourite ? Colors.red : Colors.white,
                            size: 45,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _MyRow extends StatefulWidget {
  final TextTheme theme;
  final Items item;
  _MyRow({required this.theme, required this.item});

  @override
  _MyRowState createState() => _MyRowState();
}

class _MyRowState extends State<_MyRow> {
  late String selectedTitle;
  @override
  void initState() {
    selectedTitle = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.item.sizes
          .map((e) => InkWell(
                onTap: () {
                  setState(() {
                    selectedTitle = e;
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(right: 10, top: 15),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: selectedTitle == e
                            ? Colors.black87
                            : Colors.grey[300]!,
                        width: 1),
                  ),
                  child: Text(
                    "$e",
                    textAlign: TextAlign.center,
                    style: widget.theme.bodyText1?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }
}

class QuantityButtons extends StatefulWidget {
  final TextTheme theme;

  QuantityButtons(this.theme);

  @override
  _QuantityButtonsState createState() => _QuantityButtonsState();
}

class _QuantityButtonsState extends State<QuantityButtons> {
  late int quantity;
  @override
  void initState() {
    quantity = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              if (quantity > 1) quantity--;
            });
          },
          child: Container(
            width: 40,
            height: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
            ),
            child: Text(
              "-",
              textAlign: TextAlign.center,
              style: widget.theme.bodyText1?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "$quantity",
            textAlign: TextAlign.center,
            style: widget.theme.bodyText1?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              quantity++;
            });
          },
          child: Container(
            width: 40,
            height: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            child: Text(
              "+",
              textAlign: TextAlign.center,
              style: widget.theme.bodyText1?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
