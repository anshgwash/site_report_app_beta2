// import 'package:flutter/material.dart';
// import 'package:site_report_app_beta2/Screens/FormImages.dart';
// import 'package:site_report_app_beta2/Services/PdfMaker.dart';
// import 'package:site_report_app_beta2/Widgets/FormList.dart';
// import 'package:site_report_app_beta2/Widgets/SecFive.dart';
// import 'package:site_report_app_beta2/Widgets/SecFour.dart';
// import 'package:site_report_app_beta2/Widgets/SecOne.dart';
// import 'package:site_report_app_beta2/Widgets/SecThree.dart';
// import 'package:site_report_app_beta2/Widgets/SecTwo.dart';

// class FormStepper extends StatefulWidget {
//   @override
//   _FormStepperState createState() => _FormStepperState();
// }

// class _FormStepperState extends State<FormStepper> {
//   int _currentStep;
//   bool _complete;

//   @override
//   void initState() {
//     _currentStep = 0;
//     _complete = false;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<Step> steps = [
//       Step(
//         isActive: true,
//         content: SecOne(),
//         title: Text(''),
//         state: _currentStep == 0
//             ? StepState.editing
//             : _currentStep > 0
//                 ? StepState.complete
//                 : StepState.indexed,
//       ),
//       Step(
//         isActive: true,
//         content: Visibility(
//           child: SecTwo(),
//           visible: subjectController.text == 'Centerline',
//         ),
//         title: Text(''),
//         state: _currentStep == 1
//             ? StepState.editing
//             : _currentStep > 1
//                 ? StepState.complete
//                 : StepState.indexed,
//       ),
//       Step(
//         isActive: true,
//         content: SecThree(),
//         title: Text(''),
//         state: _currentStep == 2
//             ? StepState.editing
//             : _currentStep > 2
//                 ? StepState.complete
//                 : StepState.indexed,
//       ),
//       Step(
//         isActive: true,
//         content: SecFour(),
//         title: Text(''),
//         state: _currentStep == 3
//             ? StepState.editing
//             : _currentStep > 3
//                 ? StepState.complete
//                 : StepState.indexed,
//       ),
//       Step(
//         isActive: true,
//         content: SecFive(),
//         title: Text(''),
//         state: _currentStep == 4
//             ? StepState.editing
//             : _currentStep > 4
//                 ? StepState.complete
//                 : StepState.indexed,
//       ),
//     ];

//     goTo(int step) {
//       setState(() => _currentStep = step);
//     }

//     next() {
//       _currentStep + 1 != steps.length
//           ? goTo(_currentStep + 1)
//           : setState(() => _complete = true);
//       if (_complete = true) {
//         if (formKey.currentState.saveAndValidate()) {
//           var value = formKey.currentState.value;
//           var valueImage = formKey2.currentState.value;
//           PdfMaker(context, value, valueImage);
//         } else {
//           print('Invalid');
//         }
//       }
//     }

//     cancel() {
//       if (_currentStep > 0) {
//         goTo(_currentStep - 1);
//       }
//     }

//     return Stepper(
//       currentStep: _currentStep,
//       steps: steps,
//       onStepCancel: cancel,
//       onStepContinue: next,
//       onStepTapped: (step) => goTo(step),
//       type: StepperType.horizontal,
//     );
//   }
// }
