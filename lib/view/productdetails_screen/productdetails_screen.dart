import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controller/cartscreen_controller.dart';
import 'package:e_commerce_app/view/cartscreen/cart_screen.dart';
import 'package:e_commerce_app/view/utils/colorconstants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductdetailsScreen extends StatelessWidget {
  const ProductdetailsScreen(
      {super.key,
      required this.title,
      required this.des,
      required this.image,
      required this.rate,
      required this.price,
      required this.id});
  final String title, des, image, rate;
  final num price, id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: ColorConstants.black,
                            size: 30,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.favorite_outline_sharp,
                          color: ColorConstants.black,
                          size: 35,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: CachedNetworkImageProvider(image))),
                      ),
                    ),
                  )
                ],
              ),
            ),
            height: 500,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                ),
                color: ColorConstants.white),
          ),
          SizedBox(
            height: 25,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          color: ColorConstants.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Details :",
                      style: TextStyle(
                          color: ColorConstants.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      des,
                      style:
                          TextStyle(color: ColorConstants.white, fontSize: 18),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Price",
                              style: TextStyle(
                                  color: ColorConstants.white, fontSize: 18),
                            ),
                            Text(
                              "₹ $price",
                              style: TextStyle(
                                  color: ColorConstants.white, fontSize: 18),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Rating",
                              style: TextStyle(
                                  color: ColorConstants.white, fontSize: 18),
                            ),
                            Text(
                              rate,
                              style: TextStyle(
                                  color: ColorConstants.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: () {
                        context
                            .read<CartscreenController>()
                            .addCartItem(
                              title: title,
                              price: price,
                              des: des,
                              id: id,
                              image: image,
                            )
                            .then(
                          (value) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CartScreen(),
                                ));
                          },
                        );
                      },
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: ColorConstants.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Add to Cart",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstants.black,
                                  fontSize: 20),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Icon(
                              Icons.shopping_bag_outlined,
                              color: ColorConstants.black,
                              size: 30,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
