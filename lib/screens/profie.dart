import 'package:app/provider/user_prov.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User? user;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    user = context.watch<UserProv>().loginUser;
    print('====$user');
  }

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
            child: Column(
              children: [
                CustumRow(
                  title: "Name",
                  value: user?.displayName ?? '',
                ),
                CustumRow(
                  title: "Phone",
                  value: user?.phoneNumber ?? '',
                ),
                CustumRow(
                  title: "Email",
                  value: user?.email ?? '',
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
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 23,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
