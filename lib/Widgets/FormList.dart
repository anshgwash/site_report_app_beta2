import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:site_report_app_beta2/Screens/FormText.dart';
import 'package:site_report_app_beta2/Widgets/SecFive.dart';
import 'package:site_report_app_beta2/Widgets/SecFour.dart';
import 'package:site_report_app_beta2/Widgets/SecOne.dart';
import 'package:site_report_app_beta2/Widgets/SecThree.dart';
import 'package:site_report_app_beta2/Widgets/SecTwo.dart';

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
          onChanged: () {},
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
