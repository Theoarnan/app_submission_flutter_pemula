import 'package:app_submission_flutter_pemula/models/category_model.dart';
import 'package:app_submission_flutter_pemula/pages/widgets/title_section_home.dart';
import 'package:app_submission_flutter_pemula/utils/themes.dart';
import 'package:app_submission_flutter_pemula/utils/toast_custom.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({super.key});

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  int indexActive = 0;
  List<CategoryModel> dataCategory = [
    CategoryModel('Hostelry', imgHotelAsset),
    CategoryModel('Eatery', imgHumbergerAsset),
    CategoryModel('Caffee', imgCoffeeAsset),
    CategoryModel('Transport', imgTransportationAsset),
  ];

  FToast fToast = FToast();

  @override
  void initState() {
    fToast = FToast();
    fToast.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleSectionHome(titleSection: 'Category'),
          Expanded(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10).copyWith(right: 0),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: dataCategory.length,
                padding: const EdgeInsets.symmetric(vertical: 3),
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        indexActive = i;
                      });
                      fToast.showToast(
                        child: toast(
                            'You clicked category ${dataCategory[i].categoryName}'),
                        gravity: ToastGravity.BOTTOM,
                        toastDuration: const Duration(seconds: 1),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(
                        vertical: 3,
                        horizontal: 14,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: indexActive == i ? primaryColor : Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: secondaryColor.withOpacity(0.2),
                                blurRadius: 6,
                                spreadRadius: 0,
                                offset: const Offset(0, 0)),
                          ]),
                      child: Row(
                        children: [
                          Image.asset(dataCategory[i].imgIlustration,
                              height: 18),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            dataCategory[i].categoryName,
                            overflow: TextOverflow.ellipsis,
                            style: secondaryTextStyle.copyWith(
                              fontSize: 18,
                              color: indexActive == i
                                  ? Colors.white
                                  : secondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
