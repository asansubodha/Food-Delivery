import 'package:flutter/material.dart';
import 'package:foody/models/food.dart';

class CustomTabBar extends StatelessWidget {
  final TabController tabController;

  const CustomTabBar({super.key, required this.tabController});

  List<Tab> _buildCategoryTabs(){
    return FoodCategory.values.map((category) {
      return Tab(
        text: category.toString().split('.').last,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar( // Flutter's TabBar
      controller: tabController, 
      tabs: _buildCategoryTabs(),
    
    );
  }
}