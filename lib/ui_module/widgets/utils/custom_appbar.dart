import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodpanda_app/ui_module/constants/themes/color_constant.dart';
import 'package:foodpanda_app/ui_module/screens/sub/cart_screen.dart';
import 'package:foodpanda_app/ui_module/screens/sub/location_screen.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      backgroundColor: primaryColor,
      expandedHeight: 245,
      leadingWidth: 165,
      leading: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => LocationScreen()),
          ),
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Row(
            children: [
              FaIcon(FontAwesomeIcons.locationDot, color: secondaryColor),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Current Location",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: secondaryColor,
                    ),
                  ),
                  Text(
                    "Phnom Penh",
                    style: TextStyle(fontSize: 12, color: secondaryColor),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Badge(
            label: const Text("5"),
            isLabelVisible: true,
            offset: const Offset(-5, 5),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => CartScreen()),
                );
              },
              icon: FaIcon(FontAwesomeIcons.bagShopping, color: secondaryColor),
            ),
          ),
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 60, left: 15, right: 15),
            child: Column(
              children: [
                _buildSearchBox(),
                _buildVoucherAndOfferBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBox() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: accentGreyColor),
          hintText: "Search for restaurant and groceries",
          hintStyle: TextStyle(fontSize: 13, color: accentGreyColor),
          contentPadding: const EdgeInsets.only(top: 3),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildVoucherAndOfferBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Come back for a special discount",
                  style: TextStyle(
                    fontSize: 25,
                    color: secondaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                FittedBox(
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Text("Order now",
                            style: TextStyle(color: secondaryColor)),
                        Icon(Icons.arrow_forward,
                            color: secondaryColor, size: 15),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Image.asset(
              'assets/appbar/voucherandoffer-poster.png',
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
