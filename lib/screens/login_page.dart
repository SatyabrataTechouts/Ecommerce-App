import 'package:app/components/components/custum_button.dart';
import 'package:app/components/components/navigation/bottom_navigation.dart';
import 'package:app/components/custum_input.dart';
import 'package:app/screens/Sign_up.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  var userIdController = TextEditingController();
  var userPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print(
        "text=============-=-=- ${userIdController.text},${userPassController.text}");
    return Material(
      child: Column(
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1432821596592-e2c18b78144f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
          ),
          SingleChildScrollView(
            child: Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: 32,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustumInput(
                      placeholder: 'Enter email id',
                      controler: userIdController,
                      validator: (value) {
                        if (value == '') {
                          return 'Please enter valid Email';
                        }

                        return null;
                      },
                    ),
                    CustumInput(
                      placeholder: "Password",
                      controler: userPassController,
                      validator: (value) {
                        if (value == '') {
                          return 'Please enter valid password';
                        }

                        return null;
                      },
                    ),
                    CustomButton(
                      btnName: "Login",
                      onTap: () {
                        String uMail = userIdController.text.toString();
                        String pass = userPassController.text.toString();
                        print('$uMail , $pass');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BottomNavigation(),
                          ),
                        );
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                        child: const Text(
                          "dont have Account Signup?",
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
