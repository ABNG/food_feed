import 'package:flutter/material.dart';
import 'package:food_feed/utils/size_config.dart';
import 'package:food_feed/widget/CustomAppBar.dart';
import 'package:food_feed/widget/reusable_sized_box.dart';
import 'package:get/get.dart';

class TrackOrderScreen extends StatelessWidget {
  static const String PAGE_NAME = "TrackOrderPage";
  final String status = Get.arguments["status"];

  final List<Map<String, dynamic>> statusList = [
    {
      'checked': false,
      'status': 'Pending',
      'icon': 'assets/icons/confirm.png',
      'name': 'Your Order has been placed'
    },
    {
      'checked': false,
      'status': 'Confirmed',
      'icon': 'assets/icons/box.png',
      'name': 'Preparing your order'
    },
    {
      'checked': false,
      'status': 'Delivered',
      'icon': 'assets/icons/delivery.png',
      'name': 'Your Order has been delivered'
    }
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final List<Map<String, dynamic>> statusListReject = [
      {
        'checked': false,
        'status': 'Cancelled',
        'icon': 'assets/icons/foodfeedlogo.png',
        'name': 'Your Order has been $status'
      },
    ];
    if (status.toLowerCase() != "cancelled")
      for (int i = 0; i < statusList.length; i++) {
        if (statusList[i]['status'].toString().toLowerCase() ==
            status.toLowerCase()) {
          if (status.toLowerCase() == "pending")
            statusList[i]['checked'] = !statusList[i]['checked'];
          else if (status.toLowerCase() == "confirmed") {
            statusList[i - 1]['checked'] = !statusList[i - 1]['checked'];
            statusList[i]['checked'] = !statusList[i]['checked'];
          } else if (status.toLowerCase() == "delivered") {
            statusList[i - 2]['checked'] = !statusList[i - 2]['checked'];
            statusList[i - 1]['checked'] = !statusList[i - 1]['checked'];
            statusList[i]['checked'] = !statusList[i]['checked'];
          }
        }
      }
    return Scaffold(
      appBar: CustomAppbar(
        elevation: 0.0,
        title: Text(
          "Track Order",
          style: theme.headline6,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 13, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order # ' + "1",
                  style: theme.bodyText1
                      ?.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  'AED ' + "500",
                  style: theme.bodyText1
                      ?.copyWith(fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              children: [
                Text(
                  'Placed on: ',
                  style: theme.bodyText1?.copyWith(
                      color: Colors.grey[500],
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "18/07/2021",
                  style: theme.bodyText1?.copyWith(
                      color: Colors.grey[500],
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return [
                        SliverAppBar(
                          automaticallyImplyLeading: false,
                          expandedHeight: status == "Cancelled" ? 170 : 280,
                          backgroundColor: Colors.transparent,
                          flexibleSpace: FittedBox(
                            child: Container(
                              height: status == "Cancelled" ? 170 : 280,
                              width: SizeConfig.screenWidth,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 25.0, top: 20, bottom: 20),
                                    child: Text(
                                      'ORDER STATUS',
                                      style: theme.bodyText1?.copyWith(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  ...(status.toLowerCase() == "cancelled"
                                          ? statusListReject
                                          : statusList)
                                      .map((e) {
                                    return Column(
                                      children: [
                                        ListTile(
                                          leading: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 15.0),
                                            child: e['checked']
                                                ? Image.asset(
                                                    'assets/icons/checkmark.png',
                                                    height: 35,
                                                    width: 40)
                                                : null,
                                          ),
                                          title: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 55.0),
                                            child: Column(
                                              children: [
                                                Image.asset(
                                                  e['icon'],
                                                  scale:
                                                      e['status'] == "Cancelled"
                                                          ? 5
                                                          : 20,
                                                  color:
                                                      e['status'] == "Cancelled"
                                                          ? Colors.red
                                                          : Colors.black,
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  e['name'],
                                                  style: theme.bodyText1
                                                      ?.copyWith(
                                                          fontSize: 12,
                                                          color: e['status'] ==
                                                                  "Cancelled"
                                                              ? Colors.red
                                                              : Colors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          indent: 20,
                                          endIndent: 20,
                                        ),
                                      ],
                                    );
                                  }).toList(),
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
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Text(
                            'ORDER ITEMS',
                            style: theme.bodyText1?.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis
                                .vertical, // is used to make list view horizontal
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) =>
                                Container(
                              height: 160,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    color: Colors.white54,
                                    margin: EdgeInsets.only(bottom: 8),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 4, bottom: 4, right: 60),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey[200]!,
                                                    blurRadius: 4,
                                                    spreadRadius: 2,
                                                  ),
                                                ]),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                child:
                                                    // widget.model.products[index]
                                                    //     .productInfo.images.isEmpty
                                                    //     ?
                                                    Image.asset(
                                                  'assets/icons/foodfeedlogo.png',
                                                  height: 125,
                                                  width: 130,
                                                  fit: BoxFit.fitHeight,
                                                )
                                                //     : CachedNetworkImage(
                                                //   imageUrl: widget.model.products[index]
                                                //       .productInfo.images[0].fullurl,
                                                //   height: 125,
                                                //   width: 130,
                                                //   fit: BoxFit.cover,
                                                // ),
                                                ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 0, top: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  RichText(
                                                    text: TextSpan(
                                                      text: 'AED ',
                                                      style: theme.bodyText1
                                                          ?.copyWith(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                          text: "500",
                                                          style: theme.bodyText1
                                                              ?.copyWith(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const ReusableSizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "Item 1",
                                                    style: theme.bodyText1
                                                        ?.copyWith(
                                                      color: Colors.grey[500],
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 30,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Qty ',
                                                        style: theme.bodyText1
                                                            ?.copyWith(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8.0),
                                                        child: Text(
                                                          ': ',
                                                          style: theme.bodyText1
                                                              ?.copyWith(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8.0),
                                                        child: Text(
                                                          "3",
                                                          style: theme.bodyText1
                                                              ?.copyWith(
                                                            fontSize: 14,
                                                          ),
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
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
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
