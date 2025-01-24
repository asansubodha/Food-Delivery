import 'package:flutter/material.dart';

class DeliveryProgresPage extends StatelessWidget {
  const DeliveryProgresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery Progress"),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
    );
  }
}