import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:nodemappweb/Services/showMyDialog.dart';
import '../cantModifyDialog.dart';
import '../themes.dart';

class FixedDataCard extends StatelessWidget {
  final String hint = "Set the value of ";
  final _formKey = GlobalKey<FormState>(); // form validation key
  final IconData iconProperty;
  final String property;
  final String _subtitle;
  FixedDataCard(this.property, this.iconProperty, this._subtitle);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Form(
        key: _formKey,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListTile(
              title: dataCardTitleIndigoText(this.property),
              subtitle: searchBarText(this._subtitle),
              leading: Icon(this.iconProperty),
              trailing: Icon(
                LineAwesomeIcons.lock,
                color: Colors.indigo[300],
              ),
              onTap: () => showMyDialog(
                context,
                NotModifiablePropertyDialog(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
