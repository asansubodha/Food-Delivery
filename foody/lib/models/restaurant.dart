import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:foody/models/cart_item.dart';
import 'package:foody/models/food.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [
    // desserts
    Food(
        name: "Ice Cream",
        description:
            "A delicious chocolate ice cream made with rich cocoa and creamy milk, topped with a variety of delightful add-ons",
        imageUrl: "lib/images/desserts/Chocolate_Ice_Cream.jpeg",
        price: 200.00,
        category: FoodCategory.desserts,
        availableAddons: [
          Addon(name: "Chocolate Sauce", price: 200.00),
          Addon(name: "Nuts", price: 250.00),
          Addon(name: "Cherries", price: 225.00),
        ]),
    Food(
        name: "Fruit Salad",
        description:
            "A delicious fruit salad made with fresh fruits and topped with a scoop of creamy vanilla ice cream",
        imageUrl: "lib/images/desserts/Fruit_Salad_with_Ice_Cream.jpg",
        price: 200.00,
        category: FoodCategory.desserts,
        availableAddons: [
          Addon(name: "with Ice Cream small", price: 100.00),
          Addon(name: "with Ice Cream medium", price: 150.00),
          Addon(name: "with Ice Cream large", price: 200.00),
        ]),
    Food(
        name: "Fruit Salad",
        description: "A delicious fruit salad made with fresh fruits",
        imageUrl: "lib/images/desserts/Fruit_salad.jpg",
        price: 200.00,
        category: FoodCategory.desserts,
        availableAddons: [
          Addon(name: "small", price: 100.00),
          Addon(name: "medium", price: 150.00),
          Addon(name: "large", price: 200.00),
        ]),

    // Drinks
    Food(
        name: "Mango Juice",
        description: "A delicious mango juice made with fresh mangoes",
        imageUrl: "lib/images/Drinks/Mango_Juice.jpeg",
        price: 70.00,
        category: FoodCategory.Drinks,
        availableAddons: [
          Addon(name: "small", price: 50.00),
          Addon(name: "medium", price: 60.00),
          Addon(name: "large", price: 70.00),
        ]),
    Food(
        name: "Orange juice",
        description: "A delicious mango juice made with fresh orange",
        imageUrl: "lib/images/Drinks/Orange_juice.jpeg",
        price: 70.00,
        category: FoodCategory.Drinks,
        availableAddons: [
          Addon(name: "small", price: 50.00),
          Addon(name: "medium", price: 60.00),
          Addon(name: "large", price: 70.00),
        ]),

    //FriedRice
    Food(
        name: "Fried Rice",
        description: "A delicious chicken fried rice made with fresh chicken",
        imageUrl: "lib/images/FriedRice/Chicken_Fried_Rice.jpeg",
        price: 700.00,
        category: FoodCategory.FriedRice,
        availableAddons: [
          Addon(name: "chicken small", price: 700.00),
          Addon(name: "chicken medium", price: 750.00),
          Addon(name: "chicken large", price: 900.00),
        ]),
    Food(
        name: "Fried Rice",
        description: "A delicious chicken fried rice made with fresh chicken",
        imageUrl: "lib/images/FriedRice/Egg_Fried_Rice.jpeg",
        price: 800.00,
        category: FoodCategory.FriedRice,
        availableAddons: [
          Addon(name: "Egg small", price: 800.00),
          Addon(name: "Egg medium", price: 850.00),
          Addon(name: "Egg large", price: 900.00),
        ]),
    Food(
        name: "fried rice",
        description: "A delicious chicken fried rice made with fresh chicken",
        imageUrl: "lib/images/FriedRice/Seafood_fried_rice.jpeg",
        price: 800.00,
        category: FoodCategory.FriedRice,
        availableAddons: [
          Addon(name: "Seafood small", price: 800.00),
          Addon(name: "Seafood medium", price: 850.00),
          Addon(name: "Seafood large", price: 900.00),
        ]),
    Food(
        name: "Fried Rice",
        description: "A delicious chicken fried rice made with fresh chicken",
        imageUrl: "lib/images/FriedRice/Vegetable_Fried_Rice.jpeg",
        price: 800.00,
        category: FoodCategory.FriedRice,
        availableAddons: [
          Addon(name: "Vegetable small", price: 800.00),
          Addon(name: "Vegetable medium", price: 850.00),
          Addon(name: "Vegetable large", price: 900.00),
        ]),

    //KottuRoti
    Food(
        name: "chicken kottu",
        description: "A delicious chicken fried rice made with fresh chicken",
        imageUrl: "lib/images/KottuRoti/cheese_chicken_kottu.jpeg",
        price: 800.00,
        category: FoodCategory.KottuRoti,
        availableAddons: [
          Addon(name: "cheese small", price: 800.00),
          Addon(name: "cheese medium", price: 850.00),
          Addon(name: "cheese large", price: 900.00),
        ]),
    Food(
        name: "Chicken kottu",
        description: "A delicious chicken fried rice made with fresh chicken",
        imageUrl: "lib/images/KottuRoti/Chicken_kottu.jpeg",
        price: 800.00,
        category: FoodCategory.KottuRoti,
        availableAddons: [
          Addon(name: "small", price: 800.00),
          Addon(name: "medium", price: 850.00),
          Addon(name: "large", price: 900.00),
        ]),

    //Noddles
    Food(
        name: "chicken noodles",
        description: "A delicious chicken fried rice made with fresh chicken",
        imageUrl: "lib/images/Noddles/chicken_noodles.jpeg",
        price: 800.00,
        category: FoodCategory.Noddles,
        availableAddons: [
          Addon(name: "small", price: 800.00),
          Addon(name: "medium", price: 850.00),
          Addon(name: "large", price: 900.00),
        ]),
    Food(
        name: "Egg Noodles",
        description: "A delicious chicken fried rice made with fresh chicken",
        imageUrl: "lib/images/Noddles/chicken_noodles.jpeg",
        price: 800.00,
        category: FoodCategory.Noddles,
        availableAddons: [
          Addon(name: "small", price: 800.00),
          Addon(name: "medium", price: 850.00),
          Addon(name: "large", price: 900.00),
        ]),
    Food(
        name: "Seafood_Noodles",
        description: "A delicious chicken fried rice made with fresh chicken",
        imageUrl: "lib/images/Noddles/chicken_noodles.jpeg",
        price: 800.00,
        category: FoodCategory.Noddles,
        availableAddons: [
          Addon(name: "small", price: 800.00),
          Addon(name: "medium", price: 850.00),
          Addon(name: "large", price: 900.00),
        ]),
  ];

  // Getters
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  // user cart
  List<CartItem> _cart = [];

  /*operations*/
  //add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    //check if food is already in cart
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check if food is the same
      bool isSameFood = item.food == food;

      // check if the list of selected addons is the same
      bool isSameAddons = ListEquality().equals(
        item.selectedAddons,
        selectedAddons,
      );
      return isSameFood && isSameAddons;
    });

    // if item already exists, increase its quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }
    //else, add new cart item
    else {
      _cart.add(
        CartItem(
          food: food,
          selectedAddons: selectedAddons,
        ),
      );
    }
    notifyListeners();
  }

  //remove from cart
  void removeFrmCart(CartItem cartItem){
    int cartindex = _cart.indexOf(cartItem);

    if(cartItem != -1){
      if (_cart[cartindex].quantity > 1) {
        _cart[cartindex].quantity--;
      }
      else{
        _cart.removeAt(cartindex);
      }
    }
    notifyListeners();
  }

  //get tatal price of cart
  double getTotalPrice(){
    double total = 0.0;

    for (CartItem cartItem in _cart){
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  //total number of items in cart
  int getTotalItemCount(){
    int totalItemCount = 0;

    for (CartItem cartItem in _cart){
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  //clear cart
  void clearCart(){
    _cart.clear();
    notifyListeners();
  }

  /*helpers*/

  //genarate a reciept

  //format double value to currency

  //format list of addons to string summary
}
