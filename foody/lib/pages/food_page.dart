import 'package:flutter/material.dart';
import 'package:foody/components/button.dart';
import 'package:foody/models/food.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};

  FoodPage({
    super.key,
    required this.food,
  }) {
    // initialize selected addons to be false
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // scaffold UI
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                // food image
                Image.asset(widget.food.imageUrl),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // food name
                      Text(
                        widget.food.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),

                      // food price
                      Text(
                        'rs.${widget.food.price}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),

                      const SizedBox(height: 10),

                      // food description
                      Text(widget.food.description),

                      const SizedBox(height: 10),

                      Divider(color: Theme.of(context).colorScheme.secondary),

                      const SizedBox(height: 10),

                      //food addons
                      Text(
                        "Add-Ons",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: widget.food.availableAddons.length,
                            itemBuilder: (context, index) {
                              // get individual addon
                              Addon addon = widget.food.availableAddons[index];

                              // return addon checkbox
                              return CheckboxListTile(
                                title: Text(addon.name),
                                subtitle: Text(
                                  'rs.${addon.price}',
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                value: widget.selectedAddons[addon],
                                onChanged: (bool? value) {
                                  setState(() {
                                    widget.selectedAddons[addon] = value!;
                                  });
                                },
                              );
                            }),
                      ),
                    ],
                  ),
                ),

                //add to cart button
                MyButton(
                  text: "Add to cart",
                  onPressed: () {},
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),

        // back button
        SafeArea(
          child: Opacity(
            opacity: 0.8,
            child: Container(
              margin: const EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ),
        
      ],
    );
  }
}
