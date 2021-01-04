import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:football_flutter_ui/Screens/Barcelona.dart';
import 'package:football_flutter_ui/Screens/bayern.dart';
import 'package:football_flutter_ui/Screens/juventus.dart';
import 'package:football_flutter_ui/Screens/liverpool.dart';
import 'package:football_flutter_ui/constants/color_palette.dart';
import 'package:google_fonts/google_fonts.dart';


class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final colorPalette = ColorPalette();

  var _selectedOption = 0;

  List allOptions = [Juventus(), Barcelona(), Liverpool(), Bayern()];

  List isSelected = [true, false, false, false];

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Stack(
          children: [
            Container(
                height: screenHeight,
                width: screenWidth,
                color: Colors.transparent),
            Container(
                height: screenHeight,
                width: screenWidth / 5,
                color: colorPalette.leftBarColor),
            Positioned(
              top: 25,
                left: screenWidth / 5,
                child: Container(
                  height: screenHeight,
                  width: screenWidth - (screenWidth / 5),
                   color: Colors.black,
                )),
            Positioned(top: 35.0, left: 20.0, child: Icon(Feather.menu)),
            Positioned(top: 35.0, right: 20.0, child: Icon(Feather.shopping_bag,color: Colors.white,)),
            Positioned(
                top: screenHeight - (screenHeight - 100.0),
                left: (screenWidth / 5) + 25.0,
                child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Football',
                      style: GoogleFonts.bigShouldersText(
                          color: Colors.white, fontSize: 40.0)),
                  Text('Lets Football',
                      style: GoogleFonts.bigShouldersText(
                          color: Colors.white70, fontSize: 15.0)),
                  SizedBox(height: 20.0),
                  Container(
                    height: 40.0,
                    width: 225.0,
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide:
                            BorderSide(color: Colors.grey.withOpacity(0.4)),
                          ),
                          contentPadding: EdgeInsets.only(top: 10.0, left: 10.0),
                          hintText: 'search...',
                          hintStyle: GoogleFonts.bigShouldersText(
                              color: Color(0xFFA59FB0), fontSize: 15.0),
                          suffixIcon: Icon(Icons.search,
                              color: Colors.grey.withOpacity(0.4))),
                    ),
                  )
                ])),
            buildSideNavigator(),
            Positioned(
                top: 230,
                left: (screenWidth / 5) + 25.0,
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.white,
                    height: screenHeight - ((screenHeight / 3) + 50.0),
                    width: screenWidth - ((screenWidth / 5) + 40.0),
                    child: allOptions[_selectedOption]
                )
            )
          ],
        ));
  }

  buildSideNavigator() {
    return Positioned(
        top: 75.0,
        child: RotatedBox(
            quarterTurns: 3,
            child: Container(
              color: Colors.black,
                width: MediaQuery.of(context).size.height - 70,
                height: MediaQuery.of(context).size.width / 5,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildOption('Juventus', 0),
                      buildOption('Barcelona', 1),
                      buildOption('Liverpool', 2),
                      buildOption('Bayern', 3),
                    ]))));
  }

  buildOption(String title, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isSelected[index]
            ? Container(
            height: 8.0,
            width: 8.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.white))
            : Container(
            height: 8.0,
            width: 8.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.transparent)),
        SizedBox(height: 5.0),
        GestureDetector(onTap: () {
          setState(() {
            _selectedOption = index;
            isOptionSelected(index);
          });

        },
            child: Text(
              title,
              style: isSelected[index] ? GoogleFonts.bigShouldersText(
                  color: Colors.purple, fontSize: 18.0) : GoogleFonts.bigShouldersText(
                  color: Color(0xFFA59FB0), fontSize: 17.0),
            )
        )
      ],
    );
  }

  isOptionSelected(index) {
    var previousIndex = isSelected.indexOf(true);
    isSelected[index] = true;
    isSelected[previousIndex] = false;
  }
}