import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class YesNo extends StatelessWidget {
  final String name;
  final String label;
  // if things don't work with yes no, remove final in next line
  final bool remark;

  YesNo({this.name, this.label, this.remark});

  @override
  Widget build(BuildContext context) {
    if (remark == true) {
      return Column(children: <Widget>[
        FormBuilderRadioGroup(
          name: name,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: label.toString(),
            labelStyle: TextStyle(
              fontSize: 18,
            ),
          ),
          options: [
            FormBuilderFieldOption(
              value: 'Yes',
            ),
            FormBuilderFieldOption(
              value: 'No',
            ),
            FormBuilderFieldOption(
              value: 'N/A',
            ),
          ],
        ),
        FormBuilderTextField(
          name: '$name-Remark',
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Remarks',
          ),
          valueTransformer: (text) {
            return text == null ? ' ' : text;
          },
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          maxLength: 100,
        ),
      ]);
    }
    if (remark == false) {
      return FormBuilderRadioGroup(
        name: name,
        decoration: InputDecoration(
            border: InputBorder.none,
            labelText: label.toString(),
            labelStyle: TextStyle(
              fontSize: 18,
            )),
        options: [
          FormBuilderFieldOption(
            value: 'Yes',
          ),
          FormBuilderFieldOption(
            value: 'No',
          ),
          FormBuilderFieldOption(
            value: 'N/A',
          ),
        ],
      );
    }
  }
}

String yesNo({text, value}) {
  if (value[text] == 'Yes') {
    return 'Yes';
  }
  if (value[text] == 'No') {
    return 'No';
  }
  if (value[text] == 'N/A') {
    return 'N/A';
  }
  return ' ';
}
