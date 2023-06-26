// ignore_for_file: must_be_immutable

import 'package:app/provider/head_provider.dart';
import 'package:app/provider/main_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Head extends StatefulWidget {
  List<dynamic>? placemarks;

  Head({super.key, required this.placemarks});
  @override
  State<StatefulWidget> createState() {
    return _HeadState();
  }
}

class _HeadState extends State<Head> {
  @override
  Widget build(BuildContext context) {
    final prov = context.watch<MainDataProvider>();
    final headProv = context.watch<HeadProvider>();
    print("====sf=${prov.select}");
    return Column(
      children: [
        Container(
          height: 50,
          color: Colors.blue[100],
          child: Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 30,
                color: Colors.white,
              ),
              Text(
                "${widget.placemarks?[0].locality},${widget.placemarks?[0].country}",
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
        ),
        Container(
          height: 140,
          margin: EdgeInsets.symmetric(horizontal: 12),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: InkWell(
                  onTap: () {
                    prov.selectedData(headProv.product[index].category);
                  },
                  child: Container(
                    height: 120,
                    child: Column(
                      children: [
                        Image.network(
                          headProv.product[index].image,
                          height: 70,
                          width: 70,
                        ),
                        Text(
                          headProv.product[index].category,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: headProv.product.length,
          ),
        ),
      ],
    );
  }
}
