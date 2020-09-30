import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:nodemappweb/Shared/themes.dart';
import 'package:random_color/random_color.dart';

class BikeCard extends StatelessWidget {
  final String title;
  final String parts;
  final double width;
  BikeCard(this.title, this.parts, this.width);
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Container(
          decoration: boxTileStyle,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircleAvatar(
                  child: Icon(LineAwesomeIcons.bicycle),
                  backgroundColor:
                      RandomColor().randomColor(colorHue: ColorHue.blue),
                  radius: 35,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(
                  height: 5,
                  color: Colors.indigo[900],
                  thickness: 0.5,
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [titleListTileText(title), subtitleListTileText(parts)],
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        LineAwesomeIcons.arrow_right,
                        color: Colors.indigo[900],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
