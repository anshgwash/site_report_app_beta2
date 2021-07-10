import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';

class DwgNo extends StatefulWidget {
  final String name;
  final String label;
  DwgNo({this.name, this.label});

  @override
  _DwgNoState createState() => _DwgNoState();
}

class _DwgNoState extends State<DwgNo> {
  final myController = TextEditingController();
  final myOtherController = TextEditingController();
  int _cameraOcr = FlutterMobileVision.CAMERA_BACK;
  String _textValue = "";
  bool _autoFocusOcr = true;
  bool _torchOcr = false;
  bool _multipleOcr = false;
  bool _waitTapOcr = true;
  bool _showTextOcr = true;
  Size _previewOcr;

  @override
  void initState() {
    super.initState();
    FlutterMobileVision.start().then((previewSizes) => setState(() {
          _previewOcr = previewSizes[_cameraOcr].first;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.fromLTRB(10, 10, 5, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey)],
            color: Colors.white,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: FormBuilderTextField(
                      name: '${widget.name}DwgNo',
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '${widget.label} Dwg No.',
                      ),
                      maxLines: 1,
                      textCapitalization: TextCapitalization.characters,
                      controller: myController,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(2.5, 0, 2.5, 0),
                    child: IconButton(
                      icon: Icon(Icons.camera_alt),
                      onPressed: _read,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: FormBuilderTextField(
                      controller: myOtherController,
                      name: '${widget.name}RevNo',
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefix: Text('R - '),
                        labelText: 'Rev No.',
                        counterText: '',
                      ),
                      maxLength: 2,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      textCapitalization: TextCapitalization.characters,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: SizedBox(),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Future<Null> _read() async {
    List<OcrText> texts = [];
    try {
      texts = await FlutterMobileVision.read(
        showText: true,
        camera: _cameraOcr,
        multiple: true,
        waitTap: true,
        autoFocus: true,
        fps: 1.0,
      );
      setState(() {
        texts.forEach((ocrText) {
          if (ocrText.value.startsWith('TF')) {
            print('$ocrText starts with TF');
            _textValue = ocrText.value;
          }
        });
        // _textValue = texts[0].value; // Getting first text block...
        // if (_textValue.startsWith('TF')) {
        //   print('it starts with TF');
        // }
        myController.text = _textValue;
      });
    } on Exception {
      texts.add(new OcrText('Failed to recognize text.'));
    }
  }
}
