// Section 5
// Additional Notes

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

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
          ),
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'additionalRemarks',
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                maxLines: 5,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Additional Remarks',
                ),
                valueTransformer: (text) {
                  return text == null ? ' ' : text;
                },
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
