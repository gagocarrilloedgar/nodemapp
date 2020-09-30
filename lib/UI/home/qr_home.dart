import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:nodemappweb/UI/screens/generate_qr.dart';
import 'package:nodemappweb/UI/screens/scan_qr.dart';

class QrHome extends StatefulWidget {
  @override
  _QrhomeState createState() => _QrhomeState();
}

class _QrhomeState extends State<QrHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Qr_home"),
        centerTitle: true,
         backgroundColor: Colors.indigo[900]
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(LineAwesomeIcons.qrcode,
            size: 300),
            flatButton("Scan QR CODE", ScanPage()),
            SizedBox(height: 20.0,),
            flatButton("Generate QR CODE", GeneratePage()),
          ],
        ),
      ),
    );
  }

  Widget flatButton(String text, Widget widget) {
    return FlatButton(
      padding: EdgeInsets.all(15.0),
      onPressed: () async {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => widget));
      },
      child: Text(
        text,
        style: TextStyle(color: Colors.indigo[900],fontWeight: FontWeight.bold),
      ),
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.indigo[900],width: 3.0),
          borderRadius: BorderRadius.circular(20.0)),
    );
  }
}
