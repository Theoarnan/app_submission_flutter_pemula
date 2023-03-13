import 'package:app_submission_flutter_pemula/models/acommodation_model.dart';
import 'package:app_submission_flutter_pemula/pages/booking_page.dart';
import 'package:app_submission_flutter_pemula/pages/widgets/title_section_home.dart';
import 'package:app_submission_flutter_pemula/utils/custom_scroll.dart';
import 'package:app_submission_flutter_pemula/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailPage extends StatelessWidget {
  final AcomodationModel dataAcomodations;
  DetailPage({Key? key, required this.dataAcomodations}) : super(key: key);

  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final data = dataAcomodations;
    return Scaffold(
      bottomNavigationBar: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: secondaryColor.withOpacity(0.2),
              blurRadius: 4,
              spreadRadius: 0,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Price
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Price',
                  textAlign: TextAlign.center,
                  style: regularBoldTextStyle.copyWith(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: data.acomodationPrice!,
                    style: regularTextStyle.copyWith(
                        color: primaryColor, fontSize: 18),
                    children: [
                      TextSpan(
                        text: '/night',
                        style: regularTextStyle.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Button Booking
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 60,
                ),
              ),
              onPressed: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return BookingPage(
                  dataAcomodations: data,
                );
              })),
              child: Text(
                'Booking Now',
                textAlign: TextAlign.center,
                style: regularTextStyle.copyWith(
                    fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: MyCustomScrollBehavior(),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Content Header Image Detail
                  Expanded(
                    flex: 4,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                data.acomodationPoster!,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 16,
                          left: 16,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.maybePop(context);
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.7),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.arrow_back_ios_new,
                                  size: 20),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 16,
                          right: 16,
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.7),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.bookmark,
                                size: 20,
                                color: data.acomodationIsAddFavorite!
                                    ? primaryColor
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 16,
                          right: 16,
                          bottom: 16,
                          child: Container(
                            height: 100,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 24),
                            width: MediaQuery.of(context).size.width - 32,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Name
                                    SizedBox(
                                      width: 200,
                                      child: Text(
                                        data.acomodationName!,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: regularBoldTextStyle.copyWith(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),

                                    // Address
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            color: primaryColor,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                200,
                                            child: Text(
                                              data.acomodationAddress!,
                                              style: regularTextStyle.copyWith(
                                                  fontSize: 14),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                // Rating
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 1),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                Icons.star_rate_rounded,
                                                size: 20,
                                                color: Color(0XFFFFC209),
                                              ),
                                              const SizedBox(
                                                width: 3,
                                              ),
                                              Text(
                                                data.acomodationRating!,
                                                style: regularBoldTextStyle
                                                    .copyWith(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Text(
                                          'Very Good!',
                                          textAlign: TextAlign.center,
                                          style: regularBoldTextStyle.copyWith(
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Description
                  const SizedBox(
                    height: 6,
                  ),
                  const TitleSectionHome(
                      titleSection: 'Description', withRightButton: false),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      dataAcomodation.last.acomodationDescription!,
                      style: regularTextStyle,
                    ),
                  ),
                  // Gallery
                  const SizedBox(
                    height: 6,
                  ),
                  const TitleSectionHome(
                      titleSection: 'Gallery', withRightButton: false),
                  Container(
                    height: 140,
                    padding: const EdgeInsets.symmetric(horizontal: 10)
                        .copyWith(right: 0),
                    child: ListView.builder(
                      itemCount: data.acomodationImages!.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) {
                        return Container(
                          width: 140,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                data.acomodationImages![i],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // Reviews
                  const SizedBox(
                    height: 6,
                  ),
                  const TitleSectionHome(titleSection: 'Reviews'),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 4),
                          child: ListTile(
                            // tileColor: secondaryColor.withOpacity(0.2),
                            style: ListTileStyle.list,
                            leading: CircleAvatar(
                              backgroundColor: secondaryColor,
                              backgroundImage: const NetworkImage(
                                'https://thispersondoesnotexist.com/image',
                              ),
                              onBackgroundImageError: (exception, stackTrace) =>
                                  Text('NN', style: regularTextStyle),
                            ),
                            title: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Joko susilo',
                                  style:
                                      secondaryTextStyle.copyWith(fontSize: 16),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                RatingBarIndicator(
                                  rating: 4.5,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemCount: 5,
                                  itemSize: 16.0,
                                  direction: Axis.horizontal,
                                ),
                              ],
                            ),
                            subtitle: Text(
                              'Tempatnya bagus banget, nyaman, okelah pokoknya',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: regularTextStyle.copyWith(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
