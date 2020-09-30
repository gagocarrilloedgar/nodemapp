import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:nodemappweb/Services/showMyDialog.dart';
import 'package:nodemappweb/ViewModels/userViewModel.dart';
import 'package:provider/provider.dart';

import '../not_found.dart';
import '../themes.dart';

class DataCard extends StatefulWidget {
  String title;
  String property;
  final IconData iconProperty;

  DataCard(this.title, this.iconProperty, this.property);

  @override
  _DataCardState createState() => _DataCardState();
}

class _DataCardState extends State<DataCard> {
  final String hint = "Set the value of ";

  final _formKey = GlobalKey<FormState>(); // form validation key

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
              title: dataCardTitleIndigoText(widget.title),
              subtitle: Consumer<UserViewModel>(
                builder:
                    (BuildContext context, UserViewModel _userVM, Widget child) {
                  return TextFormField(
                    decoration: InputDecoration(
                      hintText: widget.property,
                      hintStyle: builtinIndigoFont,
                      border: InputBorder.none,
                    ),
                    validator: (val) =>
                        val.isEmpty ? 'This field can not be empty' : null,
                    onChanged: (val) {
                      setState(() {
                        widget.property = val;
                      });
                    },
                  );
                },
              ),
              leading: Icon(this.widget.iconProperty),
              trailing: IconButton(
                icon: Icon(LineAwesomeIcons.save),
                color: Colors.indigo[300],
                onPressed: () => saveData(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void saveData() {
    if (_formKey.currentState.validate()) {
      showMyDialog(
          context, NotFound("Nice", "Your data has been correctly updated"));
    }
  }
}
