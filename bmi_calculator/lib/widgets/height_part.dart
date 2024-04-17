import 'package:flutter/material.dart';

import '../widgets/ruler_widget.dart';

class HeightPart extends StatelessWidget {
  const HeightPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Height (cm)",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 20),

        //RULER
        const CustomRulerWidget()
      ],
    );
  }
}
