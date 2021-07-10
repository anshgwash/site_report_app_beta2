import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:site_report_app_beta2/Screens/FormText.dart';
import 'package:site_report_app_beta2/Widgets/SecFive.dart';
import 'package:site_report_app_beta2/Widgets/SecFour.dart';
import 'package:site_report_app_beta2/Widgets/SecOne.dart';
import 'package:site_report_app_beta2/Widgets/SecThree.dart';
import 'package:site_report_app_beta2/Widgets/SecTwo.dart';
// import 'package:provider/provider.dart';

final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

class FormList extends StatelessWidget {
  const FormList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      children: <Widget>[
        FormBuilder(
          onChanged: () {
            formKey.currentState.save();
          },
          key: formKey,
          child: Column(
            children: [
              SecOne(),
              SecTwo(),
              SecThree(),
              SecFour(),
              SecFive(),
            ],
          ),
        ),
      ],
    );
  }
}

// class ChildWdgt extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     if (formKey.currentState == null) {
//       return Column(
//         children: [
//           SecOne(),
//         ],
//       );
//     } else if (formKey.currentState != null) {
//       if (formKey.currentState.value['subject'] == 'Centerline') {
//         return Column(
//           children: [
//             SecOne(),
//             SecTwo(),
//           ],
//         );
//       } else if (formKey.currentState.value['subject'] == 'Plinth') {
//         return Container(child: Text('plinth'));
//       } else if (formKey.currentState.value['subject'] == 'Brick work') {
//         return Container(child: Text('brick'));
//       } else if (formKey.currentState.value['subject'] == 'Slab') {
//         return Container(child: Text('slab'));
//       } else {
//         return Column(
//           children: [
//             SecOne(),
//           ],
//         );
//       }
//     }
//     return Container(child: Text('all else'));
//   }
// }
