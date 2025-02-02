import 'package:flutter/material.dart';
import 'package:foodpanda_app/ui_module/constants/themes/boxshadow_constant.dart';
import 'package:foodpanda_app/ui_module/constants/themes/color_constant.dart';

class CustomRestaurantCard extends StatelessWidget {
  final String restaurantName;
  final String restaurantPoster;
  final double restaurantRating;
  final int restaurantOrdered;
  final String restaurantCategory;
  final String deliveryTime;
  final double deliveryPrice;
  const CustomRestaurantCard({
    super.key,
    required this.restaurantName,
    required this.restaurantPoster,
    required this.restaurantRating,
    required this.restaurantOrdered,
    required this.restaurantCategory,
    required this.deliveryPrice,
    required this.deliveryTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: smallBoxShadow,
      ),
      width: MediaQuery.of(context).size.width * 0.7,
      child: Column(
        children: [
          Container(
            height: 135,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              image: DecorationImage(
                image: NetworkImage(restaurantPoster),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeaderBox(),
                      _buildCategoryBox(),
                      _buildFooterBox(),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHeaderBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            restaurantName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          children: [
            Icon(Icons.star, size: 15, color: Colors.amber),
            SizedBox(width: 5),
            Text(
              restaurantRating.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            SizedBox(width: 5),
            Text(
              "(${restaurantOrdered})",
              style: TextStyle(color: accentGreyColor, fontSize: 12),
            )
          ],
        )
      ],
    );
  }
  
  Widget _buildCategoryBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        restaurantCategory,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: accentGreyColor, fontSize: 12),
      ),
    );
  }

  Widget _buildFooterBox() {
    return Row(
      children: [
        Row(
          children: [
            Icon(Icons.alarm, size: 15),
            SizedBox(width: 1),
            Text(
              deliveryTime,
              style: TextStyle(color: accentGreyColor, fontSize: 12),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            height: 3,
            width: 3,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: accentGreyColor,
            ),
          ),
        ),
        Row(
          children: [
            Icon(Icons.delivery_dining_outlined, size: 17),
            SizedBox(width: 1),
            Text(
              "\$${deliveryPrice}",
              style: TextStyle(color: accentGreyColor, fontSize: 12),
            ),
          ],
        )
      ],
    );
  }
}
