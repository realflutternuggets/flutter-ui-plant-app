
import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              child: Image.asset('assets/images/add-cart.png'),
            ),
            const SizedBox(height: 10,),
            Text('Your Cart is Empty', style: TextStyle(
              color: Constants.primaryColor,
              fontWeight: FontWeight.w300,
              fontSize: 18,
            ),),
            const SizedBox(height: 10,),
            Text('Go to Shopping', style: TextStyle(
              color: Constants.blackColor,
              fontWeight: FontWeight.w300,
              fontSize: 18,
            ),),
          ],
        ),
      ),
    );
  }
}