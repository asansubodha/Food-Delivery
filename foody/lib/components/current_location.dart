import 'package:flutter/material.dart';
import 'package:foody/models/restaurant.dart';
import 'package:provider/provider.dart';

class CurrentLocation extends StatelessWidget {
  const CurrentLocation({super.key});

  void openLocationSerchBox(BuildContext context) {
    // Open a location search box

    final textController = TextEditingController();

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Your Location"),
              content: TextField(
                controller: textController,
                decoration: InputDecoration(
                  hintText: "Enter location",
                ),
              ),
              actions: [
                MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                      textController.clear();
                    },
                    child: Text("Cancel")),
                MaterialButton(
                    onPressed: () {
                      // save the location
                      String newAddress = textController.text;
                      context.read<Restaurant>().updateDeliveryAddress(newAddress);
                      
                      Navigator.pop(context);
                      textController.clear();
                    },
                    child: Text("Save")),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Deliver now",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold)),
          GestureDetector(
            onTap: () => openLocationSerchBox(context),
            child: Row(children: [
              Consumer<Restaurant>(
                builder: (context, restaurant, child) =>
                    Text(restaurant.deliveryAddress,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold,
                        )),
              ),
              Icon(Icons.keyboard_arrow_down_rounded),
            ]),
          ),
        ],
      ),
    );
  }
}
