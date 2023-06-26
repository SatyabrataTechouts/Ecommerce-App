import 'package:app/provider/cart_data.dart';
import 'package:app/provider/main_data_provider.dart';
import 'package:app/provider/single_page.dart';
import 'package:app/screens/components/custum_button.dart';
import 'package:app/screens/product_description.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListProduct extends StatefulWidget {
  const ListProduct({super.key});

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  List<dynamic> data = [];
  ValueNotifier<bool> refreshNotifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final prov = context.read<MainDataProvider>();

      if (prov.select.isEmpty) {
        data.addAll(prov.mappedData.map((element) => element.fromJson()));
      } else {
        data.addAll(prov.select.map((element) => element.fromJson()));
      }
      didChangeDependencies();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    final prov = context.read<MainDataProvider>();

    if (prov.select.isEmpty) {
      data.addAll(prov.mappedData.map((element) => element));
    } else {
      // data = [];
      data = prov.select;
    }
    // });
  }

  @override
  Widget build(BuildContext context) {
    final prov = context.watch<MainDataProvider>();
    final single = context.read<SinglePage>();
    print(prov.mappedData.length);
    print('length====${data.length}');
    return prov.mappedData.isNotEmpty
        ? Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(12),
                  height: 180,
                  child: InkWell(
                    onTap: () {
                      single.addData(data[index]);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDescriptionPage(),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 4,
                      child: SizedBox(
                        height: 100,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.network(
                                  data[index].image,
                                  width: 80,
                                ),
                                Container(
                                  width: 120,
                                  child: Expanded(
                                    child: Text(
                                      data[index].title,
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      ' \$ ${data[index].price.toString()}',
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    // ElevatedButton(
                                    //   onPressed: () {},
                                    //   child: const Text(
                                    //     "Add to Cart",
                                    //   ),
                                    // ),

                                    CustomButton(
                                      btnName: "Buy",
                                      onTap: () {
                                        print("Buy");
                                      },
                                      height: 33,
                                      width: 70,
                                    ),
                                    CustomButton(
                                      btnName: "Add To Cart",
                                      onTap: () {
                                        context
                                            .read<CartDataProvider>()
                                            .addToCart(
                                              data[index],
                                            );
                                      },
                                      height: 38,
                                      width: 100,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: data
                  .length, // Use mappedData length instead of prov.select.length
            ),
          )
        : Container();
  }
}
