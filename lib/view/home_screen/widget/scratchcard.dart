import 'package:e_commerce_app/view/utils/colorconstants.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce_app/view/cartscreen/cart_screen.dart';
import 'package:scratcher/scratcher.dart';

class ScratchCardWidget extends StatelessWidget {
  final Map<String, dynamic> product;
  final Function onAddToCart;

  const ScratchCardWidget({
    Key? key,
    required this.product,
    required this.onAddToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Congratulations!'),
      content: Scratcher(
        threshold: 50,
        brushSize: 30,
        color: ColorConstants.blue,
        child: Container(
          width: 300,
          height: 200,
          child: Center(
            child: Text(
              'You have won a ${product['title']}!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: NetworkImage(product['image']),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            onAddToCart();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartScreen()),
            );
          },
          child: Text('Add to Cart'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }
}
