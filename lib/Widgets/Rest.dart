// Temporary
// Rest of the form widgets

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:site_report_app_beta2/Widgets/HeaderWidget.dart';
import 'package:site_report_app_beta2/Widgets/YesNoWidget.dart';

class Rest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'slabLvl',
                decoration: const InputDecoration(
                  labelText: 'Slab level (leave empty if n/a)',
                ),
                valueTransformer: (text) {
                  return text == null ? null : num.tryParse(text);
                },
                keyboardType: TextInputType.number,
              ),
              FormBuilderTextField(
                name: 'siteReportNo',
                decoration: const InputDecoration(
                  labelText: 'Site Report no.',
                ),
                valueTransformer: (text) {
                  return text == null ? null : num.tryParse(text);
                },
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 50),
              SizedBox(height: 50),
              Header(text: 'Section 3 - Checklist'),
              SizedBox(height: 15),
              SmallerHeader(text: '1 - Drawing on site audit'),
              YesNo(
                name: 'dwgUpToDate',
                label: 'Correct and latest drawing being referred',
                remark: false,
              ),
              SizedBox(height: 15),
              SmallerHeader(text: '2 - Site Development'),
              YesNo(
                name: 'northAsPerDwg',
                label: 'North of site as per demarcation',
                remark: false,
              ),
              YesNo(
                name: 'ugTanks',
                label: 'UG tanks top slab level marking',
                remark: true,
              ),
              YesNo(
                name: 'roadLvl',
                label: 'Site levels marking w.r.t road level',
                remark: true,
              ),
              SizedBox(height: 15),
              SmallerHeader(text: '3 - Setting out & center line checking'),
              YesNo(
                name: 'openOffsetDim',
                label: 'Open offset dimension',
                remark: true,
              ),
              YesNo(
                name: 'columnMarkPcl',
                label: 'Column marking as per centre line',
                remark: true,
              ),
              SizedBox(height: 15),
              SmallerHeader(text: '4 - Shuttering Check'),
              YesNo(
                name: 'shutteringCheck',
                label: 'Overall checking - supporting level, no gaps etc',
                remark: true,
              ),
              SizedBox(height: 15),
              SmallerHeader(text: '5 - Slab checking'),
              FormBuilderTextField(
                name: 'lvlOfSlab',
                decoration: const InputDecoration(
                  labelText: 'Level of slab',
                ),
                valueTransformer: (text) {
                  return text == null ? null : num.tryParse(text);
                },
                keyboardType: TextInputType.number,
              ),
              YesNo(
                name: 'cutOutLift',
                label: 'Cut out for lift dimension',
                remark: false,
              ),
              YesNo(
                name: 'cutOutPlumb',
                label: 'Cut out for plumbing shaft',
                remark: false,
              ),
              YesNo(
                name: 'cutOutElectrical',
                label: 'Cut out for electrical',
                remark: false,
              ),
              YesNo(
                name: 'flowerBedSunk',
                label: 'Flower bed sunk',
                remark: false,
              ),
              YesNo(
                name: 'toiletSunk',
                label: 'Toilet Sunk',
                remark: false,
              ),
              YesNo(
                name: 'balconySunk',
                label: 'Terrace/balcony sunk',
                remark: false,
              ),
              YesNo(
                name: 'terraceProj',
                label: 'Terrace projection',
                remark: false,
              ),
              YesNo(
                name: 'basement',
                label: 'Basement checking',
                remark: false,
              ),
              YesNo(
                name: 'columnSize',
                label: 'Size of column',
                remark: false,
              ),
              YesNo(
                name: 'columnAlign',
                label: 'Alignment of column',
                remark: false,
              ),
              YesNo(
                name: 'columnRed',
                label: 'Reduction of column',
                remark: false,
              ),
              YesNo(
                name: 'beamSizeLoc',
                label: 'Beam size and location',
                remark: false,
              ),
              YesNo(
                name: 'beamAlignInt',
                label: 'Alignment of beam internally',
                remark: false,
              ),
              YesNo(
                name: 'beamAlignExt',
                label: 'Alignment of beam externally',
                remark: false,
              ),
              YesNo(
                name: 'beamAlignSlab',
                label: 'Alignment of beam w.r.t. slab level',
                remark: false,
              ),
              YesNo(
                name: 'electricalSleeves',
                label: 'Electrical sleeves',
                remark: false,
              ),
              YesNo(
                name: 'plumbingSleeves',
                label: 'Plumbing sleeves',
                remark: false,
              ),
              YesNo(
                name: 'hookFanLoc',
                label: 'Hook fan location',
                remark: false,
              ),
              YesNo(
                name: 'chajjaAlign',
                label: 'Alignment of chajja projection wrt slab level',
                remark: false,
              ),
              YesNo(
                name: 'chajjaProj',
                label: 'Chajja projection - size and location',
                remark: false,
              ),
              YesNo(
                name: 'slabProjOther',
                label: 'Slab Projection - any other',
                remark: false,
              ),
              SizedBox(height: 20),
              SmallerHeader(text: '6 - Staircase'),
              YesNo(
                name: 'widthStaircase',
                label: 'Width of Staircase',
                remark: false,
              ),
              YesNo(
                name: 'dimRisers',
                label: 'Dimensions of risers/treads',
                remark: false,
              ),
              YesNo(
                name: 'midLandingLvl',
                label: 'Mid Landing Level of Staircase',
                remark: false,
              ),
              YesNo(
                name: 'handRailingDet',
                label: 'Hand Railing Details',
                remark: false,
              ),
              SizedBox(height: 20),
              SmallerHeader(text: '7 - Block work'),
              YesNo(
                name: 'lineOfBrickWork',
                label: 'Line and Level of Brick Work',
                remark: false,
              ),
              SizedBox(height: 20),
              SmallerHeader(text: '8 - Architectural Elevation Features'),
              YesNo(
                name: 'southSide',
                label: 'South side',
                remark: false,
              ),
              YesNo(
                name: 'northSide',
                label: 'North side',
                remark: false,
              ),
              YesNo(
                name: 'eastSide',
                label: 'East side',
                remark: false,
              ),
              YesNo(
                name: 'westSide',
                label: 'West side',
                remark: false,
              ),
              FormBuilderTextField(
                name: 'additionalRemarks',
                maxLines: 5,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'Additional Remarks',
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
