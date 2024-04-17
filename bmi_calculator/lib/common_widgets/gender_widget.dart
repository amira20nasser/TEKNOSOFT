import 'package:flutter/material.dart';

import '../theme/theme_app.dart';

class GenderWidget extends StatelessWidget {
  const GenderWidget({
    super.key,
    required this.icon,
    required this.genderType,
    this.isSelected = false,
    required this.onTap,
  });
  final IconData icon;
  final String genderType;
  final bool isSelected;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: (MediaQuery.of(context).size.width / 2) - 32,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              offset: const Offset(-4, 5),
              blurRadius: 0.5,
              // blurStyle: BlurStyle.solid,
            )
          ],
          color: isSelected
              ? Theme.of(context).primaryColorLight
              : Colors.grey.shade300,
          border: isSelected
              ? Border.all(color: Theme.of(context).primaryColor, width: 2)
              : null,
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Visibility(
              visible: isSelected,
              child: Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.check_circle,
                  color: Theme.of(context).primaryColor,
                  size: 20,
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  Icon(
                    icon,
                    color: isSelected
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                    size: 110,
                  ),
                  Text(
                    genderType,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontFamily: ThemeApp.ralewaySemiBoldFont,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
