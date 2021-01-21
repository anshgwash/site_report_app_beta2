import 'package:flutter/material.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

// ignore: camel_case_types
class image extends StatelessWidget {
  final String att;
  final String label;

  image({this.att, this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: FormBuilderImagePicker(
            name: '$att',
            decoration:
                InputDecoration(labelText: '$label', border: InputBorder.none),
            iconColor: Colors.grey[500],
            maxImages: 1,
            imageQuality: 50,
          ),
        ),
        Expanded(
          flex: 5,
          child: FormBuilderTextField(
            name: '$att-Remark',
            decoration: const InputDecoration(
              //enabled: true,
              //contentPadding: EdgeInsets.only(top: 0),
              labelText: 'Description:',
            ),
            maxLengthEnforced: true,
            maxLength: 60,
          ),
        ),
      ],
    );
  }
}
