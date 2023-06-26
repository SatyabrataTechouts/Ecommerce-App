import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          const Center(
            child: CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(
                'https://i.stack.imgur.com/UHa1c.png',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 30,
            ),
            child: const Column(
              children: [
                CustumRow(
                  title: "Name",
                  value: "Satyabrata Barik",
                ),
                CustumRow(
                  title: "Phone",
                  value: "7873537019",
                ),
                CustumRow(
                  title: "Email",
                  value: "Satya@gmail.com",
                ),
                CustumRow(
                  title: "DOB",
                  value: "09/04/2000",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustumRow extends StatelessWidget {
  final String title;
  final String value;
  const CustumRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Material(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
