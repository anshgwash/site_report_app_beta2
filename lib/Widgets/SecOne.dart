// Section 1 : Basic Info
// 1. Project Name
// 2. Report By
// 3. Type of check

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:site_report_app_beta2/Widgets/HeaderWidget.dart';

class SecOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey)],
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            // border: Border.all(
            //   color: Colors.teal,
            //   style: BorderStyle.solid,
            //   width: 0,
            // ),
          ),
          child: Column(
            children: [
              Header(text: 'Section 1: Site Report info'),
              SizedBox(height: 20),
              FormBuilderTextField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                name: 'projectName',
                decoration: const InputDecoration(
                    labelText: 'Project Name', border: OutlineInputBorder()),
                textCapitalization: TextCapitalization.words,
                maxLines: 1,
                validator: (value) {
                  if (value.isEmpty) {
                    return "\* required field";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              FormBuilderTextField(
                name: 'reportBy',
                decoration: const InputDecoration(
                    labelText: 'Report by', border: OutlineInputBorder()),
                textCapitalization: TextCapitalization.words,
                maxLines: 1,
              ),
              FormBuilderChoiceChip(
                name: 'subject',
                decoration: const InputDecoration(
                  labelText: 'Type of check',
                  border: InputBorder.none,
                ),
                spacing: 5,
                options: [
                  FormBuilderFieldOption(
                      value: 'Centerline', child: Text('Centerline')),
                  FormBuilderFieldOption(
                      value: 'Plinth', child: Text('Plinth')),
                  FormBuilderFieldOption(value: 'Slab', child: Text('Slab')),
                  FormBuilderFieldOption(
                      value: 'Brick work', child: Text('Brick work')),
                ],
                validator: (value) {
                  if (value != null) {
                    if (value.isEmpty) {
                      return "\* required field";
                    }
                  } else if (value == null) {
                    return "\* required field";
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
