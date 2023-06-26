import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String btnName;
  final Function onTap;
  final int height;
  final int width;
  const CustomButton({
    super.key,
    required this.btnName,
    required this.onTap,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          onTap();
        },
        child: Container(
          height: height.floorToDouble(),
          width: width.floorToDouble(),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              btnName,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
