import 'package:flutter/material.dart';
import 'package:foody/components/reciept.dart';
import 'package:foody/models/restaurant.dart';
import 'package:foody/services/database/firestore.dart';
import 'package:provider/provider.dart';

class DeliveryProgresPage extends StatefulWidget {
  const DeliveryProgresPage({super.key});

  @override
  State<DeliveryProgresPage> createState() => _DeliveryProgresPageState();
}

class _DeliveryProgresPageState extends State<DeliveryProgresPage> {
// get access to the db
  FirestoreService db = FirestoreService();

  @override
  void initState() {
    super.initState();

    //if we get to this page, submit to the firestore
    String order = context.read<Restaurant>().DisplayReciept();
    db.saveOrder({"reciept": order});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer Reciept"),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Reciept(),
          ],
        ),
      ),
    );
  }

  // custom method to build the bottom navigation bar
  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      height: 80.0,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          //profile pic icon
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.person),
            ),
          ),

          const SizedBox(width: 10.0),

          //driver details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Nipun Perera"),
              Text(
                "Driver",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
          ),

          Spacer(),

          Row(
            children: [
              //messahe button
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.message),
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              const SizedBox(width: 10.0),

              //call button
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.call),
                  color: Colors.green,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
