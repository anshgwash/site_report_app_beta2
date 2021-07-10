import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart' as widgets;
import 'package:flutter/material.dart' as material;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:site_report_app_beta2/Screens/PdfViewerPage.dart';

// add valueImage parameter
PdfMaker(context, value, valueImage) async {
  final Document pdf = Document();
  List<MemoryImage> realImage = [];
  List<String> realImageRemarks = [];
  final finallogo = MemoryImage(
      (await rootBundle.load('assets/logo.png')).buffer.asUint8List());

  for (int i = 1; i < 31; i++) {
    if (valueImage.isNotEmpty && valueImage['img$i'] != null) {
      print('Image $i is not empty');
      String imgFiles = valueImage['img$i'].toString();
      print(imgFiles);
      print(imgFiles.substring(8, imgFiles.length - 2));
      File file = File(imgFiles.substring(8, imgFiles.length - 2));
      realImage.add(MemoryImage(file.readAsBytesSync()));
      realImageRemarks.add(valueImage['img$i-Remark']);
    }
  }

  var now = DateTime.now();

  String dateForName = '${now.day}' + '_${now.month}' + '_${now.year}';

  pdf.addPage(
    MultiPage(
        pageFormat: PdfPageFormat.a4,
        crossAxisAlignment: CrossAxisAlignment.start,
        build: (context) {
          return <Widget>[
            Header(
              // textStyle: TextStyle(fontSize: 19),
              level: 0,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${value['projectName']}',
                        style: TextStyle(fontSize: 16)),
                    Image.provider(finallogo,
                        height: 74.3, width: 60, fit: BoxFit.contain),
                  ]),
            ),
            Header(
              text: '${value['subject']} check on ${value['date']}',
              level: 2,
            ),
            Table.fromTextArray(
              columnWidths: {
                0: FractionColumnWidth(0.4),
                1: FractionColumnWidth(0.6)
              },
              context: context,
              data: <List<String>>[
                <String>['Category', 'Value'],
                <String>[
                  'Arch Dwg No.:',
                  '${value['archDwgNo']} - ${value['archRevNo']}'
                ],
                <String>[
                  'Structural Dwg No.:',
                  '${value['structuralDwgNo']} - ${value['structuralRevNo']}'
                ],
                <String>[
                  'Section Dwg No.:',
                  '${value['sectionDwgNo']} - ${value['sectionRevNo']}'
                ],
                <String>[
                  'Elevation Dwg No.:',
                  '${value['elevDwgNo']} - ${value['elevRevNo']}'
                ],
                <String>[
                  'Slab Level',
                  '${value['slabLvl']} - ${value['slabLvlPart']}'
                ],
                <String>[
                  'Site Report No.:',
                  '${value['siteReportNo'].toString()}'
                ],
                <String>['Site Report By:', '${value['reportBy']}'],
              ],
            ),
            SizedBox(height: 10),
            Table.fromTextArray(context: context, data: <List<String>>[
              <String>['Representing', 'Name and designation'],
              <String>['Architect', '${value['archRep']}'],
              <String>['Client', '${value['clientRep']}'],
              <String>['Contractor', '${value['contractorRep']}'],
            ], columnWidths: {
              0: FractionColumnWidth(0.4),
              1: FractionColumnWidth(0.6)
            }),
            Header(
              level: 2,
              child: Text('Following points were observed during site visit'),
            ),
            Table.fromTextArray(
              context: context,
              data: <List<String>>[
                <String>['Sr No', 'Description of Items', 'Y/N', 'Remarks'],
                <String>['1', 'Drawings on site- Audit', '-', '-'],
                <String>[
                  'A',
                  'No superseded drawings on site/correct drawings being referred',
                  '${yesNo(text: 'dwgUpToDate', value: value)}'
                ],
                <String>[''],
                <String>['2', 'Site Development', '-', '-'],
                <String>[
                  'A',
                  'North of site as per demarcation',
                  '${yesNo(text: 'northAsPerDwg', value: value)}'
                ],
                <String>[
                  'B',
                  'UG Tanks top slab level marking',
                  '${yesNo(text: 'ugTanks', value: value)}',
                  '${value['ugTanks-Remark']}'
                ],
                <String>[
                  'C',
                  'Site levels marking w.r.t. road level',
                  '${yesNo(text: 'roadLvl', value: value)}',
                  '${value['roadLvl-Remark']}'
                ],
                <String>[''],
                <String>['3', 'Setting out & Centre line checking', '-', '-'],
                <String>[
                  'A',
                  'Open Offset Dimension',
                  '${yesNo(text: 'openOffsetDim', value: value)}',
                  '${value['openOffsetDim-Remark']}'
                ],
                <String>[
                  'B',
                  'Column marking as per centre line',
                  '${yesNo(text: 'columnMarkPcl', value: value)}',
                  '${value['columnMarkPcl-Remark']}'
                ],
                <String>[''],
                <String>['4', 'Shuttering Check', '-', '-'],
                <String>[
                  'A',
                  'Overall Checking - Supporting lvl, no gaps etc.',
                  '${yesNo(text: 'shutteringCheck', value: value)}',
                  '${value['shutteringCheck-Remark']}'
                ],
                <String>[''],
                <String>['5', 'Slab Checking', '-', '-'],
                <String>[
                  'A',
                  'Slab level',
                  '${yesNo(text: 'slabLvl', value: value)}'
                ],
                <String>[
                  'B',
                  'Cutout for Lift Dimension',
                  '${yesNo(text: 'cutoutLift', value: value)}'
                ],
                <String>[
                  'C',
                  'Cutout for Plumbing Shaft',
                  '${yesNo(text: 'cutOutPlumb', value: value)}'
                ],
                <String>[
                  'D',
                  'Cutout for Electrical',
                  '${yesNo(text: 'cutOutElectrical', value: value)}'
                ],
                <String>[
                  'E',
                  'Flower Bed Sunk',
                  '${yesNo(text: 'flowerBedSunk', value: value)}'
                ],
                <String>[
                  'F',
                  'Toilet Sunk',
                  '${yesNo(text: 'toiletSunk', value: value)}'
                ],
                <String>[
                  'G',
                  'Terrace/Balcony Sunk',
                  '${yesNo(text: 'balconySunk', value: value)}'
                ],
                <String>[
                  'H',
                  'Terrace Projection',
                  '${yesNo(text: 'terraceProj', value: value)}'
                ],
                <String>[
                  'I',
                  'Basements checking',
                  '${yesNo(text: 'basement', value: value)}'
                ],
                <String>[
                  'J',
                  'Size of Column',
                  '${yesNo(text: 'columnSize', value: value)}'
                ],
                <String>[
                  'K',
                  'Alignment of Column',
                  '${yesNo(text: 'columnAlign', value: value)}'
                ],
                <String>[
                  'L',
                  'Reduction of Column',
                  '${yesNo(text: 'columnRed', value: value)}'
                ],
                <String>[
                  'M',
                  'Beam - Size and Location',
                  '${yesNo(text: 'beamSizeLoc', value: value)}'
                ],
                <String>[
                  'N',
                  'Alignment of Beam Internal',
                  '${yesNo(text: 'beamAlignInt', value: value)}'
                ],
                <String>[
                  'O',
                  'Alignment of Beam External',
                  '${yesNo(text: 'beamAlignExt', value: value)}'
                ],
                <String>[
                  'P',
                  'Alignment of Beam wrt slab lvl',
                  '${yesNo(text: 'beamAlignSlab', value: value)}'
                ],
                <String>[
                  'Q',
                  'Electrical Sleeves',
                  '${yesNo(text: 'electricalSleeves', value: value)}'
                ],
                <String>[
                  'R',
                  'Plumbing Sleeves',
                  '${yesNo(text: 'plumbingSleeves', value: value)}'
                ],
                <String>[
                  'S',
                  'Hook Fan Location',
                  '${yesNo(text: 'hookFanLoc', value: value)}'
                ],
                <String>[
                  'T',
                  'Alignment of Chajja Protection wrt slab lvl',
                  '${yesNo(text: 'chajjaAlign', value: value)}'
                ],
                <String>[
                  'U',
                  'Chajja Protection - Size and Location',
                  '${yesNo(text: 'chajjaProj', value: value)}'
                ],
                <String>[
                  'V',
                  'Slab Projection - any other',
                  '${yesNo(text: 'slabProjOther', value: value)}'
                ],
                <String>[''],
                <String>['6', 'Staircase', '-', '-'],
                <String>[
                  'A',
                  'Width of Staircase',
                  '${yesNo(text: 'widthStaircase', value: value)}'
                ],
                <String>[
                  'B',
                  'Dimension of Risers, Treads',
                  '${yesNo(text: 'dimRisers', value: value)}'
                ],
                <String>[
                  'C',
                  'Mid Landing Level of Staircase',
                  '${yesNo(text: 'midLandingLvl', value: value)}'
                ],
                <String>[
                  'D',
                  'Hand Railing Details',
                  '${yesNo(text: 'handRailingDet', value: value)}'
                ],
                <String>[''],
                <String>['7', 'Block Work', '-', '-'],
                <String>[
                  'A',
                  'Line & Level of Brickwork',
                  '${yesNo(text: 'lineOfBrickWork', value: value)}'
                ],
                <String>[''],
                <String>['8', 'Block Work', '-', '-'],
                <String>[
                  'A',
                  'South side',
                  '${yesNo(text: 'southSide', value: value)}'
                ],
                <String>[
                  'B',
                  'North side',
                  '${yesNo(text: 'northSide', value: value)}'
                ],
                <String>[
                  'C',
                  'East side',
                  '${yesNo(text: 'eastSide', value: value)}'
                ],
                <String>[
                  'D',
                  'West side',
                  '${yesNo(text: 'westSide', value: value)}'
                ],
              ],
              columnWidths: {
                0: FractionColumnWidth(0.05),
                1: FractionColumnWidth(0.5),
                2: FractionColumnWidth(0.05),
                3: FractionColumnWidth(0.4)
              },
            ),
            Table.fromTextArray(data: <List<String>>[
              <String>['Additional Remarks'],
              <String>['${value['additionalRemarks']}'],
            ], cellStyle: TextStyle(fontSize: 9)),
            SizedBox(height: 50),
            Table(
              columnWidths: {
                0: FractionColumnWidth(0.05),
                1: FractionColumnWidth(0.5),
                2: FractionColumnWidth(0.45)
              },
              children: realImage.asMap().entries.map((entry) {
                int index = entry.key + 1;
                print(index);
                MemoryImage image = entry.value;
                return TableRow(
                  children: [
                    Text(' ${index.toString()} ',
                        textScaleFactor: 1.2, textAlign: TextAlign.center),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Image.provider(image, height: 150),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: valueImage['img$index-Remark'] != null
                          ? Text(valueImage['img$index-Remark'],
                              textScaleFactor: 1.2)
                          : Container(),
                    ),
                  ],
                );
              }).toList(),
              border: TableBorder.all(),
            ),
          ];
        }),
  );

  String shareName =
      '${value['projectName']}_${value['subject'].toString()}_$dateForName';

  final String dir = (await getApplicationDocumentsDirectory()).path;
  var AppDir = Directory(dir);
  await for (var entity in AppDir.list(recursive: true, followLinks: false)) {
    print(entity.path);
  }

  print(dir);
  final String path = '$dir/$shareName.pdf';
  // final String path = '/sdcard/download/$shareName.pdf';
  final File file = File(path);
  await file.writeAsBytes(pdf.save());

  material.Navigator.of(context).push(material.MaterialPageRoute(
    builder: (_) => PdfViewerPage(path: path, pdf: pdf, shareName: shareName),
  ));
}

// ignore: missing_return
String yesNo({text, value}) {
  if (value[text] == 'Yes') {
    return 'Yes';
  } else if (value[text] == 'No') {
    return 'No';
  } else if (value[text] == 'N/A') {
    return 'N/A';
  } else {
    return ' ';
  }
}
