import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda_app/ui_module/constants/auth/social_constant.dart';
import 'package:foodpanda_app/ui_module/constants/themes/color_constant.dart';
import 'package:foodpanda_app/ui_module/widgets/buttons/custom_normal_button.dart';

class PhonenumberScreen extends StatelessWidget {
  const PhonenumberScreen({super.key});

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
                  _buildTextFormField(context),
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
      child: Image.asset(phonenumberIcon, fit: BoxFit.cover),
    );
  }

  Widget _buildHeaderBox() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "What's your mobile number?",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text("Please enter your registered mobile number")
        ],
      ),
    );
  }

  Widget _buildTextFormField(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(top: 3, bottom: 3),
            width: 125,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
            ),
            child: CountryCodePicker(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
              initialSelection: "kh",
              showDropDownButton: true,
              onChanged: (country) {
                print('Country selected: $country');
              },
            ),
          ),
          SizedBox(width: 5),
          Expanded(
            child: TextFormField(
              autofocus: true,
              keyboardType: TextInputType.numberWithOptions(),
              style: TextStyle(color: Colors.black),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                labelText: 'Mobile Number',
                labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                hintText: "Enter your mobile number",
                hintStyle: TextStyle(color: accentGreyColor, fontSize: 15),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
