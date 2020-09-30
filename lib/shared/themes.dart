import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

//######################################### FONT STLE  #########################################

var montserratsmall = GoogleFonts.montserrat(fontSize: 10);
var montserratmedimum = GoogleFonts.montserrat(fontSize: 10);
dynamic subtitleFont = GoogleFonts.montserrat(
    color: Colors.white70, fontSize: 14, fontWeight: FontWeight.w300);

dynamic subtitleClickableFont = GoogleFonts.montserrat(
    color: Colors.blue[500], fontSize: 14, fontWeight: FontWeight.w400);

dynamic builtinAppText = GoogleFonts.montserrat(
    fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w300);

dynamic builtinAppTextSmall =
    GoogleFonts.montserrat(fontSize: 12, color: Colors.grey);

dynamic builtinIndigoFontSmall =
    GoogleFonts.montserrat(color: Colors.indigo[700], fontSize: 9);

dynamic titleFontBig = GoogleFonts.montserrat(
    color: Colors.white70,
    fontSize: 21,
    fontWeight: FontWeight.w400,
    letterSpacing: 1);

dynamic titleFontBlack = GoogleFonts.montserrat(
    color: Colors.black,
    fontSize: 21,
    fontWeight: FontWeight.w400,
    letterSpacing: 1);

dynamic titleFontIndigo = GoogleFonts.montserrat(
    color: Colors.indigo[900],
    fontSize: 21,
    fontWeight: FontWeight.w400,
    letterSpacing: 1);

dynamic titleFont = GoogleFonts.montserrat(
    color: Colors.white70,
    fontSize: 20,
    fontWeight: FontWeight.w300,
    letterSpacing: 1);

dynamic roundButtonTextStyle =
    GoogleFonts.montserrat(color: Colors.white, fontSize: 14);

dynamic builtinIndigoFont =
    GoogleFonts.montserrat(color: Colors.indigo[900], fontSize: 12);
dynamic builtinIndigoFontBig = GoogleFonts.montserrat(
    color: Colors.indigo[900], fontSize: 13, fontWeight: FontWeight.w400);

dynamic titleMontserratIndigoBig = GoogleFonts.montserrat(
    color: Colors.indigo[900], fontSize: 18, fontWeight: FontWeight.w400);

dynamic builtinIndigoBoldFont = GoogleFonts.montserrat(
    color: Colors.indigo[900], fontSize: 14, fontWeight: FontWeight.w500);

dynamic userProfileStatsNumbers = GoogleFonts.montserrat(
    color: Colors.indigo[100], fontSize: 20, fontWeight: FontWeight.w500);

// TEXT

Widget bottomBarIconText(String text) {
  return Text(text, style: montserratsmall);
}

Widget searchBarText(String text) {
  return Text(text, style: builtinIndigoFont);
}

Widget dataCardTitleIndigoText(String text) {
  return Text(text, style: builtinIndigoBoldFont);
}

Widget titleConfigText(String text) =>
    Text(text, style: titleMontserratIndigoBig);

Widget titleListTileText(String title) =>
    Text(title, style: builtinIndigoFontBig);

Widget subtitleListTileText(String subtitle) =>
    Text(subtitle, style: builtinIndigoFont);

BottomNavigationBarItem bottomNavigationBarItem(IconData icon, String text) {
  return BottomNavigationBarItem(
      icon: Icon(icon), title: bottomBarIconText(text));
}

//######################################### SHAPES  #########################################
dynamic roundButtonShape =
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(30));

dynamic cleanButtonShape =
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(5));

dynamic dialogShape =
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));

const roundButtonPadding = EdgeInsets.fromLTRB(150, 15, 150, 15);

//######################################### BOX DECORATION  #########################################

dynamic linearGradiengBox = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
    colors: [
      Color.fromRGBO(17, 17, 33, 1),
      Color.fromRGBO(20, 20, 39, 1),
      Color.fromRGBO(21, 21, 52, 1),
      Color.fromRGBO(29, 29, 87, 1),
      Color.fromRGBO(33, 33, 114, 1),
    ],
  ),
);

dynamic linearGradiengBoxUp = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
    colors: [
      Color.fromRGBO(17, 17, 33, 1),
      Color.fromRGBO(20, 20, 39, 1),
      Color.fromRGBO(21, 21, 52, 1),
      Color.fromRGBO(29, 29, 87, 1),
      Color.fromRGBO(33, 33, 114, 1),
    ],
  ),
  borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
);

dynamic textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(30.0),
    borderSide: BorderSide(color: Colors.grey, width: 0.5),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: turqeusaclarologo, width: 1.5),
    borderRadius: BorderRadius.circular(30.0),
  ),
  hintStyle: GoogleFonts.montserrat(color: Colors.grey[400], fontSize: 14),
);

dynamic boxProfileStats = BoxDecoration(
  boxShadow: [
    BoxShadow(color: Colors.grey, offset: Offset(0.0, 1.0)),
  ],
  borderRadius: BorderRadius.all(Radius.circular(5)),
  color: Colors.white,
);

dynamic dropDownMenuShape = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(30)),
  color: Colors.white,
  border: Border.all(color:Colors.grey, width: 0.5),
);

dynamic dropDownFocusMenuShape = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(30)),
  color: Colors.white,
  border: Border.all(color:turqeusaclarologo, width: 1.5),
);

dynamic boxTileStyle = BoxDecoration(
  boxShadow: [
    BoxShadow(color: Colors.grey, offset: Offset(0.0, 1.0)),
  ],
  borderRadius: BorderRadius.all(Radius.circular(10)),
  color: Colors.white,
);
//######################################### IMAGES  #########################################

dynamic logo = Image(
  width: 120,
  image: AssetImage('assets/images/nodemlogo.png'),
);

//######################################### LENGTHS  #########################################
