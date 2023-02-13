import 'package:app_submission_flutter_pemula/models/acommodation_model.dart';
import 'package:app_submission_flutter_pemula/pages/widgets/title_section_home.dart';
import 'package:app_submission_flutter_pemula/utils/themes.dart';
import 'package:flutter/material.dart';

class PopularDestinationHome extends StatelessWidget {
  const PopularDestinationHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final dataList = dataAcomodation;
    dataList.sort((a, b) => double.tryParse(a.acomodationRating!)!
        .compareTo(double.tryParse(b.acomodationRating!)!));

    return SizedBox(
      height: size.height * 0.22,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleSectionHome(titleSection: 'Popular Destination'),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(right: 16),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: dataAcomodation.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(vertical: 4),
                itemBuilder: (context, i) {
                  final data = dataAcomodation[i];
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                              color: secondaryColor.withOpacity(0.2),
                              blurRadius: 4,
                              spreadRadius: 0,
                              offset: const Offset(0, 0)),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  data.acomodationPoster!,
                                )),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: SizedBox(
                                width: 180,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      data.acomodationName!,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: regularBoldTextStyle.copyWith(
                                          fontSize: 16),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 1),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.star_rate_rounded,
                                              size: 14,
                                              color: Color(0XFFFFC209),
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                              data.acomodationRating!,
                                              style:
                                                  regularBoldTextStyle.copyWith(
                                                fontSize: 12,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                width: 190,
                                child: Text(
                                  data.acomodationDescription!,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      secondaryTextStyle.copyWith(fontSize: 14),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
