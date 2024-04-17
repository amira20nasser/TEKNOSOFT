import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'age_part.dart';
import 'weight_part.dart';

class AgeWeightPart extends StatelessWidget {
  const AgeWeightPart({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AgePart(),
        SizedBox(width: 16),
        WeightPart(),
      ],
    );
  }
}
