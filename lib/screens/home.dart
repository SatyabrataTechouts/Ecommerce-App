import 'package:app/provider/head_provider.dart';
import 'package:app/provider/main_data_provider.dart';
import 'package:app/screens/homePages/courosel.dart';
import 'package:app/screens/homePages/head.dart';
import 'package:app/screens/homePages/list_product.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  // Position? pos;
  List<Placemark>? placemarks;
  @override
  void initState() {
    getLocation();
    super.initState();
    final prov = context.read<MainDataProvider>();
    prov.storeData();
    context.read<HeadProvider>().setProduct();
  }

  @override
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void getLocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    List<Placemark>? pos = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    setState(() async {
      // pos = position;
      placemarks = pos;
    });
  }

  @override
  Widget build(BuildContext context) {
    final prov = context.watch<MainDataProvider>();
    final headProv = context.watch<HeadProvider>();
    // print("=====${prov.mappedData}");
    // print('head data=${headProv.product}');
    // print("postion===,$placemarks");
    // TODO: implement build
    return Scaffold(
      body: Material(
        child: Column(
          children: [
            Head(placemarks: placemarks),
            corosel(),
            ListProduct(),
          ],
        ),
      ),
    );
  }
}
