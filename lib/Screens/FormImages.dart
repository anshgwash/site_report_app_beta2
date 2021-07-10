import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
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
      body: Container(
        color: Colors.teal[50],
        child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            children: <Widget>[
              FormBuilder(
                key: formKey2,
                child: Column(
                  children: [
                    image(att: 'img1', label: 'Image 1'),
                    image(att: 'img2', label: 'Image 2'),
                    image(att: 'img3', label: 'Image 3'),
                    image(att: 'img4', label: 'Image 4'),
                    image(att: 'img5', label: 'Image 5'),
                    image(att: 'img6', label: 'Image 6'),
                    image(att: 'img7', label: 'Image 7'),
                    image(att: 'img8', label: 'Image 8'),
                    image(att: 'img9', label: 'Image 9'),
                    image(att: 'img10', label: 'Image 10'),
                    image(att: 'img11', label: 'Image 11'),
                    image(att: 'img12', label: 'Image 12'),
                    image(att: 'img13', label: 'Image 13'),
                    image(att: 'img14', label: 'Image 14'),
                    image(att: 'img15', label: 'Image 15'),
                    image(att: 'img16', label: 'Image 16'),
                    image(att: 'img17', label: 'Image 17'),
                    image(att: 'img18', label: 'Image 18'),
                    image(att: 'img19', label: 'Image 19'),
                    image(att: 'img20', label: 'Image 20'),
                    image(att: 'img21', label: 'Image 21'),
                    image(att: 'img22', label: 'Image 22'),
                    image(att: 'img23', label: 'Image 23'),
                    image(att: 'img24', label: 'Image 24'),
                    image(att: 'img25', label: 'Image 25'),
                    image(att: 'img26', label: 'Image 26'),
                    image(att: 'img27', label: 'Image 27'),
                    image(att: 'img28', label: 'Image 28'),
                    image(att: 'img29', label: 'Image 29'),
                    image(att: 'img30', label: 'Image 30'),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
