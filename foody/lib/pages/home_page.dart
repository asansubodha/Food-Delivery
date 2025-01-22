import 'package:flutter/material.dart';
import 'package:foody/components/current_location.dart';
import 'package:foody/components/description_box.dart';
import 'package:foody/components/drawer.dart';
import 'package:foody/components/silver_app_bar.dart';
import 'package:foody/components/tab_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  // TabController
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySilverAppBar(
            title: CustomTabBar(tabController: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                //my current location
                const CurrentLocation(),

                //description box
                const DescriptionBox(),
              ],
            ),
          ),
        ],
        body: TabBarView(
          controller: _tabController,
          children: [
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => Text("hello"),
            ),
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => Text("Second hello"),
            ),
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => Text("Third hello"),
            ),
          ],
        ),
      ),
    );
  }
}
