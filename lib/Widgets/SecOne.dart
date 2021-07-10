// Section 1 : Basic Info
// 1. Project Name
// 2. Report By
// 3. Type of check

// TextEditingController for 'subject' value

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:site_report_app_beta2/Widgets/HeaderWidget.dart';
// import 'package:provider/provider.dart';

TextEditingController subjectController = TextEditingController();

class SecOne extends StatefulWidget {
  @override
  _SecOneState createState() => _SecOneState();
}

class _SecOneState extends State<SecOne> {
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
                maxLength: 60,
                validator: (value) {
                  if (value.isEmpty) {
                    return "\*required field";
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
                onChanged: (val) {
                  subjectController.text = val;
                  print(subjectController.text);
                },
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
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: FormBuilderTextField(
                      name: 'siteReportNo',
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Report No.',
                        counterText: '',
                      ),
                      maxLength: 2,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      textCapitalization: TextCapitalization.characters,
                      textAlign: TextAlign.center,
                      valueTransformer: (text) {
                        return text == null ? ' ' : text;
                      },
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 3,
                    child: FormBuilderDateTimePicker(
                      name: 'date',
                      inputType: InputType.date,
                      initialDate: DateTime.now(),
                      valueTransformer: (date) {
                        return date == null
                            ? '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}'
                            : '${date.day}/${date.month}/${date.year}';
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.calendar_today),
                        labelText:
                            '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}
