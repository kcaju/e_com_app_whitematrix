import 'package:e_commerce_app/controller/cartscreen_controller.dart';
import 'package:e_commerce_app/view/cartscreen/widget/cart_item.dart';
import 'package:e_commerce_app/view/utils/colorconstants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late Razorpay _razorpay;
  // Callback function to handle payment success
  void _paymentSuccess(PaymentSuccessResponse response) {
    print("success $response");
  }

// Callback function to handle payment failure
  void _paymentFaliure(PaymentSuccessResponse response) {
    print("Faliure $response");
  }

// Callback function to handle external wallet payments
  void _paymentWallet(ExternalWalletResponse response) {}
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<CartscreenController>().getAllCartItems();
      },
    );
    // Initialize Razorpay and set up event listeners
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _paymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _paymentFaliure);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _paymentWallet);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    // Clear Razorpay resources
    _razorpay.clear();
  }

// Function to start the checkout process with Razorpay
  void checkout(num amt) {
    var options = {
      //dynamic key of client please replace key with your key
      'key': 'rzp_live_ILgsfZCZoFIKMb',
      //amt in pisa to rupees
      'amount': amt * 100,
      // 'name': title,
      // 'description': description,
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'external': {
        'wallets': ['paytm', 'gpay']
      }
    };
    try {
      _razorpay.open(options); //razorpay starts using open()fctn
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.black,
        appBar: AppBar(
          backgroundColor: ColorConstants.black,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: ColorConstants.white,
              )),
          centerTitle: true,
          title: Text(
            "My Cart",
            style: TextStyle(
                color: ColorConstants.white,
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
        ),
        body: Consumer<CartscreenController>(
          builder: (context, cartProv, child) {
            final totalAmount = cartProv.calculateTotalAmount();
            return Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      cartProv.isLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Expanded(
                              child: ListView.separated(
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    final cartItem = cartProv
                                        .getCurrentItem(cartProv.keys[index]);
                                    return CartItem(
                                      title: cartItem?.title ?? "",
                                      qty: cartItem?.qty ?? 0,
                                      price: cartItem?.price ?? 0,
                                      image: cartItem?.image ?? "",
                                      onDecrement: () {
                                        context
                                            .read<CartscreenController>()
                                            .decrementQnty(
                                                cartProv.keys[index]);
                                      },
                                      onIncrement: () {
                                        context
                                            .read<CartscreenController>()
                                            .incrementQnty(
                                                cartProv.keys[index]);
                                      },
                                      onRemove: () {
                                        context
                                            .read<CartscreenController>()
                                            .removeCartItem(
                                                cartProv.keys[index]);
                                      },
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                        height: 10,
                                      ),
                                  itemCount: cartProv.keys.length))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    height: 80,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total :",
                              style: TextStyle(
                                  color: ColorConstants.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                            Text(
                              "${totalAmount.toStringAsFixed(2)}",
                              style: TextStyle(
                                  color: ColorConstants.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            // Start checkout process
                            checkout(totalAmount);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: ColorConstants.red,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "Proceed to Checkout",
                              style: TextStyle(
                                fontSize: 18,
                                color: ColorConstants.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: ColorConstants.white,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                )
              ],
            );
          },
        ));
  }
}
