import 'package:flutter/material.dart';
import 'package:food_app/checkout_screens/order_complete_screen.dart';
import 'package:food_app/checkout_screens/thankyou_screen.dart';

import 'add_your_payment _screen.dart';
import 'checkout_order_screen.dart';

class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.horizontal;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text('Checkout',style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body:  Container(
        height:MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
              child: Theme(
                data: ThemeData(
                    accentColor: Colors.orange,
                    primarySwatch: Colors.orange,
                    colorScheme: ColorScheme.light(
                        primary: Colors.orange
                    )
                ),
                child: Stepper(

                  physics: ScrollPhysics(),
                  type:stepperType ,
                  currentStep: _currentStep,
                  // onStepTapped: (step) => tapped(step),
                  // onStepContinue:  continued,
                  // onStepCancel: cancel,
                  steps: <Step>[
                    Step(
                      title: new Text('Payment'),
                      content: Container(
                          height:400,
                          child: add_your_payment_screen()),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 0 ?
                      StepState.complete : StepState.disabled,
                    ),
                    Step(
                      title: new Text('Order'),
                      content:  Container(
                           height:480,
                          child: order_complete_screen()),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 1 ?
                      StepState.complete : StepState.disabled,
                    ),
                    Step(

                      title: new Text('Checkout'),
                      content: Container(
                          height:530,
                          child: thankyou_screen()),
                      isActive:_currentStep >= 0,
                      state: _currentStep >= 2 ?
                      StepState.complete : StepState.disabled,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child:
            _currentStep >= 2 ? null:  Container(

                  height: 50,
                  width: 290,
                  child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Color.fromRGBO(252, 186, 24, 1),
                      child: Text(
                        _currentStep >= 1 ? 'Confirm order':'Continued',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        continued();
                        // Navigator.push (
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (BuildContext context) =>
                        //           order_complete_screen()),
                        //
                        // );
                      }



                  )
              ),
            ),
          ],
        ),
      ),


    );
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