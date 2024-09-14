import 'package:e_commerce_app/model/cartscreen/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CartscreenController with ChangeNotifier {
  // Hive box to store cart items
  final cartBox = Hive.box<CartModel>("cartItemBox");
  List keys = []; // List to store keys of cart items
  bool isLoading = false; // Flag to indicate if data is loading

  // Function to add an item to the cart
  Future<void> addCartItem(
      {required String title,
      String? des,
      num? id,
      int qty = 1,
      String? image,
      bool isFreeItem = false,
      required num price}) async {
    bool alreadyinCart = false;
    isLoading = true;
    notifyListeners(); // Notify listeners of state change

    // Check if the item is already in the cart
    for (int i = 0; i < keys.length; i++) {
      var iteminHive = cartBox.get(keys[i]);
      if (iteminHive?.id == id) {
        alreadyinCart = true;
      }
    }

    // Add the item to the cart if it's not already present
    if (alreadyinCart == false) {
      await cartBox.add(CartModel(
          price: price,
          title: title,
          qty: qty,
          image: image,
          des: des,
          id: id));
      keys = cartBox.keys.toList(); // Update keys list
    } else {
      print("already added");
    }
    isLoading = false;
    notifyListeners();
  }

  // Function to retrieve all cart items
  getAllCartItems() {
    keys = cartBox.keys.toList();
    notifyListeners();
  }

// Function to get a specific cart item by key
  CartModel? getCurrentItem(var key) {
    final currentItem = cartBox.get(key); // Retrieve item from Hive
    return currentItem;
  }

// Function to remove an item from the cart
  removeCartItem(var key) async {
    await cartBox.delete(key); // Delete item from Hive
    keys = cartBox.keys.toList();
    notifyListeners();
  }

// Function to increment the quantity of an item in the cart
  incrementQnty(var key) {
    final currentItemData = cartBox.get(key); // Retrieve current item
    cartBox.put(
        key,
        CartModel(
          price: currentItemData!.price,
          title: currentItemData.title,
          id: currentItemData.id,
          image: currentItemData.image,
          des: currentItemData.des,
          qty: ++currentItemData.qty, // Increment quantity
        ));
    notifyListeners();
  }

// Function to decrement the quantity of an item in the cart
  decrementQnty(var key) {
    final currentItemData = cartBox.get(key);
    if (currentItemData!.qty >= 2) {
      cartBox.put(
          key,
          CartModel(
            price: currentItemData.price,
            title: currentItemData.title,
            id: currentItemData.id,
            image: currentItemData.image,
            des: currentItemData.des,
            qty: --currentItemData.qty, // Decrement quantity
          ));
    }
    notifyListeners();
  }

  // Function to calculate the total amount of items in the cart
  double calculateTotalAmount() {
    double total = 0.0;
    // Iterate over each key in the keys list
    for (var key in keys) {
      // Retrieve the item from the box
      final item = cartBox.get(key);
      // Check if the item is not null
      if (item != null) {
        total += item.price * item.qty;
      }
    }
    return total;
  }
}
