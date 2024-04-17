import 'package:flutter/material.dart';

class CustomColumn extends StatelessWidget {
  const CustomColumn({super.key, required this.widget, required this.text});
  final Widget widget;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        widget,
        widget is! Icon ? const SizedBox(height: 15) : const SizedBox(height: 2),
        Text(
          text,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.grey,
                // fontFamily: "Roboto",
              ),
        )
      ],
    );
  }
}
