// Section 5
// Additional Notes

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:site_report_app_beta2/Widgets/HeaderWidget.dart';

class SecFive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey)],
            color: Colors.white,
            // border: Border.all(
            //   color: Colors.teal,
            //   style: BorderStyle.solid,
            //   width: 0,
            // ),
          ),
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'additionalRemarks',
                maxLengthEnforced: true,
                maxLines: 5,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Additional Remarks',
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
        SizedBox(height: 80),
      ],
    );
  }
}
