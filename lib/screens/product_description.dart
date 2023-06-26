import 'package:app/provider/single_page.dart';
import 'package:app/screens/components/custum_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDescriptionPage extends StatelessWidget {
  void buy() {
    return print("Buy");
  }

  @override
  Widget build(BuildContext context) {
    final dataProv = context.watch<SinglePage>();
    print("dta${dataProv.singleProduct}");
    return Material(
      child: Column(
        children: [
          Container(
            height: 60,
            width: double.infinity,
            color: Colors.blueAccent,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 17),
              child: IconButton(
                alignment: Alignment.topLeft,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Image.network(
                    dataProv.singleProduct.image,
                    width: 150,
                  ),
                ),
                Container(
                  width: 300,
                  alignment: Alignment.center,
                  child: Text(
                    dataProv.singleProduct.title,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 22,
                  ),
                  child: Text(
                    "\$ ${dataProv.singleProduct.price}",
                  ),
                ),
                CustomButton(
                  btnName: "Buy",
                  height: 40,
                  width: 90,
                  onTap: buy,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
