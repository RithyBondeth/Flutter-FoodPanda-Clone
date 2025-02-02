import 'package:flutter/material.dart';
import 'package:foodpanda_app/ui_module/constants/auth/social_constant.dart';
import 'package:foodpanda_app/ui_module/constants/themes/color_constant.dart';
import 'package:foodpanda_app/ui_module/widgets/buttons/custom_normal_button.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 5,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildEmailIcon(),
                  _buildHeaderBox(),
                  _buildTextFormField(),
                  const SizedBox(height: 10),
                  CustomNormalButton(
                    backgroundColor: primaryColor,
                    color: secondaryColor,
                    label: "Continue",
                    onTap: () {},
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailIcon() {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: softPrimaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.asset(emailIcon, fit: BoxFit.cover),
    );
  }

  Widget _buildHeaderBox() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "What's your email?",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text("We'll check if you have an account")
        ],
      ),
    );
  }

  Widget _buildTextFormField() {
    return TextFormField(
      autofocus: true,
      style: TextStyle(color: Colors.black),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: TextStyle(color: Colors.black, fontSize: 15),
        hintText: "Enter your email address",
        hintStyle: TextStyle(color: accentGreyColor, fontSize: 15),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
