import 'package:flutter/cupertino.dart';

import '../constants/color.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final Color? textColor;
  const CustomTitle({Key? key, required this.title, this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 20,
            color: textColor ?? AppColor.primaryColor,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
