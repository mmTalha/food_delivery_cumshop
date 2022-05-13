import 'package:flutter/material.dart';
import 'package:food_app/checkout_screens/order_complete_screen.dart';
import 'package:food_app/checkout_screens/thankyou_screen.dart';
import 'package:food_app/provider/api_calls.dart';
import 'package:provider/provider.dart';

import 'add_your_payment _screen.dart';
import 'checkout_order_screen.dart';

class StepperDemo extends StatefulWidget {
  final id;
  final userid;
  final resturent_id;
  final subtotal;
  final vat_value;
  final total_price;
  final paymentmethod;

  const StepperDemo(
      {Key? key,
      this.id,
      this.userid,
      this.resturent_id,
      this.subtotal,
      this.vat_value,
      this.total_price,
      this.paymentmethod})
      : super(key: key);

  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.horizontal;
  final TextEditingController text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final checkout = Provider.of<api_calls>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Checkout',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
              child: Theme(
                data: ThemeData(
                    accentColor: Colors.orange,
                    primarySwatch: Colors.orange,
                    colorScheme: ColorScheme.light(primary: Colors.orange)),
                child: Stepper(
                  physics: ScrollPhysics(),
                  type: stepperType,
                  currentStep: _currentStep,
                  // onStepTapped: (step) => tapped(step),
                  // onStepContinue:  continued,
                  // onStepCancel: cancel,
                  steps: <Step>[
                    Step(
                      title: new Text('Payment'),
                      content: Container(
                          height: 400, child: add_your_payment_screen()),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 0
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: new Text('Order'),
                      content: Container(
                          height: 480,
                          child: order_complete_screen(
                            editingcontroller: text,
                            orderid: widget.id,
                            totalincvat: widget.total_price,
                          )),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 1
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: new Text('Checkout'),
                      content: Container(height: 530, child: thankyou_screen()),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 2
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: _currentStep >= 2
                  ? null
                  : Container(
                      height: 50,
                      width: 290,
                      child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Color.fromRGBO(252, 186, 24, 1),
                          child: Text(
                            _currentStep >= 1 ? 'Confirm order' : 'Continued',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            continued();
                            if (_currentStep == 2) {
                              print(text.text);
                              checkout.checkout_screen(
                                  widget.vat_value,
                                  'cod',
                                  widget.subtotal,
                                  widget.vat_value,
                                  widget.total_price,
                                  'cod',
                                  widget.resturent_id,
                                  text.text);
                            }

                            // Navigator.push (
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (BuildContext context) =>
                            //           order_complete_screen()),
                            //
                            // );
                          })),
            ),
          ],
        ),
      ),
    );
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}
