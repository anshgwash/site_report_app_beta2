import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:site_report_app_beta2/Screens/FormText.dart';
import 'package:site_report_app_beta2/Screens/FormImages.dart';

class FormSelectorTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal[400],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: 'Form'),
              Tab(text: 'Images'),
            ],
          ),
          title: Text('Site Report App beta v2.0'),
          centerTitle: true,
          elevation: 0,
        ),
        body: TabBarView(
          children: <Widget>[
            FormText(),
            FormImages(),
          ],
        ),
      ),
    );
  }
}
