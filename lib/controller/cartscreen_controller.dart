import 'package:e_commerce_app/model/cartscreen/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CartscreenController with ChangeNotifier {
  final cartBox = Hive.box<CartModel>("cartItemBox");
  List keys = [];
  bool isLoading = false;
  Future<void> addCartItem(
      {required String title,
      String? des,
      num? id,
      int qty = 1,
      String? image,
      required num price}) async {
    bool alreadyinCart = false;
    isLoading = true;
    notifyListeners();
    for (int i = 0; i < keys.length; i++) {
      //checking whether the id of added item is in hive(use get fnct)
      var iteminHive = cartBox.get(keys[i]);
      if (iteminHive?.id == id) {
        alreadyinCart = true;
      }
    }
    if (alreadyinCart == false) {
      await cartBox.add(CartModel(
          price: price,
          title: title,
          qty: qty,
          image: image,
          des: des,
          id: id));
      keys = cartBox.keys.toList();
    } else {
      print("already added");
    }
    isLoading = false;
    notifyListeners();
  }

//to get all the cart items
  getAllCartItems() {
    keys = cartBox.keys.toList();
    notifyListeners();
  }

//for getting the current item
  CartModel? getCurrentItem(var key) {
    final currentItem = cartBox.get(key);
    return currentItem;
  }

//to delete cart item
  removeCartItem(var key) async {
    await cartBox.delete(key);
    keys = cartBox.keys.toList();
    notifyListeners();
  }

  incrementQnty(var key) {
    final currentItemData = cartBox.get(key);
    cartBox.put(
        key,
        CartModel(
          price: currentItemData!.price,
          title: currentItemData.title,
          id: currentItemData.id,
          image: currentItemData.image,
          des: currentItemData.des,
          qty: ++currentItemData.qty,
        ));
    notifyListeners();
  }

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
            qty: --currentItemData.qty,
          ));
    }
    notifyListeners();
  }

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
