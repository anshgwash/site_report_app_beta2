import 'package:flutter/material.dart';
import 'package:site_report_app_beta2/Screens/FormImages.dart';
import 'package:site_report_app_beta2/Services/PdfMaker.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:site_report_app_beta2/Widgets/FormList.dart';

class FormText extends StatefulWidget {
  @override
  _FormTextState createState() => _FormTextState();
}

class _FormTextState extends State<FormText>
    with AutomaticKeepAliveClientMixin {
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you sure?'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text('This will reset your form'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Confirm'),
              onPressed: () {
                print('Confirmed');
                if (formKey2.currentState == null) {
                  formKey.currentState.reset();
                } else {
                  formKey.currentState.reset();
                  formKey2.currentState.reset();
                }
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.teal[50],
        child: FormList(),
      ),
      floatingActionButton: SpeedDial(
        closeManually: false,
        backgroundColor: Colors.teal,
        child: Icon(Icons.menu),
        children: [
          SpeedDialChild(
              label: 'Submit',
              backgroundColor: Colors.green,
              child: Icon(Icons.check),
              onTap: () async {
                if (formKey.currentState.saveAndValidate() &&
                    formKey2.currentState.saveAndValidate()) {
                  var value = formKey.currentState.value;
                  var valueImage = formKey2.currentState.value;
                  // valueImage goes into PdfMaker
                  PdfMaker(context, value, valueImage);
                } else {
                  print('Invalid');
                }
              }),
          SpeedDialChild(
              backgroundColor: Colors.redAccent,
              label: 'Reset all',
              child: Icon(Icons.refresh),
              onTap: _showMyDialog),
          // onTap: () {
          //   formKey.currentState.reset();
          //   formKey2.currentState.reset();
          // }),
        ],
      ),
    );
  }
}
