import 'package:flutter/material.dart';
import 'package:food_feed/utils/size_config.dart';
import 'package:food_feed/widget/CustomAppBar.dart';
import 'package:food_feed/widget/reusable_button.dart';
import 'package:food_feed/widget/reusable_textfield.dart';
import 'package:location/location.dart';

List<String> cities = [
  "Abu Dhabi",
  "Sharjah",
  "Ajman",
  "Fujairah",
  "Dubai",
  "Umm al-Qaiwain",
  "Ra's al-Khaimah"
];

class AddAddress extends StatefulWidget {
  static const String PAGE_NAME = "AddAddressPage";

  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final formKey = GlobalKey<FormState>();
  Location _location = Location();
  late bool _serviceEnabled;
  // Completer<GoogleMapController> _controller = Completer();
  // final Set<Marker> _markers = {};
  // CameraPosition _kLake;
  // LatLng currentLocation = LatLng(0, 0);
  // LatLng cameraPosition = LatLng(0, 0);
  // LatLng location = LatLng(0, 0);
  // List<dynamic> address = [];
  bool isLoading = true;
  TextEditingController _apartmentController = new TextEditingController();
  TextEditingController _buildingController = new TextEditingController();
  TextEditingController _cityController = new TextEditingController();
  TextEditingController _addressController = new TextEditingController();
  TextEditingController _contactnumberController = new TextEditingController();
  FocusNode _apartmentNode = new FocusNode();
  FocusNode _buildingNode = new FocusNode();
  FocusNode _cityNode = new FocusNode();
  FocusNode _addressNode = new FocusNode();
  FocusNode _contactnumberNode = new FocusNode();
  String myaddress = "";
  String? _city;

  // var box = Hive.box<PickUp>('PickUpLocationBox');

