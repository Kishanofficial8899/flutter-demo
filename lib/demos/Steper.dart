import 'package:flutter/material.dart';

class Steper extends StatefulWidget {
  @override
  SteperclassState createState() => SteperclassState();
}

class SteperclassState extends State<Steper> {
  int stpes = 0;
  // ignore: non_constant_identifier_names
  List<Step> my_steps = [
    Step(
        // Title of the Step
        title: Text("Step 1"),
        content: Text("Hello!"),
        isActive: true),
    Step(
        title: Text("Step 2"),
        content: Text("World!"),
        state: StepState.editing,
        isActive: true),
    Step(title: Text("Step 3"), content: Text("Hello World!"), isActive: true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: AppBar(
        title: Text("Simple Stpper"),
      ),
      // Body
      body: Container(
          child: Stepper(
        currentStep: this.stpes,
        steps: my_steps,
        type: StepperType.horizontal,
        onStepTapped: (step) {
          setState(() {
            stpes = step;
          });
        },
        onStepCancel: () {
          setState(() {
            if (stpes > 0) {
              stpes = stpes - 1;
            } else {
              stpes = 0;
            }
          });
        },
        onStepContinue: () {
          setState(() {
            if (stpes < my_steps.length - 1) {
              stpes = stpes + 1;
            } else {
              stpes = 0;
            }
          });
        },
      )),
    );
  }
}
