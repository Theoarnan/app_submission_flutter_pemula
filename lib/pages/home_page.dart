import 'package:app_submission_flutter_pemula/pages/widgets/category_home.dart';
import 'package:app_submission_flutter_pemula/pages/widgets/content_home.dart';
import 'package:app_submission_flutter_pemula/pages/widgets/header_home.dart';
import 'package:app_submission_flutter_pemula/pages/widgets/popular_destination_home.dart';
import 'package:app_submission_flutter_pemula/pages/widgets/travel_group_home.dart';
import 'package:app_submission_flutter_pemula/utils/custom_scroll.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFEFEFE),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14).copyWith(top: 16, right: 0),
          child: ScrollConfiguration(
            behavior: MyCustomScrollBehavior(),
            child: SingleChildScrollView(
              controller: controller,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    // Header
                    HeaderHomeWidget(),
                    // Category
                    SizedBox(height: 4),
                    CategorySection(),
                    // Content
                    SizedBox(height: 6),
                    ContentHome(),
                    // Popular Destination
                    SizedBox(height: 6),
                    PopularDestinationHome(),
                    // Travel Group
                    SizedBox(height: 6),
                    TravelGroupHome()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
