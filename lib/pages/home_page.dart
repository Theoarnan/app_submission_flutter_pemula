import 'package:app_submission_flutter_pemula/pages/widgets/header_home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16).copyWith(top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              // Header
              HeaderHomeWidget(),
              // Category

              // Content

              // Popular Destination

              // Travel Group
            ],
          ),
        ),
      ),
    );
  }
}
