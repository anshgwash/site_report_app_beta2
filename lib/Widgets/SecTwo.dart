// Section 2 : Dwg Numbers
// Depends on Section 1 type of check
// Arch
// Struc
// Section
// Elevation

import 'package:flutter/material.dart';
import 'package:site_report_app_beta2/Screens/FormText.dart';
import 'package:site_report_app_beta2/Widgets/DwgNoWidget.dart';

class SecTwo extends StatefulWidget {
  @override
  _SecTwoState createState() => _SecTwoState();
}

class _SecTwoState extends State<SecTwo> {
  @override
  Widget build(BuildContext context) {
    var children = <Widget>[
      SizedBox(height: 10),
      DwgNo(label: 'Architectural', name: 'arch'),
      DwgNo(label: 'Structural', name: 'structural'),
      DwgNo(label: 'Section', name: 'section'),
      DwgNo(label: 'Elevation', name: 'elev'),
      SizedBox(height: 10),
    ];
    return Column(children: children);
  }
}
