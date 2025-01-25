import 'package:flutter/material.dart';

class CurrentLocation extends StatelessWidget {
  const CurrentLocation({super.key});

  void openLocationSerchBox(BuildContext context) {
    // Open a location search box
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Your Location"),
              content: TextField(
                decoration: InputDecoration(
                    hintText: "Enter your location",
                    suffixIcon: Icon(Icons.search)),
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Cancel")),
                TextButton(
                    onPressed: () => Navigator.pop(context),
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
              Icon(Icons.location_on),
              Text("123 Main St, New York, NY 10001"),
              Icon(Icons.keyboard_arrow_down_rounded),
            ]),
          ),
        ],
      ),
    );
  }
}
