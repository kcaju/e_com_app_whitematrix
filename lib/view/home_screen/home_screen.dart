import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/controller/cartscreen_controller.dart';
import 'package:e_commerce_app/controller/homescreen_controller.dart';
import 'package:e_commerce_app/view/cartscreen/cart_screen.dart';
import 'package:e_commerce_app/view/home_screen/widget/product_card.dart';
import 'package:e_commerce_app/view/login_screen/login_screen.dart';
import 'package:e_commerce_app/view/productdetails_screen/productdetails_screen.dart';
import 'package:e_commerce_app/view/utils/colorconstants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scratcher/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    this.islogin = false,
  });

  final bool islogin;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isDialogShown =
      false; // Track if the scratch card dialog has been shown

  void _showScratchCardDialog() {
    // Fetch the home screen controller and get a random product
    final homescreenController = context.read<HomescreenController>();
    final randomProduct = homescreenController.getRandomProduct();
// Show a dialog with a scratch card
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SizedBox(
          height: 350,
          width: 250,
          child: Scratcher(
            color: Colors.grey,
            brushSize: 20,
            threshold: 100,
            onChange: (value) {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Congratulations!',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                CachedNetworkImage(
                  imageUrl: randomProduct['image'],
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10),
                Text(
                  'You have won a free product!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Add the free product to the cart and navigate to the cart screen
                    context
                        .read<CartscreenController>()
                        .addCartItem(
                          title: randomProduct['title'],
                          price: 0.0, // Free product
                          des: randomProduct['description'],
                          id: randomProduct['id'],
                          isFreeItem: true,
                          image: randomProduct['image'],
                        )
                        .then((value) {
                      Navigator.pop(context); // Close the dialog
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartScreen(),
                        ),
                      );
                    });
                  },
                  child: Text('Add to Cart'),
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(ColorConstants.green)),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showDialogAfterBuild() async {
    // Show the scratch card dialog after the build is complete
    await Future.delayed(Duration.zero);
    if (!_isDialogShown) {
      setState(() {
        _isDialogShown = true;
      });
      _showScratchCardDialog();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Check if we have returned to this screen and need to reset dialog state
    if (ModalRoute.of(context)?.isCurrent == true) {
      _isDialogShown = false;
    }
  }

  @override
  void initState() {
    // Show the scratch card dialog if the user has logged in
    super.initState();
    if (widget.islogin) {
      _showDialogAfterBuild();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.black,
        appBar: AppBar(
          backgroundColor: ColorConstants.black,
          leading: Builder(builder: (context) {
            return InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Icon(
                Icons.menu,
                color: ColorConstants.white,
              ),
            );
          }),
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(),
                    ));
              },
              child: Icon(
                Icons.shopping_cart_outlined,
                color: ColorConstants.white,
                size: 35,
              ),
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
        drawer: Drawer(
          child: Container(
            color: ColorConstants.black,
            child: ListView(
              children: [
                DrawerHeader(
                    child: Column(
                  children: [
                    Text(
                      "H E L L O",
                      style:
                          TextStyle(color: ColorConstants.white, fontSize: 20),
                    ),
                  ],
                )),
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: ColorConstants.white,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  title: Text(
                    "Home",
                    style: TextStyle(color: ColorConstants.white, fontSize: 20),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.power_settings_new_rounded,
                    color: ColorConstants.white,
                  ),
                  onTap: () async {
                    // Log out by clearing shared preferences and navigating to login screen
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.clear(); // Clears all keys
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                  title: Text(
                    "LogOut",
                    style: TextStyle(color: ColorConstants.white, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Consumer<HomescreenController>(
          builder: (context, newArrivalProv, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "New Arrivals",
                  style: TextStyle(
                      color: ColorConstants.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CarouselSlider(
                  items: List.generate(
                    newArrivalProv.newArrivals.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(15),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductdetailsScreen(
                                  title: newArrivalProv.newArrivals[index]
                                      ['title'],
                                  des: newArrivalProv.newArrivals[index]
                                      ['description'],
                                  image: newArrivalProv.newArrivals[index]
                                      ['image'],
                                  rate: newArrivalProv.newArrivals[index]
                                      ['rating'],
                                  price: newArrivalProv.newArrivals[index]
                                      ['price'],
                                  id: newArrivalProv.newArrivals[index]['id'],
                                ),
                              ));
                        },
                        child: Container(
                          height: 250,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: CachedNetworkImageProvider(
                                      newArrivalProv.newArrivals[index]
                                          ['image'])),
                              color: ColorConstants.white,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                  ),
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    height: 250,
                    viewportFraction: 1.0,
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Explore Products",
                  style: TextStyle(
                      color: ColorConstants.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        GridView.builder(
                          itemCount: newArrivalProv.allProducts.length,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  mainAxisExtent: 400,
                                  mainAxisSpacing: 15),
                          itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductdetailsScreen(
                                          id: newArrivalProv.allProducts[index]
                                              ['id'],
                                          title: newArrivalProv
                                              .allProducts[index]['title'],
                                          des: newArrivalProv.allProducts[index]
                                              ['description'],
                                          image: newArrivalProv
                                              .allProducts[index]['image'],
                                          rate: newArrivalProv
                                              .allProducts[index]['rating'],
                                          price: newArrivalProv
                                              .allProducts[index]['price']),
                                    ));
                              },
                              child: ProductCard(
                                  toAdd: () {
                                    context
                                        .read<CartscreenController>()
                                        .addCartItem(
                                          title: newArrivalProv
                                              .allProducts[index]['title'],
                                          price: newArrivalProv
                                              .allProducts[index]['price'],
                                          des: newArrivalProv.allProducts[index]
                                              ['description'],
                                          id: newArrivalProv.allProducts[index]
                                              ['id'],
                                          image: newArrivalProv
                                              .allProducts[index]['image'],
                                        )
                                        .then(
                                      (value) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  CartScreen(),
                                            ));
                                      },
                                    );
                                  },
                                  title: newArrivalProv.allProducts[index]
                                      ['title'],
                                  price: newArrivalProv.allProducts[index]
                                      ['price'],
                                  img: newArrivalProv.allProducts[index]
                                      ['image'])),
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      color: ColorConstants.white),
                ),
              ))
            ],
          ),
        ));
  }
}
