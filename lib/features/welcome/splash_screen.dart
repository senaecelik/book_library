import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:book_library/app/router/app_router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer;
  @override
  void initState() {
    timer = Timer(const Duration(seconds: 2), () {
      context.router.replace(const WelcomeScreenRoute());
    });

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(
          size: 90,
          Icons.logo_dev_outlined,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
