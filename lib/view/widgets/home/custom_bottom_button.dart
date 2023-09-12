import 'package:flutter/material.dart';

class CustomBottomNavButton extends StatelessWidget {
  final void Function()? onPressed;
  final String buttonText;
  final IconData buttonIcon;
  final Color activeColor;

  const CustomBottomNavButton(
      {Key? key,
      required this.buttonText,
      required this.buttonIcon,
      required this.onPressed,
      required this.activeColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            buttonIcon,
            color: activeColor,
          ),
          Text(
            buttonText,
            style: TextStyle(color: activeColor),
          )
        ],
      ),
    );
  }
}
