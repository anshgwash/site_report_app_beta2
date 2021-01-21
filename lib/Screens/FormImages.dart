import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:site_report_app_beta2/Widgets/FormImageWidget.dart';
import 'package:site_report_app_beta2/Widgets/HeaderWidget.dart';

final GlobalKey<FormBuilderState> formKey2 = GlobalKey<FormBuilderState>();

class FormImages extends StatefulWidget {
  @override
  _FormImagesState createState() => _FormImagesState();
}

class _FormImagesState extends State<FormImages>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          children: <Widget>[
            FormBuilder(
              key: formKey2,
              child: Column(
                children: <Widget>[
                  Header(
                    text: 'Elevation images',
                  ),
                  image(
                    att: 'elev1',
                    label: 'Front',
                  ),
                  image(
                    att: 'elev2',
                    label: 'Rear',
                  ),
                  image(
                    att: 'elev3',
                    label: 'Side 1',
                  ),
                  image(
                    att: 'elev4',
                    label: 'Side 2',
                  ),
                  Header(text: 'Other images'),
                  image(
                    att: 'img1',
                    label: 'Image 1',
                  ),
                  image(
                    att: 'img2',
                    label: 'Image 2',
                  ),
                  image(
                    att: 'img3',
                    label: 'Image 3',
                  ),
                  image(
                    att: 'img4',
                    label: 'Image 4',
                  ),
                  image(
                    att: 'img5',
                    label: 'Image 5',
                  ),
                  image(
                    att: 'img6',
                    label: 'Image 6',
                  ),
                  image(
                    att: 'img7',
                    label: 'Image 7',
                  ),
                  image(
                    att: 'img8',
                    label: 'Image 8',
                  ),
                  image(
                    att: 'img9',
                    label: 'Image 9',
                  ),
                  image(
                    att: 'img10',
                    label: 'Image 10',
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
