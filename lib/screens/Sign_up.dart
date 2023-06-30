import 'package:app/components/components/custum_button.dart';
import 'package:app/components/custum_input.dart';
import 'package:app/screens/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String text = '';
  @override
  Widget build(BuildContext context) {
    var email = TextEditingController();
    var password = TextEditingController();
    var mobile = TextEditingController();
    var name = TextEditingController();
    //bool isAvailable = true;

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustumInput(
                placeholder: "Enter your name",
                controler: name,
                validator: (value) {},
              ),
              CustumInput(
                placeholder: "Enter your Mobile number",
                controler: mobile,
                validator: (value) {},
              ),
              CustumInput(
                placeholder: "Enter your Email",
                controler: email,
                validator: (value) {},
              ),
              CustumInput(
                placeholder: "Enter your Password",
                controler: password,
                validator: (value) {},
              ),
              Text(
                text,
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              CustomButton(
                btnName: "SignUp",
                onTap: () async {
                  String userEmail = email.text.toString();
                  String userPass = password.text.toString();
                  String userMob = mobile.text.toString();
                  String userName = name.text.toString();
                  try {
                    UserCredential userCredential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: userEmail,
                      password: userPass,
                    );
                    User? user = userCredential.user;
                    if (user != null) {
                      await user.updateDisplayName(userName);

                      // Add custom user data
                      Map<String, dynamic> userData = {
                        'name': userName,
                        'mobile': userMob,
                        'email': userEmail,
                      };

                      // Store the custom user data in Firestore or Realtime Database
                      // Example using Firestore:
                      await FirebaseFirestore.instance
                          .collection('User')
                          .doc(user.uid)
                          .set(userData);
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    }
                  } catch (e) {
                    setState(() {
                      text = e.toString().substring(23);
                      // 'The email address is already in use by another account';
                    });
                    print('error:$e');
                  }
                },
                height: 45,
                width: 120,
              )
            ],
          ),
        ),
      ),
    );
  }
}
