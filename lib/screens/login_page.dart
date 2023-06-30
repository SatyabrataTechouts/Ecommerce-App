import 'package:app/components/components/custum_button.dart';
import 'package:app/components/components/navigation/bottom_navigation.dart';
import 'package:app/components/custum_input.dart';
import 'package:app/provider/user_prov.dart';
import 'package:app/screens/Sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var userIdController = TextEditingController();

  var userPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final prov = context.read<UserProv>();

    return Scaffold(
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Image.network(
              'https://images.unsplash.com/photo-1432821596592-e2c18b78144f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 32,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustumInput(
                    placeholder: 'Enter email id',
                    controler: userIdController,
                    validator: (value) {
                      final bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(
                        value.toString(),
                      );
                      if (!emailValid) {
                        return 'Please enter valid Email';
                      } else if (value!.isEmpty) {
                        return 'Above Filled cant be empty';
                      }

                      return null;
                    },
                  ),
                  CustumInput(
                    placeholder: "Password",
                    controler: userPassController,
                    isPass: true,
                    validator: (value) {
                      if (value == '') {
                        return 'Please enter valid password';
                      }

                      return null;
                    },
                  ),
                  CustomButton(
                    btnName: "Login",
                    onTap: () async {
                      String email = userIdController.text.toString();
                      String password = userPassController.text.toString();
                      try {
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .signInWithEmailAndPassword(
                          email: email,
                          password: password,
                        );
                        // print(userCredential);
                        User? user = userCredential.user;
                        // print('$email , $password');

                        prov.setUid(user);
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            fullscreenDialog: false,
                            maintainState: true,
                            builder: (context) => BottomNavigation(),
                          ),
                        );
                        // Handle the new user
                      } catch (e) {
                        // Handle error
                      }
                    },
                    height: 45,
                    width: 90,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 12,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: const Text(
                        "dont have Account Signup?",
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
