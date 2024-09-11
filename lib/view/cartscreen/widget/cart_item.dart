import 'package:e_commerce_app/view/utils/colorconstants.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem(
      {super.key,
      required this.title,
      required this.qty,
      this.onIncrement,
      this.onDecrement,
      this.onRemove,
      required this.price,
      this.image});
  final String title;
  final num price, qty;
  final String? image;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorConstants.white,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        height: 200,
        child: Row(
          children: [
            Container(
              height: 150,
              width: 120,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill, image: NetworkImage(image ?? "")),
                  borderRadius: BorderRadius.circular(10),
                  color: ColorConstants.green),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: ColorConstants.black),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "₹ $price",
                    style: TextStyle(fontSize: 20, color: ColorConstants.black),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: onDecrement,
                              child: Text(
                                "-",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: ColorConstants.black),
                              ),
                            ),
                            Text(
                              "$qty",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstants.black),
                            ),
                            InkWell(
                              onTap: onIncrement,
                              child: Text(
                                "+",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: ColorConstants.black),
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: ColorConstants.green),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: onRemove,
                        child: CircleAvatar(
                          backgroundColor: ColorConstants.black,
                          child: Icon(
                            Icons.delete_outline,
                            color: ColorConstants.red,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
