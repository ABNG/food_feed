import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_feed/app_screens/address_Screen/add_address.dart';
import 'package:food_feed/utils/size_config.dart';
import 'package:food_feed/widget/CustomAppBar.dart';
import 'package:food_feed/widget/reusable_ratingbar.dart';
import 'package:food_feed/widget/reusable_sized_box.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';

class CartScreen extends StatelessWidget {
  static const String PAGE_NAME = "CartPage";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomAppbar(
        elevation: 0.0,
        title: Text(
          "Your Cart",
          style: theme.headline6,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 9,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: SizeConfig.screenWidth * 0.9,
                  height: 180,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey[500]!),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(18),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/images/popular/1-min.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "my name is",
                                style: theme.bodyText1?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const ReusableSizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  ReusableRating(
                                    3,
                                    15,
                                    (rating) {
                                      print(rating);
                                    },
                                  ),
                                  const ReusableSizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "3 reviews",
                                    style: theme.bodyText1?.copyWith(
                                      color: Colors.lightBlueAccent
                                          .withOpacity(0.5),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              const ReusableSizedBox(
                                height: 5,
                              ),
                              Text(
                                "\$100.00",
                                style: theme.bodyText1?.copyWith(
                                  color:
                                      Colors.lightBlueAccent.withOpacity(0.5),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  _ReusableButton(
                                    theme: theme,
                                    text: "-",
                                    onTap: () {},
                                  ),
                                  const ReusableSizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "12",
                                    textAlign: TextAlign.center,
                                    style: theme.bodyText1?.copyWith(
                                      fontSize: 18,
                                    ),
                                  ),
                                  const ReusableSizedBox(
                                    width: 8,
                                  ),
                                  _ReusableButton(
                                    theme: theme,
                                    text: "+",
                                    onTap: () {},
                                  ),
                                  Spacer(),
                                  InkWell(
                                    onTap: () {},
                                    child: Icon(
                                      CupertinoIcons.delete,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 80,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.grey[100]!,
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0, -2)),
            ]),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "\$100.00",
                    textAlign: TextAlign.center,
                    style: theme.bodyText1?.copyWith(
                      color: Colors.lightBlueAccent.withOpacity(0.5),
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlueAccent,
                          padding: EdgeInsets.symmetric(vertical: 25),
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            elevation: 0,
                            barrierColor: Colors.black.withAlpha(1),
                            backgroundColor: Colors.transparent,
                            builder: (context) => Stack(
                              children: [
                                Positioned(
                                  child: InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.black,
                                        ),
                                        child: Icon(
                                          Icons.clear,
                                          color: Colors.white,
                                        )),
                                  ),
                                  left: SizeConfig.screenWidth / 2.2,
                                ),
                                Container(
                                  height: SizeConfig.screenHeight * 0.8,
                                  color: Colors.red,
                                  padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom),
                                  margin: EdgeInsets.only(top: 50),
                                  child: _BottomSheet(theme: theme),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Text(
                          "Buy Now",
                          style: theme.bodyText1?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomSheet extends StatefulWidget {
  const _BottomSheet({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final TextTheme theme;

  @override
  __BottomSheetState createState() => __BottomSheetState();
}

class __BottomSheetState extends State<_BottomSheet> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Marquee(
                  //in marquee package i comment physics: neverScrollblePhysics line, number 729
                  style: widget.theme.bodyText1?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  scrollAxis: Axis.horizontal,
                  startPadding: 10.0,
                  blankSpace: 20,
                  startAfter: Duration(seconds: 3),
                  pauseAfterRound: Duration(seconds: 3),
                  text: "HEllo World",
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: IconButton(
                    onPressed: () {
                      // Get.toNamed(AddAddress.PAGE_NAME); // this line has some problem
                      navigator!.pushNamed(AddAddress.PAGE_NAME);
                    },
                    icon: Icon(
                      CupertinoIcons.add_circled,
                      color: Colors.white,
                      size: 35,
                    )),
              ),
            ],
          ),
        ),
        Table(
          children: [
            TableRow(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey[300]!),
                ),
              ),
              children: [
                _ReusableText(
                  name: "Name",
                  theme: widget.theme,
                ),
                _ReusableText(
                  name: "Quantity",
                  theme: widget.theme,
                ),
                _ReusableText(
                  name: "Price",
                  theme: widget.theme,
                ),
              ],
            ),
            for (int i = 0; i <= 5; i++)
              TableRow(
                decoration: i == 5
                    ? BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey[300]!),
                        ),
                      )
                    : null,
                children: [
                  _ReusableText(
                    name: "Google",
                    theme: widget.theme,
                  ),
                  _ReusableText(
                    name: "X$i",
                    theme: widget.theme,
                  ),
                  _ReusableText(
                    name: "100 AED",
                    theme: widget.theme,
                  ),
                ],
              ),
            TableRow(
              children: [
                _ReusableText(
                  name: "",
                  theme: widget.theme,
                  verticalPadding: 10,
                ),
                _ReusableText(
                  name: "Subtotal",
                  theme: widget.theme,
                  verticalPadding: 10,
                ),
                _ReusableText(
                  name: "100 AED",
                  theme: widget.theme,
                  verticalPadding: 10,
                ),
              ],
            ),
            TableRow(
              children: [
                _ReusableText(
                  name: "",
                  theme: widget.theme,
                  verticalPadding: 10,
                ),
                _ReusableText(
                  name: "Delivery Fee",
                  theme: widget.theme,
                  verticalPadding: 10,
                ),
                _ReusableText(
                  name: "100 AED",
                  theme: widget.theme,
                  verticalPadding: 10,
                ),
              ],
            ),
            TableRow(
              children: [
                _ReusableText(
                  name: "",
                  theme: widget.theme,
                  verticalPadding: 10,
                ),
                _ReusableText(
                  name: "VAT 5%",
                  theme: widget.theme,
                  verticalPadding: 10,
                ),
                _ReusableText(
                  name: "100 AED",
                  theme: widget.theme,
                  verticalPadding: 10,
                ),
              ],
            ),
            TableRow(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey[300]!),
                ),
              ),
              children: [
                _ReusableText(
                  name: "",
                  theme: widget.theme,
                  verticalPadding: 10,
                ),
                _ReusableText(
                  name: "Coupon",
                  theme: widget.theme,
                  verticalPadding: 10,
                ),
                _ReusableText(
                  name: "100 AED",
                  theme: widget.theme,
                  verticalPadding: 10,
                ),
              ],
            ),
            TableRow(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey[300]!),
                ),
              ),
              children: [
                _ReusableText(
                  name: "",
                  theme: widget.theme,
                ),
                _ReusableText(
                  name: "Total",
                  theme: widget.theme,
                ),
                _ReusableText(
                  name: "100 AED",
                  theme: widget.theme,
                ),
              ],
            ),
          ],
        ),
        const ReusableSizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    textCapitalization: TextCapitalization.characters,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Coupon Code",
                      hintStyle: widget.theme.bodyText1?.copyWith(
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlueAccent,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      minimumSize: Size(120, 40),
                    ),
                    onPressed: () {},
                    child: Text(
                      "APPLY",
                      style: widget.theme.bodyText1?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
          child: Row(
            children: [
              _ReusableText(name: "Payment Method:", theme: widget.theme),
              _ReusableText(name: "Cash On Delivery", theme: widget.theme),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth / 5, vertical: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlueAccent,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              onPressed: () {},
              child: Text(
                "Place Order",
                style: widget.theme.bodyText1?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ReusableText extends StatelessWidget {
  final String name;
  final TextTheme theme;
  final double verticalPadding;
  const _ReusableText({
    Key? key,
    required this.name,
    required this.theme,
    this.verticalPadding = 15.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: verticalPadding),
      child: Text(
        "$name",
        textAlign: TextAlign.center,
        style: theme.bodyText1?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _ReusableButton extends StatelessWidget {
  const _ReusableButton({
    Key? key,
    required this.theme,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final TextTheme theme;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 35,
        height: 35,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          "$text",
          textAlign: TextAlign.center,
          style: theme.bodyText1?.copyWith(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
