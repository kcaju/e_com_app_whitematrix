import 'package:e_commerce_app/view/home_screen/home_screen.dart';
import 'package:e_commerce_app/view/utils/colorconstants.dart';
import 'package:e_commerce_app/view/utils/image_constants.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
          "Sign-Up",
          style: TextStyle(
              color: ColorConstants.white,
              fontSize: 25,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter your Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter your phone number",
                          suffixIcon: Icon(
                            Icons.visibility_off,
                            color: ColorConstants.grey,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                        height: 50,
                        width: 150,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(ColorConstants.black),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ));
                            },
                            child: Text(
                              "Sign-Up",
                              style: TextStyle(
                                  color: ColorConstants.white, fontSize: 20),
                            ))),
                    Image.asset(
                      ImageConstants.signup,
                      height: 180,
                    )
                  ],
                ),
                height: 500,
                decoration: BoxDecoration(
                    color: ColorConstants.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.elliptical(150, 150),
                        bottomRight: Radius.elliptical(150, 150))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
