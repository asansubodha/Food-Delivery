import 'package:flutter/material.dart';
import 'package:foody/components/button.dart';
import 'package:foody/pages/delivery_progres_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final formKey = GlobalKey<FormState>();
  final cardNumberController = TextEditingController();
  final expiryDateController = TextEditingController();
  final nameOnCardController = TextEditingController();
  final cvvController = TextEditingController();

  //user want to pay
  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      final cardNumber = cardNumberController.text;
      final expiryDate = expiryDateController.text;
      final nameOnCard = nameOnCardController.text;
      final cardCvv = cvvController.text;

      //payment logic
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Payment"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Card Number: $cardNumber"),
                Text("Expiry Date: $expiryDate"),
                Text("Card Holder Name: $nameOnCard"),
                Text("Card Cvv: $cardCvv"),
              ],
            ),
          ),
          actions: [
            //close button
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Close"),
            ),

            //OK button
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DeliveryProgresPage()));
              },
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          children: [
            //payment form
            Form(
              key: formKey,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    //card number
                    TextFormField(
                      controller: cardNumberController,
                      decoration:
                          const InputDecoration(labelText: 'Card Number'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        final regex = RegExp(r'^\d{16}$');
                        return (value == null || !regex.hasMatch(value))
                            ? 'Invalid card number'
                            : null;
                      },
                    ),

                    //name on card
                    TextFormField(
                      controller: nameOnCardController,
                      decoration:
                          const InputDecoration(labelText: 'Name on Card'),
                      validator: (value) => value == null || value.isEmpty
                          ? 'Please enter name on card'
                          : null,
                    ),

                    //expiry date
                    TextFormField(
                      controller: expiryDateController,
                      decoration: const InputDecoration(
                          labelText: 'Expiry Date (MM/YY)'),
                      validator: (value) {
                        final regex = RegExp(r'^(0[1-9]|1[0-2])\/\d{2}$');
                        if (value == null || !regex.hasMatch(value)) {
                          return 'Invalid expiry date';
                        }
                        final parts = value.split('/');
                        final month = int.parse(parts[0]);
                        final year = int.parse(parts[1]) + 2000;
                        if (DateTime(year, month).isBefore(DateTime.now())) {
                          return 'Card expired';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: cvvController,
                      decoration: const InputDecoration(labelText: 'CVV'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        final regex = RegExp(r'^\d{3,4}$');
                        return (value == null || !regex.hasMatch(value))
                            ? 'Invalid CVV'
                            : null;
                      },
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),
            //payment button
            MyButton(
              text: "Pay Now",
              onPressed: userTappedPay,
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
