import 'package:flutter/material.dart';
import 'package:food_feed/view_order/track_order_Screen.dart';
import 'package:food_feed/widget/CustomAppBar.dart';
import 'package:food_feed/widget/reusable_sized_box.dart';
import 'package:get/get.dart';

class ViewOrderScreen extends StatelessWidget {
  static const String PAGE_NAME = "ViewOrderPage";
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomAppbar(
        elevation: 0.0,
        title: Text(
          "My Orders",
          style: theme.headline6,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          Map<String, dynamic> status = getStatusAndColor(1);
          return InkResponse(
            onTap: () {
              Get.toNamed(TrackOrderScreen.PAGE_NAME,
                  arguments: {"status": "${status['status']}"});
            },
            child: Card(
              margin: EdgeInsets.all(10),
              elevation: 2.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Order" + "# 1",
                                style: theme.bodyText1,
                              ),
                              Text(
                                "Placed on" +
                                    ": 18/07/2021", //${Utils.formatDate(myorders[index].createdAt)}
                                style: theme.bodyText1?.copyWith(
                                  color: Colors.grey,
                                  height: 1.4,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                              text: "AED ",
                              style: theme.bodyText1?.copyWith(
                                  color: Colors.grey[700],
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                              children: [
                                TextSpan(
                                  text: '500',
                                  style: theme.bodyText1?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 25,
                                  ),
                                )
                              ]),
                        ),
                      ],
                    ),
                    const ReusableSizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: RichText(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                                text: ' Status: ',
                                style: theme.bodyText1?.copyWith(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                                children: [
                                  TextSpan(
                                    text: " " + '${status['status']}',
                                    style: theme.bodyText1?.copyWith(
                                      color: status['color'],
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  )
                                ]),
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(
                              width: 50,
                              height: 40,
                              child: Image.asset(
                                'assets/icons/magnifybox.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            const ReusableSizedBox(
                              height: 4,
                            ),
                            Text(
                              "Track Order",
                              style: theme.bodyText1?.copyWith(
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: 8,
      ),
    );
  }

  Map<String, dynamic> getStatusAndColor(int paymentStatus) {
    late Map<String, dynamic> result;
    switch (paymentStatus) {
      case 0:
        result = {
          "status": "Pending",
          "color": Colors.lime,
        };

        break;
      case 1:
        result = {
          "status": "Confirmed",
          "color": Colors.green,
        };
        break;
      case 2:
        result = {
          "status": "Delivered",
          "color": Colors.green,
        };
        break;

      case 3:
        result = {
          "status": "Cancelled",
          "color": Colors.red,
        };
        break;

        // case 4:
        //   result = {
        //     "status": "Reject",
        //     "color": Colors.red,
        //   };
        break;
      // case 5:
      //   result = {
      //     "status": "Returned",
      //     "color": Colors.green,
      //   };
      //   break;
    }
    return result;
  }
}
