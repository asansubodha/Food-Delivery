import 'package:flutter/material.dart';
import 'package:foody/models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const FoodTile({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                //text food name, price, description
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(food.name),
                      Text(
                        'rs.${food.price}',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        food.description,
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                    ],
                  ),
                ),

                //food image  asset
                ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(food.imageUrl, height: 70)),
              ],
            ),
          ),
        ),

        const SizedBox(height: 15),

        //divider
        Divider(
          color: Theme.of(context).colorScheme.tertiary,
          endIndent: 20,
          indent: 20,
        ),
      ],
    );
  }
}
