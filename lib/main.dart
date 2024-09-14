import 'package:e_commerce_app/controller/cartscreen_controller.dart';
import 'package:e_commerce_app/controller/homescreen_controller.dart';
import 'package:e_commerce_app/model/cartscreen/cart_model.dart';
import 'package:e_commerce_app/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Hive for local storage
  await Hive.initFlutter();
  // Register the adapter for CartModel with Hive.
  Hive.registerAdapter<CartModel>(CartModelAdapter());
  // Open a Hive box for storing CartModel objects
  var box = await Hive.openBox<CartModel>("cartItemBox");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomescreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartscreenController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
