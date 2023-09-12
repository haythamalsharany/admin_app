import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

  final void Function()? onPressedSearchIcon;
  final void Function()? onPressedfavIcon;
  final TextEditingController myController;
  final void Function(String) onChange;
  const CustomAppBar({
    Key? key,
    required this.title,
    this.onPressedSearchIcon,
    this.onPressedfavIcon,
    required this.myController,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: myController,
              onChanged: onChange,
              decoration: InputDecoration(
                  prefixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: onPressedSearchIcon),
                  hintText: title,
                  hintStyle: const TextStyle(fontSize: 18),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200]),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10)),
            child: IconButton(
              onPressed: onPressedfavIcon,
              icon: Icon(
                Icons.favorite_border_outlined,
                color: Colors.grey[600],
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
