import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';

// ignore: camel_case_types
class image extends StatelessWidget {
  final String att;
  final String label;

  image({this.att, this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey)],
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            // child: Text("WOW"),
            child: FormBuilderImagePicker(
              name: '$att',
              decoration: InputDecoration(
                labelText: '$label',
                border: InputBorder.none,
                labelStyle:
                    TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              iconColor: Colors.grey[500],
              maxImages: 1,
              imageQuality: 50,
              preferredCameraDevice: CameraDevice.rear,
            ),
          ),
          Expanded(
            flex: 1,
            child: FormBuilderTextField(
              name: '$att-Remark',
              decoration: const InputDecoration(
                enabled: true,
                contentPadding: EdgeInsets.only(top: 0),
                labelText: 'Description',
              ),
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              minLines: 1,
              maxLines: 4,
              maxLength: 50,
            ),
          ),
        ],
      ),
    );
  }
}
