import 'package:flutter/material.dart';
import 'package:food_feed/widget/reusable_sized_box.dart';

class ReusableGridView extends StatelessWidget {
  final List<dynamic> data;
  final TextTheme theme;
  final Function(int) onTap;
  final ScrollController? controller;

  ReusableGridView(
      {required this.data,
      required this.theme,
      required this.onTap,
      this.controller});

  @override
  Widget build(BuildContext context) {
//    String name = "";
    return GridView.builder(
        itemCount: data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 15,
          childAspectRatio: 0.68,
        ),
        itemBuilder: (context, index) => InkWell(
              onTap: () => onTap(index),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(18),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              data[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: StatefulBuilder(
                            //i can also use obx or getbuilder to update the state ripple coder video 13.
                            builder: (BuildContext context,
                                void Function(void Function()) setState) {
                              return IconButton(
                                  onPressed: () {
//                                    setState(() => name = data[index].name);
                                  },
                                  icon: Icon(
                                    data[index].isFavourite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Theme.of(context).primaryColor,
                                  ));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const ReusableSizedBox(height: 10),
                  Text(
                    data[index].name,
                    style: theme.bodyText1?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const ReusableSizedBox(height: 3),
                  Text(
                    "${data[index].pieces} pieces",
                    style: theme.bodyText1?.copyWith(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const ReusableSizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (data[index].offerPrice > 0)
                        Text(
                          "\$${data[index].offerPrice}",
                          style: theme.bodyText1?.copyWith(
                            color: Colors.grey[400],
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.lineThrough,
                            decorationThickness: 2.0,
                          ),
                        ),
                      const ReusableSizedBox(width: 10),
                      Text(
                        "\$${data[index].price}",
                        style: theme.bodyText1?.copyWith(
                          color: Colors.lightBlueAccent.withOpacity(0.5),
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ));
  }
}
