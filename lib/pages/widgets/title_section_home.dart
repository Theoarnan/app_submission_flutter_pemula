import 'package:app_submission_flutter_pemula/utils/themes.dart';
import 'package:flutter/material.dart';

class TitleSectionHome extends StatelessWidget {
  final String titleSection;

  const TitleSectionHome({Key? key, required this.titleSection})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10).copyWith(right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titleSection,
            style: regularBoldTextStyle.copyWith(fontSize: 20),
          ),
          Text(
            'View All',
            style: secondaryTextStyle.copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
