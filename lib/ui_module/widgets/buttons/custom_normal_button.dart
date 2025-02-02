import 'package:flutter/material.dart';
import 'package:foodpanda_app/ui_module/constants/themes/color_constant.dart';

class CustomNormalButton extends StatelessWidget {
  final Color backgroundColor;
  final Color color;
  final String label;
  final bool hasBorder;
  final Function() onTap;

  const CustomNormalButton({
    super.key,
    required this.backgroundColor,
    required this.color,
    required this.label,
    this.hasBorder = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
            border: hasBorder
                ? Border.all(
                    color: accentGreyColor,
                    width: 1,
                  )
                : null,
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
