import 'package:app/provider/cart_data.dart';
import 'package:app/provider/head_provider.dart';
import 'package:app/provider/main_data_provider.dart';
import 'package:app/provider/single_page.dart';
import 'package:app/provider/user_prov.dart';
import 'package:app/screens/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'e-app-7afff',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MainDataProvider>(
          create: (_) => MainDataProvider(),
        ),
        ChangeNotifierProvider<HeadProvider>(
          create: (_) => HeadProvider(),
        ),
        ChangeNotifierProvider<SinglePage>(
          create: (_) => SinglePage(),
        ),
        ChangeNotifierProvider<CartDataProvider>(
          create: (_) => CartDataProvider(),
        ),
        ChangeNotifierProvider<UserProv>(
          create: (_) => UserProv(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}
