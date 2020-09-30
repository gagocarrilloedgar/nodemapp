import 'package:flutter/material.dart';
import 'package:nodemappweb/Shared/themes.dart';

class StolenBikeCard extends StatelessWidget {
  final String _title;
  final String _subtitle;
  StolenBikeCard(this._title, this._subtitle);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: ListTile(
          leading: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.indigo,
          ),
          title: Padding(
            padding: const EdgeInsets.fromLTRB(5,10,0,1),
            child: titleListTileText(_title),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.fromLTRB(5,1,0,10),
            child: subtitleListTileText(_subtitle),
          ),
          trailing: Icon(
            Icons.more_vert,
            color: Colors.indigo[900],
          ),
        ),
      ),
    );
  }
}
