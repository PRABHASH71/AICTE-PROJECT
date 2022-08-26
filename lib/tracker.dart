import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:im_stepper/main.dart';
import 'package:im_stepper/stepper.dart';

class tracker extends StatefulWidget {
  const tracker({Key? key}) : super(key: key);

  @override
  State<tracker> createState() => _trackerState();
}

class _trackerState extends State<tracker> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: Color.fromARGB(255, 19, 19, 20),
        title: const Text(
          "APPROVAL TRACKER",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          Image.asset('assets/app.png'),
          Text(""),
          Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height / 2,
            child: Stepper(
              type: StepperType.vertical,
              steps: getSteps(),
              currentStep: currentStep,
              onStepContinue: () {
                final isLastStep = currentStep == getSteps().length - 1;
                if (isLastStep) {
                  Fluttertoast.showToast(msg: "Completed");
                } else {
                  setState(
                    () => currentStep += 1,
                  );
                }
              },
              onStepCancel: () => setState(
                (() => currentStep -= 1),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Step> getSteps() => [
        Step(
          isActive: currentStep >= 0,
          title: Text("Database"),
          content: Container(),
        ),
        Step(
          isActive: currentStep >= 1,
          title: Text("Staff Desk"),
          content: Container(),
        ),
        Step(
          isActive: currentStep >= 2,
          title: Text("Head Desk"),
          content: Container(),
        ),
        Step(
          isActive: currentStep >= 3,
          title: Text("Complete"),
          content: Container(),
        ),
      ];
}
