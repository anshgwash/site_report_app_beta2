// Section 3
// Attendance list

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:site_report_app_beta2/Widgets/HeaderWidget.dart';

class SecThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
              Header(text: 'Section 3 - Attendance list'),
              SizedBox(height: 20),
              FormBuilderTextField(
                name: 'archRep',
                decoration: const InputDecoration(
                    labelText: 'Representing architect',
                    border: OutlineInputBorder()),
                maxLines: 1,
                valueTransformer: (text) {
                  return text == null ? ' ' : text;
                },
              ),
              SizedBox(height: 10),
              FormBuilderTextField(
                name: 'contractorRep',
                decoration: const InputDecoration(
                    labelText: 'Representing contractor',
                    border: OutlineInputBorder()),
                maxLines: 1,
                valueTransformer: (text) {
                  return text == null ? ' ' : text;
                },
              ),
              SizedBox(height: 10),
              FormBuilderTextField(
                name: 'clientRep',
                decoration: const InputDecoration(
                    labelText: 'Representing client',
                    border: OutlineInputBorder()),
                maxLines: 1,
                valueTransformer: (text) {
                  return text == null ? ' ' : text;
                },
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}
