import 'package:asakatsu/components/coupon.dart';
import 'package:asakatsu/components/navbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Asakatsu",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: "人間情報システム演習のやつ"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Center(
            child: Column(
              children: const [
                CouponCard(couponID: "coupon2022"),
                CouponCard(couponID: "coupon2022"),
                CouponCard(couponID: "coupon2022"),
              ]
            ),
          ),
          bottomNavigationBar: const NavBar(),
        ),
    );
  }
}
