import 'package:e_commerce_app/view/otp_screen.dart/otp_screen.dart';
import 'package:e_commerce_app/view/utils/colorconstants.dart';
import 'package:e_commerce_app/view/utils/image_constants.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    TextEditingController phn = TextEditingController();
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
          "Login",
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
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: phn,
                        validator: (value) {
                          if (value!.length < 10 && value.length > 10) {
                            return "Enter a valid phone number";
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: ColorConstants.red),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixText: "+91",
                            prefixStyle: TextStyle(
                                color: ColorConstants.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                            hintText: "Enter your phone number",
                            suffixIcon: Icon(
                              Icons.visibility_off,
                              color: ColorConstants.grey,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                          height: 50,
                          width: 150,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                    ColorConstants.black),
                              ),
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  if (phn.text.length == 10) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => OtpScreen(),
                                        ));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            backgroundColor: ColorConstants.red,
                                            content: Text(
                                              "Invalid Phone Number",
                                              style: TextStyle(
                                                  color: ColorConstants.black,
                                                  fontSize: 20),
                                            )));
                                  }
                                }
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: ColorConstants.white, fontSize: 22),
                              ))),
                      // Image.asset(
                      //   ImageConstants.login,
                      //   height: 180,
                      // ),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
                height: 400,
                decoration: BoxDecoration(
                    color: ColorConstants.white,
                    image: DecorationImage(
                        image: AssetImage(ImageConstants.login)),
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
