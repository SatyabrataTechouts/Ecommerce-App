import 'package:app/provider/head_provider.dart';
import 'package:app/provider/main_data_provider.dart';
import 'package:app/screens/homePages/courosel.dart';

import 'package:app/screens/homePages/head.dart';
import 'package:app/screens/homePages/list_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    final prov = context.read<MainDataProvider>();
    prov.storeData();
    context.read<HeadProvider>().setProduct();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final prov = context.watch<MainDataProvider>();
    final headProv = context.watch<HeadProvider>();
    print("=====${prov.mappedData}");
    print('head data=${headProv.product}');
    // TODO: implement build
    return Scaffold(
      body: Material(
        child: Column(
          children: [
            Head(),
            corosel(),
            ListProduct(),
          ],
        ),
      ),
    );
  }
}
