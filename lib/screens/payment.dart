import 'package:flutter/material.dart';
import 'package:paystack_manager/paystack_pay_manager.dart';

import 'homepage.dart';

class Payment extends StatefulWidget {
  Payment({Key key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xfff8eded),
            size: 35,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => HomePage()));
          },
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.redAccent[100],

      ),
      body: Center(
        child: SingleChildScrollView(
            child: MaterialButton(
              onPressed: () => _checkPayment(),
              child: Text('Proceed to Payment'),
              color: Colors.red,
            )),
      ),
    );
  }

  void _checkPayment() {
    try {
      PaystackPayManager(context: context)
        ..setSecretKey("YOUR-SECRET-KEY")
      // ..setCompanyAssetImage(Image(image: NetworkImage("YOUR-IMAGE-URL")))
        ..setAmount(100000)
        ..setReference(DateTime.now().millisecondsSinceEpoch.toString())
        ..setCurrency("NGN")
        ..setEmail("Evron@gmail.com")
        ..setFirstName("Evron")
        ..setLastName("Limited")
        ..setMetadata(
          {
            "custom_fields": [
              {
                "value": "TechWithValarie",
                "display_name": "Payment_to",
                "variable_name": "Payment_to"
              }
            ]
          },
        )
        ..onSuccesful(_onPaymentSuccessful)
        ..onPending(_onPaymentPending)
        ..onFailed(_onPaymentFailed)
        ..onCancel(_onCancel)
        ..initialize();
    } catch (error) {
      print('Payment Error ==> $error');
    }
  }

  void _onPaymentSuccessful(Transaction transaction) {
    print('Transaction succesful');
    print(
        "Transaction message ==> ${transaction.message}, Ref ${transaction.refrenceNumber}");
  }

  void _onPaymentPending(Transaction transaction) {
    print('Transaction Pending');
    print("Transaction Ref ${transaction.refrenceNumber}");
  }

  void _onPaymentFailed(Transaction transaction) {
    print('Transaction Failed');
    print("Transaction message ==> ${transaction.message}");
  }

  void _onCancel(Transaction transaction) {
    print('Transaction Cancelled');
  }
}