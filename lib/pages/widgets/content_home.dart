import 'package:app_submission_flutter_pemula/models/acommodation_model.dart';
import 'package:app_submission_flutter_pemula/utils/themes.dart';
import 'package:flutter/material.dart';

class ContentHome extends StatefulWidget {
  const ContentHome({Key? key}) : super(key: key);

  @override
  State<ContentHome> createState() => _ContentHomeState();
}

class _ContentHomeState extends State<ContentHome> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.36,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: dataAcomodation.length,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 1),
              itemBuilder: (context, i) {
                final data = dataAcomodation[i];
                return Container(
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Stack(
                            children: [
                              Container(
                                width: 166,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      data.acomodationPoster!,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 8,
                                left: 8,
                                child: Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.star_rate_rounded,
                                        size: 16,
                                        color: Color(0XFFFFC209),
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        data.acomodationRating!,
                                        style: regularBoldTextStyle.copyWith(
                                          fontSize: 14,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 8,
                                right: 8,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.bookmark,
                                    color: data.acomodationIsAddFavorite!
                                        ? primaryColor
                                        : Colors.grey,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  width: 166,
                                  child: Text(
                                    data.acomodationName!,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: regularBoldTextStyle.copyWith(
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text.rich(
                                TextSpan(
                                  text: data.acomodationPrice!,
                                  style: regularTextStyle.copyWith(
                                      color: primaryColor, fontSize: 16),
                                  children: [
                                    TextSpan(
                                      text: '/night',
                                      style: regularTextStyle.copyWith(
                                          fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
