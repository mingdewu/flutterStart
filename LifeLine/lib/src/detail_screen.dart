import 'package:flutter/material.dart';

import 'package:lifeline/src/note.dart';

class DetailScreen extends StatelessWidget {
  final Note note;
  const DetailScreen({required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Screen'),
      ),
      body: Center(
        child: ProjectStepper()
      ),
    );
  }
}

class ProjectStepper extends StatefulWidget{
  const ProjectStepper({super.key});
  @override
  _ProjectStepperState createState() => _ProjectStepperState();
}

class _ProjectStepperState extends State<ProjectStepper>{
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
                child:Stepper(
                  type: stepperType,
                  physics: ScrollPhysics(),
                  currentStep: _currentStep,
                  onStepTapped: (step) => tapped(step),
                  onStepContinue: continued,
                  onStepCancel: cancel,
                  steps: [
                    Step(title: new Text("first step"),
                        content: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(labelText: "Detail 1"),
                            ),
                            TextFormField(
                              decoration: InputDecoration(labelText:"Detail 2"),
                            )
                          ],
                        ),
                      isActive: _currentStep >= 0,
                      state: _currentStep >=1 ?
                          StepState.complete :StepState.disabled,
                    ),
                    Step(
                        title: new Text("second step"),
                        content: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(labelText: "Detail 3"),
                            ),
                          ],
                        ),
                      isActive: _currentStep >=0,
                      state: _currentStep>=2?
                          StepState.complete :StepState.disabled,
                    )
                  ],
                )

            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.list),
        onPressed: switchStepsType,
      ),
    );
  }
  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step){
    setState(() => _currentStep = step);
  }

  continued(){
    _currentStep < 2 ?
    setState(() => _currentStep += 1): null;
  }
  cancel(){
    _currentStep > 0 ?
    setState(() => _currentStep -= 1) : null;
  }
}
