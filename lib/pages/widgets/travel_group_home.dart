import 'package:app_submission_flutter_pemula/models/travel_accomodation_model.dart';
import 'package:app_submission_flutter_pemula/pages/widgets/title_section_home.dart';
import 'package:app_submission_flutter_pemula/utils/themes.dart';
import 'package:flutter/material.dart';

class TravelGroupHome extends StatelessWidget {
  const TravelGroupHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleSectionHome(titleSection: 'Travel Group'),
          Expanded(
            child: ListView.builder(
              itemCount: dataTravelAcomodation.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 1),
              itemBuilder: (context, i) {
                final data = dataTravelAcomodation[i];
                return GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("You Clicked - ${data.nameTravel} "),
                    ));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 14),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
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
                      children: [
                        Container(
                          width: 114,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  data.posterTravel!,
                                )),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 130,
                              child: Text(
                                data.nameTravel!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    regularBoldTextStyle.copyWith(fontSize: 16),
                              ),
                            ),
                            Text(
                              'Due: 20th Feb, 2023',
                              style: secondaryTextStyle.copyWith(fontSize: 12),
                            ),
                            const SizedBox(height: 10),
                            Expanded(
                              child: CircleAvatar(
                                backgroundColor: secondaryColor,
                                backgroundImage: NetworkImage(
                                  data.imgOwner!,
                                ),
                                radius: 16,
                                onBackgroundImageError:
                                    (exception, stackTrace) =>
                                        Text('NN', style: regularTextStyle),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
