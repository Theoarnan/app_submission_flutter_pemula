import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Colors
Color primaryColor = const Color(0XFF03A3FF);
Color secondaryColor = const Color(0XFFC3C3C3);
Color yellowColor = const Color(0XFFFFC410);

// Text Styles
TextStyle regularTextStyle = GoogleFonts.poppins(
  color: Colors.black,
);

TextStyle regularBoldTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w600,
  color: Colors.black,
);

TextStyle secondaryTextStyle = GoogleFonts.poppins(
  color: secondaryColor,
);

TextStyle secondaryBoldTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w600,
  color: secondaryColor,
);

// Assets
String imgCoffeeAsset = 'assets/img/coffee-cup.png';
String imgHumbergerAsset = 'assets/img/hamburger.png';
String imgHotelAsset = 'assets/img/hotel.png';
String imgTransportationAsset = 'assets/img/transportation.png';
