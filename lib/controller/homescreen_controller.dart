import 'dart:math';

import 'package:e_commerce_app/dummy_db.dart';
import 'package:flutter/material.dart';

class HomescreenController with ChangeNotifier {
  List newArrivals = DummyDb.newArrivals;
  List allProducts = DummyDb.products;

  // Function to get a random product
  Map<String, dynamic> getRandomProduct() {
    // Create an instance of Random
    final random = Random();

    // Ensure the list is not empty
    if (allProducts.isEmpty) {
      throw Exception("No products available");
    }

    // Get a random index
    final randomIndex = random.nextInt(allProducts.length);

    // Return the product at the random index
    return allProducts[randomIndex];
  }
}
