import 'package:e_commerce_app/view/home_screen/home_screen.dart';
import 'package:e_commerce_app/view/utils/colorconstants.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: ColorConstants.black,
      appBar: AppBar(
        backgroundColor: ColorConstants.black,
        title: Text("OTP Verification",
            style: TextStyle(color: ColorConstants.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      6,
                      (index) => Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            child: TextFormField(
                              style: TextStyle(color: ColorConstants.black),
                              onChanged: (value) {
                                if (value.length == 1) {
                                  //automatically goes to next textfield
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              validator: (value) {
                                if (value != null && value.length == 1) {
                                  return null;
                                } else {
                                  return "X";
                                }
                              },
                              decoration: InputDecoration(
                                  fillColor: ColorConstants.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5))),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(
                                  islogin: true,
                                ),
                              ));
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(ColorConstants.green),
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)))),
                      child: Text(
                        "Verify",
                        style: TextStyle(color: ColorConstants.black),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn't receive the code ",
                        style: TextStyle(color: ColorConstants.white),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Resend now",
                        style: TextStyle(color: ColorConstants.blue),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
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
