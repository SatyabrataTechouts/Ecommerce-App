import 'package:flutter/material.dart';

class CustumInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      margin: EdgeInsets.only(
        bottom: 12,
      ),
      child: TextField(
        // controller: ,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter a search term',
        ),
      ),
    );
  }
}
