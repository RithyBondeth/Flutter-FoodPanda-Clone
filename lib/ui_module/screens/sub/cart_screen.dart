import 'package:flutter/material.dart';
import 'package:foodpanda_app/ui_module/constants/themes/color_constant.dart';
import 'package:foodpanda_app/ui_module/screens/main/home_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.close),
        ),
        centerTitle: false,
        title: Text(
          "Cart",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _buildEmptyCart(context),
    );
  }

  Widget _buildEmptyCart(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 180,
            child: Image.asset("assets/cart/emptycart.png"),
          ),
          SizedBox(height: 10),
          Text(
            "Hungry?",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          SizedBox(height: 10),
          Text("You haven't added anything to your cart yet"),
          SizedBox(height: 15),
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => HomeScreen()),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: primaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                child: Text(
                  "Browse",
                  style: TextStyle(
                    color: secondaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