  @override
  void initState() {
    // _kLake = CameraPosition(
    //     bearing: 192.8334901395799,
    //     target: LatLng(24.951781207714742, 46.71364124718462),
    //     tilt: 59.440717697143555,
    //     zoom: 14.151926040649414);
    // currentLocation = LatLng(24.455665, 54.668878);
    // _markers.clear();
    // addMarkers("1", LatLng(24.455665, 54.668878)).then((marker) {
    //   setState(() {
    //     _markers.add(marker);
    //   });
    // });
    // Future.delayed(
    //     Duration(seconds: 2),
    //     () => checkForService().then((value) {
    //           if (value) {
    //             _getCurrentLocation().then((value) {
    //               currentLocation = LatLng(value.latitude, value.longitude);
    //               location = LatLng(value.latitude, value.longitude);
    //               moveto(value.latitude, value.longitude);
    //               _markers.clear();
    //               addMarkers("1", LatLng(value.latitude, value.longitude))
    //                   .then((marker) {
    //                 setState(() {
    //                   _markers.add(marker);
    //                   isLoading = false;
    //                 });
    //                 getLocationAddress(value.latitude, value.longitude);
    //               });
    //             });
    //           } else {
    //             print("turn on location");
    //             isLoading = false;
    //             setState(() {});
    //           }
    //         }).catchError((error) {
    //           print(error);
    //         }));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomAppbar(
        title: Text(
          "Add Address",
          style: theme.headline6,
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 9.0),
                    child: ReusableTextField(
                        controller: _apartmentController,
                        focusNode: _apartmentNode,
                        keyboardType: TextInputType.number,
                        hintText: 'Apartment / Villa Number',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                        onEditingComplete: () {
                          _buildingNode.requestFocus();
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 9.0),
                    child: ReusableTextField(
                        controller: _buildingController,
                        focusNode: _buildingNode,
                        keyboardType: TextInputType.text,
                        hintText: 'Building Name',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                        onEditingComplete: () {
                          FocusScope.of(context).unfocus();
                        }),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Theme.of(context).primaryColor,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                    child: DropdownButton<String>(
                      value: _city,
                      hint: Text(
                        "Select City",
                        style: TextStyle(color: Colors.grey[400], fontSize: 14),
                      ),
                      icon: Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.keyboard_arrow_down,
                              size: 30, color: Theme.of(context).primaryColor),
                        ),
                      ),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.black, fontSize: 15),
                      underline: Container(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _city = newValue;
                        });
                        //  dropdownValue == 'Other')
                        //  {

                        //  }
                      },
                      items:
                          cities.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 9.0),
                    child: ReusableTextField(
                        controller: _addressController,
                        focusNode: _addressNode,
                        keyboardType: TextInputType.text,
                        hintText: 'Address',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                        onEditingComplete: () {
                          _contactnumberNode.requestFocus();
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 9.0),
                    child: ReusableTextField(
                      controller: _contactnumberController,
                      focusNode: _contactnumberNode,
                      keyboardType: TextInputType.numberWithOptions(
                          signed: false, decimal: false),
                      hintText: 'Contact Number',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                      onEditingComplete: () {
                        FocusScope.of(context).unfocus();
                      },
                      prefix: Text(
                        "+971 ",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Pin Location on Maps',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w300)),
                    ),
                  ),
                  // Container(
                  //   height: 300,
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(top: 10.0),
                  //     child: Stack(
                  //       children: [
                  //         GoogleMap(
                  //           mapType: MapType.normal,
                  //           markers: _markers,
                  //           zoomControlsEnabled: false,
                  //           trafficEnabled: false,
                  //           compassEnabled: false,
                  //           myLocationButtonEnabled: false,
                  //           buildingsEnabled: true,
                  //           initialCameraPosition: _kLake,
                  //           gestureRecognizers: {
                  //             Factory<OneSequenceGestureRecognizer>(
                  //               () => EagerGestureRecognizer(),
                  //             ),
                  //           },
                  //           onTap: (location) async {
                  //             await addMarkers("1", location).then(
                  //               (marker) => setState(() {
                  //                 _markers.add(marker);
                  //               }),
                  //             );
                  //             moveto(
                  //                 location.latitude, location.longitude);
                  //             getLocationAddress(
                  //                 location.latitude, location.longitude);
                  //           },
                  //           onMapCreated:
                  //               (GoogleMapController controller) {
                  //             _controller.complete(controller);
                  //           },
                  //         ),
                  //         Align(
                  //           alignment: Alignment.bottomLeft,
                  //           child: InkWell(
                  //             onTap: () async {
                  //               Navigator.push(
                  //                       context,
                  //                       MaterialPageRoute(
                  //                           builder: (context) =>
                  //                               AddressMapScreen(
                  //                                   location: location)))
                  //                   .then((value) {
                  //                 if (value != null) {
                  //                   _markers.clear();
                  //                   addMarkers(
                  //                           "1",
                  //                           LatLng(value["lat"],
                  //                               value["lng"]))
                  //                       .then(
                  //                     (marker) => setState(() {
                  //                       _markers.add(marker);
                  //                     }),
                  //                   );
                  //                   moveto(value["lat"], value["lng"]);
                  //                   getLocationAddress(
                  //                       value["lat"], value["lng"]);
                  //                 }
                  //               });
                  //             },
                  //             child: Padding(
                  //               padding: const EdgeInsets.all(8.0),
                  //               child: CircleAvatar(
                  //                   radius: 15,
                  //                   backgroundColor: primarycolorpurple,
                  //                   child: Image.asset(
                  //                       'images/resize.png',
                  //                       height: 19,
                  //                       color: Colors.white)),
                  //             ),
                  //           ),
                  //         ),
                  //         Align(
                  //           alignment: Alignment.bottomRight,
                  //           child: Padding(
                  //             padding: const EdgeInsets.all(8.0),
                  //             child: GestureDetector(
                  //               onTap: () {
                  //                 Navigator.push(
                  //                     context,
                  //                     MaterialPageRoute(
                  //                         builder: (context) =>
                  //                             MapPage()));
                  //               },
                  //               child: GestureDetector(
                  //                 onTap: () async {
                  //                   try {
                  //                     if (currentLocation == null) {
                  //                       _markers.clear();
                  //                       _getCurrentLocation().then(
                  //                           (LocationData
                  //                               locationData) async {
                  //                         await addMarkers("1",
                  //                                 locationData as LatLng)
                  //                             .then(
                  //                           (marker) => setState(() {
                  //                             _markers.add(marker);
                  //                           }),
                  //                         );
                  //                         moveto(locationData.latitude,
                  //                             locationData.longitude);
                  //                         getLocationAddress(
                  //                             locationData.latitude,
                  //                             locationData.longitude);
                  //                       });
                  //                     } else {
                  //                       _markers.clear();
                  //                       await addMarkers(
                  //                               "1",
                  //                               LatLng(
                  //                                   currentLocation
                  //                                       .latitude,
                  //                                   currentLocation
                  //                                       .longitude))
                  //                           .then(
                  //                         (marker) => setState(() {
                  //                           _markers.add(marker);
                  //                         }),
                  //                       );
                  //                       moveto(currentLocation.latitude,
                  //                           currentLocation.longitude);
                  //                       getLocationAddress(
                  //                           currentLocation.latitude,
                  //                           currentLocation.longitude);
                  //                     }
                  //                   } catch (e) {
                  //                     print(e);
                  //                   }
                  //                 },
                  //                 child: CircleAvatar(
                  //                     radius: 15,
                  //                     backgroundColor: primarycolorpurple,
                  //                     child: Image.asset(
                  //                         'images/location copy.png',
                  //                         height: 23,
                  //                         color: Colors.white)),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: ReusableButton(
                        width: SizeConfig.screenWidth * 0.8,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            print('The form is valid');
                            if (_contactnumberController.text[0] == "0") {
                              _contactnumberController.text = "+971" +
                                  _contactnumberController.text.substring(1);
                            } else {
                              _contactnumberController.text =
                                  "+971" + _contactnumberController.text;
                            }
                            // await box.add(PickUp(
                            //     city: _cityController.text,
                            //     street: _addressController.text,
                            //     apartment: int.parse(
                            //         _apartmentController.text),
                            //     contactnumber:
                            //         _contactnumberController.text,
                            //     label: dropdownValue,
                            //     address: myaddress,
                            //     lat: location.latitude,
                            //     lng: location.longitude,
                            //     category: widget.category));
                            Navigator.pop(context);
                          } else {
                            print("The form in invalid");
                          }
                        },
                        text: "APPLY"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

