import 'package:flutter/material.dart';
import 'package:site_report_app_beta2/Screens/AboutScreen.dart';
import 'package:site_report_app_beta2/Screens/FormText.dart';
import 'package:site_report_app_beta2/Screens/Settings.dart';
import 'FormImages.dart';

class FormSelectorTab extends StatefulWidget {
  @override
  _FormSelectorTabState createState() => _FormSelectorTabState();
}

class _FormSelectorTabState extends State<FormSelectorTab>
    with RestorationMixin {
  // one
  final RestorableInt _index = RestorableInt(0);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                  title: Text(
                    'Site Report Tool v3',
                    textScaleFactor: 1.2,
                    style: TextStyle(color: Colors.teal.shade800),
                  ),
                  subtitle: Text('custom build for THE FIRM')),
              // ListTile(
              //     title: Text('About'),
              //     leading: Icon(Icons.info),
              //     onTap: () {
              //       Navigator.pop(context);
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => AboutScreen(),
              //           ));
              //     }),
              ListTile(
                  title: Text('Settings'),
                  leading: Icon(Icons.settings),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Settings(),
                        ));
                  }),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.teal[400],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: 'Form'),
              Tab(text: 'Images'),
            ],
          ),
          title: Text('Site Report Tool v3'),
          centerTitle: true,
          elevation: 0,
        ),
        body: TabBarView(
          children: <Widget>[
            // Text("text"),
            FormText(),
            // Text("images")
            FormImages(),
          ],
        ),
      ),
    );
  }

  @override
  String get restorationId => 'home_page';

  @override
  void restoreState(RestorationBucket oldBucket, bool initialRestore) {
    registerForRestoration(_index, 'nav_bar_index');
  }
}
