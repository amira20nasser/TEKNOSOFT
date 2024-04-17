import 'package:bmi_calculator/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';

import '../helper_function.dart';
import '../theme/theme_app.dart';

class ReportPart extends StatelessWidget {
  const ReportPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: (MediaQuery.of(context).size.width / 2) - 32,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        children: [
          TextHighlight(
            textAlign: TextAlign.center,
            textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontFamily: ThemeApp.ralewaySemiBoldFont,
                ),
            text:
                "A BMI of ${bmiRange(UserCubit.get(context).user.category)} indicates that your weight is in the ${UserCubit.get(context).user.category} category for a person of your height",
            words: {
              bmiRange(UserCubit.get(context).user.category): HighlightedWord(
                textStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontFamily: "arial",
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              UserCubit.get(context).user.category: HighlightedWord(
                textStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontFamily: "arial",
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            },
          ),
          const SizedBox(height: 30),
          Text(
            "Maintaining a healthy weight reduce the risk of diseases associated with overweight and obesity.",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontFamily: ThemeApp.ralewaySemiBoldFont,
                ),
          ),
        ],
      ),
    );
  }
}
