import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:index/generated/assets.dart';

import 'dashboard.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 1),
    ).then((value) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => Dashboard()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        width: double.infinity,
        height: double.infinity,
        Assets.imagesSplash,
        fit: BoxFit.fill,
      ),
    );
  }
}
