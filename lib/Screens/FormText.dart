import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:site_report_app_beta2/Screens/FormImages.dart';
import 'package:site_report_app_beta2/Services/PdfMaker.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:site_report_app_beta2/Widgets/FormList.dart';
import 'package:site_report_app_beta2/Widgets/FormStepper.dart';
import 'package:site_report_app_beta2/Widgets/SecFive.dart';
import 'package:site_report_app_beta2/Widgets/SecFour.dart';
import 'package:site_report_app_beta2/Widgets/SecOne.dart';
import 'package:site_report_app_beta2/Widgets/SecThree.dart';
import 'package:site_report_app_beta2/Widgets/SecTwo.dart';

class FormText extends StatefulWidget {
  @override
  _FormTextState createState() => _FormTextState();
}

class _FormTextState extends State<FormText>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.teal[50],
        child: FormStepper(),
      ),
      // floatingActionButton: SpeedDial(
      //   backgroundColor: Colors.teal,
      //   child: Icon(Icons.menu),
      //   children: [
      //     SpeedDialChild(
      //         label: 'Submit',
      //         backgroundColor: Colors.green,
      //         child: Icon(Icons.check),
      //         onTap: () async {
      //           if (formKey.currentState.saveAndValidate() &&
      //               formKey2.currentState.saveAndValidate()) {
      //             var value = formKey.currentState.value;
      //             var valueImage = formKey2.currentState.value;
      //             PdfMaker(context, value, valueImage);
      //           } else {
      //             print('Invalid');
      //           }
      //         }),
      //     SpeedDialChild(
      //         backgroundColor: Colors.redAccent,
      //         label: 'Reset all',
      //         child: Icon(Icons.refresh),
      //         onTap: () {
      //           formKey.currentState.reset();
      //           formKey2.currentState.reset();
      //         }),
      //   ],
      // ),
    );
  }
}
