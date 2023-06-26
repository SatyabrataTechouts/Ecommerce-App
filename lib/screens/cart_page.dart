import 'package:app/provider/cart_data.dart';
import 'package:app/screens/components/custum_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartDataProv = context.watch<CartDataProvider>();
    print(
      "cart${cartDataProv.cartData.toString()}",
    );
    return Container(
      height: 600,
      child: ListView.builder(
        itemCount: cartDataProv.cartData.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.network(
                    cartDataProv.cartData[index].image.toString(),
                    width: 90,
                    height: 120,
                  ),
                  Text(
                    " \$ ${cartDataProv.cartData[index].price}",
                  ),
                  Text(
                    cartDataProv.cartData[index].qnt.toString(),
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          cartDataProv.delete(
                            cartDataProv.cartData[index].title.toString(),
                          );
                        },
                        icon: const Icon(
                          Icons.delete,
                        ),
                      ),
                      CustomButton(
                        btnName: "Buy",
                        onTap: () {},
                        height: 30,
                        width: 70,
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
