import 'package:app_submission_flutter_pemula/models/acommodation_model.dart';
import 'package:app_submission_flutter_pemula/pages/home_page.dart';
import 'package:app_submission_flutter_pemula/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingPage extends StatefulWidget {
  final AcomodationModel dataAcomodations;
  const BookingPage({Key? key, required this.dataAcomodations})
      : super(key: key);
  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> with RestorationMixin {
  String? datePrevious = DateFormat.yMMMEd().format(DateTime.now());

  @override
  String? get restorationId => 'main';

  final RestorableDateTime _selectedDate = RestorableDateTime(DateTime.now());
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime.now(),
          lastDate: DateTime(2100),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        datePrevious = DateFormat.yMMMEd().format(_selectedDate.value);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.dataAcomodations;
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 60,
            ),
          ),
          onPressed: () {
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) {
              return HomePage();
            }), (route) => false);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Success you booking - ${data.acomodationName} "),
            ));
          },
          child: Text(
            'Continue Booking',
            textAlign: TextAlign.center,
            style: regularTextStyle.copyWith(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () => Navigator.maybePop(context),
        ),
        centerTitle: true,
        title: Text(
          'Detail Booking',
          style: regularBoldTextStyle.copyWith(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Detail Booking
              Container(
                width: MediaQuery.of(context).size.width,
                height: 140,
                margin: const EdgeInsets.symmetric(horizontal: 16)
                    .copyWith(top: 16),
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
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
                child: Row(
                  children: [
                    // Image Acomodation
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              data.acomodationPoster!,
                            )),
                      ),
                    ),

                    // Detail Acoomodation
                    const SizedBox(
                      width: 14,
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            child: Text(
                              data.acomodationName!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  regularBoldTextStyle.copyWith(fontSize: 16),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: primaryColor,
                                size: 14,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 250,
                                child: Text(
                                  data.acomodationAddress!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      regularTextStyle.copyWith(fontSize: 14),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.star_rate_rounded,
                                size: 14,
                                color: Color(0XFFFFC209),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                data.acomodationRating!,
                                style: regularTextStyle.copyWith(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 16)
                    .copyWith(top: 14),
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //  Timeline
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _textData('Check In', '28th Jan, 2023'),
                              const SizedBox(
                                height: 14,
                              ),
                              _textData('Check Out', '30th Jan, 2023'),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _textData('Room Type', 'Deluxe Room'),
                              const SizedBox(
                                height: 14,
                              ),
                              _textData('Bed Type', 'Double Bed'),
                            ],
                          )
                        ],
                      ),
                    ),

                    //  Price
                    const SizedBox(
                      height: 26,
                    ),
                    Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 24),
                      width: MediaQuery.of(context).size.width - 32,
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Text
                          Expanded(
                            child: Text(
                              'Total Price :',
                              style: regularTextStyle.copyWith(fontSize: 18),
                            ),
                          ),

                          // Total Price
                          Expanded(
                            child: Text(
                              "Rp. 22.040.000",
                              textAlign: TextAlign.right,
                              overflow: TextOverflow.ellipsis,
                              style: regularBoldTextStyle.copyWith(
                                  fontSize: 18, color: primaryColor),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 16)
                    .copyWith(top: 24),
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title Dropdown
                    Text(
                      'Reschedule',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: regularBoldTextStyle.copyWith(fontSize: 20),
                    ),

                    // Row Date
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Previous Date',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: secondaryTextStyle.copyWith(fontSize: 18),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            GestureDetector(
                              onTap: () {
                                _restorableDatePickerRouteFuture.present();
                              },
                              child: Container(
                                height: 50,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 14),
                                decoration: BoxDecoration(
                                  color: primaryColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_month_outlined,
                                      color: primaryColor,
                                      size: 16,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      datePrevious.toString(),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: regularTextStyle.copyWith(
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'New Date',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: secondaryTextStyle.copyWith(fontSize: 18),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            GestureDetector(
                              onTap: () {
                                _restorableDatePickerRouteFuture.present();
                              },
                              child: Container(
                                height: 50,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 14),
                                decoration: BoxDecoration(
                                  color: primaryColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_month_outlined,
                                      color: primaryColor,
                                      size: 16,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      datePrevious.toString(),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: regularTextStyle.copyWith(
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _textData(String title, String data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: secondaryTextStyle.copyWith(fontSize: 16),
          ),
        ),
        SizedBox(
          child: Text(
            data,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: regularBoldTextStyle.copyWith(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
