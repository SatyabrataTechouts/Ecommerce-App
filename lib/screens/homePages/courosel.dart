import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

List _images2 = [
  "https://img.freepik.com/premium-vector/special-offer-sale-discount-banner_180786-46.jpg?w=2000",
  "https://previews.123rf.com/images/arcady31/arcady311606/arcady31160600002/59113161-special-offer-red-star-icon.jpg",
  "https://www.shutterstock.com/image-illustration/shop-now-buy-2-get-600w-2145415977.jpg",
  "https://www.shutterstock.com/image-illustration/shop-now-30-off-special-600w-2145419197.jpg"
];

class corosel extends StatelessWidget {
  const corosel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: 150.0),
      items: _images2
          .map(
            (x) => Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(x, scale: 2),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
