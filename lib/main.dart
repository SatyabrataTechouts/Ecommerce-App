import 'package:app/provider/cart_data.dart';
import 'package:app/provider/head_provider.dart';
import 'package:app/provider/main_data_provider.dart';
import 'package:app/provider/single_page.dart';
import 'package:app/screens/components/navigation/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
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
      home: BottomNavigation(),
    );
  }
}
