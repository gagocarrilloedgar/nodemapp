import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:random_color/random_color.dart';
import '../themes.dart';

class PartCard extends StatelessWidget {
  final String name;
  final String model;
  PartCard(this.name, this.model);
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
                  child: GFAvatar(
                      backgroundColor:
                          RandomColor().randomColor(colorHue: ColorHue.blue),
                      shape: GFAvatarShape.standard)),
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
                      children: [
                        SizedBox(
                          width: 100,
                          child: RichText(
                            text:
                                TextSpan(text: name, style: builtinIndigoFont),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        SizedBox(
                          width: 100,
                          child: RichText(
                            maxLines: 4,
                            text:
                                TextSpan(text: model, style: builtinIndigoFont),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
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
