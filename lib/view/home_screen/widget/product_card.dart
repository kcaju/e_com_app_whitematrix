import 'package:e_commerce_app/view/utils/colorconstants.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  const ProductCard(
      {super.key,
      required this.title,
      required this.price,
      required this.img,
      this.id,
      this.toAdd});
  final String title, img;
  final num price;
  final num? id;
  final VoidCallback? toAdd;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Card(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                height: 380,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      maxLines: 1,
                      widget.title,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "₹ ${widget.price}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ColorConstants.peac,
                ),
              ),
            ),
            Card(
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                    color: ColorConstants.grey.withOpacity(0.3),
                    image: DecorationImage(
                        fit: BoxFit.fill, image: NetworkImage(widget.img)),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
              ),
            ),
            Positioned(
              top: 20,
              right: 30,
              child: Icon(
                Icons.favorite,
                color: ColorConstants.green,
                size: 30,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: InkWell(
                onTap: widget.toAdd,
                child: Container(
                  height: 50,
                  width: 150,
                  child: Center(
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(
                          color: ColorConstants.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.elliptical(60, 50),
                          bottomLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                      color: ColorConstants.red),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
