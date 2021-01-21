import 'package:flutter/material.dart';
import 'package:site_report_app_beta2/Widgets/SecFive.dart';
import 'package:site_report_app_beta2/Widgets/SecFour.dart';
import 'package:site_report_app_beta2/Widgets/SecOne.dart';
import 'package:site_report_app_beta2/Widgets/SecThree.dart';
import 'package:site_report_app_beta2/Widgets/SecTwo.dart';

class FormStepper extends StatefulWidget {
  @override
  _FormStepperState createState() => _FormStepperState();
}

class _FormStepperState extends State<FormStepper> {
  int _currentStep = 0;
  bool _complete = false;

  List<Step> steps = [
    Step(
      content: SecOne(),
      title: Text(''),
    ),
    Step(
      content: SecTwo(),
      title: Text(''),
    ),
    Step(
      content: SecThree(),
      title: Text(''),
    ),
    Step(
      content: SecFour(),
      title: Text(''),
    ),
    Step(
      content: SecFive(),
      title: Text(''),
    ),
  ];

  next() {
    _currentStep + 1 != steps.length
        ? goTo(_currentStep + 1)
        : setState(() => _complete = true);
  }

  cancel() {
    if (_currentStep > 0) {
      goTo(_currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => _currentStep = step);
  }

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: _currentStep,
      steps: steps,
      onStepCancel: cancel,
      onStepContinue: next,
      onStepTapped: (step) => goTo(step),
      type: StepperType.horizontal,
    );
  }
}