//   moveto(double lat, double lng) async {
//     final GoogleMapController controller = await _controller.future;
//
//     controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
//         bearing: 192.8334901395799,
//         target: LatLng(lat, lng),
//         tilt: 0.440717697143555,
//         zoom: 15.9)));
//   }
//
//   Future<Marker> addMarkers(String id, LatLng location) async {
//     this.location = location;
//     BitmapDescriptor markerIcon = await BitmapDescriptor.fromAssetImage(
//       ImageConfiguration(size: Size(48, 48)),
//       'images/Location_pinpoint_ios.png',
//     );
//     // BitmapDescriptor descriptor = await BitmapDescriptor.fromAssetImage(
//     //     ImageConfiguration(size: Size(20, 20)), 'assets/icons/rsz_place.png');
//
//     return Marker(markerId: MarkerId(id), position: location, icon: markerIcon);
//   }
//
//   Future<bool> checkForService() async {
//     PermissionStatus _permissionGranted = await _location.hasPermission();
//     if (_permissionGranted != PermissionStatus.GRANTED) {
//       _permissionGranted = await _location.requestPermission();
//     }
//     if (_permissionGranted == PermissionStatus.GRANTED) {
//       _serviceEnabled = await _location.serviceEnabled();
//       if (!_serviceEnabled) {
//         _serviceEnabled = await _location.requestService();
//         if (!_serviceEnabled) {
//           return false;
//         }
//       }
//       return _serviceEnabled;
//     }
//     return false;
//   }
//
//   Future<LocationData> _getCurrentLocation() async {
//     try {
//       LocationData position =
//           await _location.getLocation().catchError((onError) {
//         print(onError);
//       });
//       return position;
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   getLocationAddress(double lat, double lng) async {
//     try {
//       // Response response = await Dio().get(
//       //     "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=AIzaSyBoF_1QHYpyKtjHsaNZXOetnnrQXgo2lOo");
//       // var data = response.data["results"][0]["formatted_address"];
//       // setState(() {
//       //   address.text = data.toString();
//       // });
//
//       final coordinates = new coder.Coordinates(lat, lng);
//       print('lat $lat');
//       List<coder.Address> addresses =
//           await coder.Geocoder.local.findAddressesFromCoordinates(coordinates);
//       coder.Address first = addresses.first;
//       print(
//           "${first.featureName} : ${first.addressLine} : ${first.subThoroughfare}");
//
//       setState(() {
//         myaddress = first.addressLine;
//         print(myaddress);
//       });
//     } catch (e) {
//       print(e);
//     }
// //    var googlePlace =
// //        place.GooglePlace("AIzaSyBv45LZlF4Xupe_DRZdVDqCvc0li_Db8Jg");
// //    place.NearBySearchResponse result = await googlePlace.search
// //        .getNearBySearch(place.Location(lat: lat, lng: lng), 100);
// //    for (place.SearchResult myResult in result.results) {
// //      print(myResult.formattedAddress);
// //    }
//   }
}
