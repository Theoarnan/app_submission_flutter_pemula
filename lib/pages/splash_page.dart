import 'dart:async';

import 'package:app_submission_flutter_pemula/pages/home_page.dart';
import 'package:app_submission_flutter_pemula/utils/themes.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  startSplashScreen() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.pin_drop_rounded,
              color: primaryColor,
              size: MediaQuery.of(context).size.height * 0.24,
            ),
            Text(
              'To Travellers',
              overflow: TextOverflow.clip,
              style: regularBoldTextStyle.copyWith(
                fontSize: 40,
              ),
            ),
            Text(
              'If you never try, you never knows',
              style: secondaryTextStyle.copyWith(fontSize: 20),
            ),
            const SizedBox(
              height: 50,
            ),
            const CircularProgressIndicator(),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Loading...',
              style: secondaryTextStyle.copyWith(fontSize: 14),
            ),
          ],
        ),
      )),
    );
  }
}
