import 'package:flutter/material.dart';
import 'package:foody/models/restaurant.dart';
import 'package:provider/provider.dart';

class Reciept extends StatelessWidget {
  const Reciept({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: 20.0, top: 40, left: 20.0, right: 20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Thank You For Your Order"),
            const SizedBox(height: 20.0),
            Container(
              decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.secondary),
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.all(25.0),
              child: Consumer<Restaurant>(
                builder: (context, restaurant, child) => Text(
                  restaurant.DisplayReciept(),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Text("Your order will be delivered in 30 minutes"),
          ],
        ),
      ),
    );
  }
}
