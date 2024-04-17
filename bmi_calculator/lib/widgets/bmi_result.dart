import 'package:flutter/material.dart';

import '../cubit/user_cubit.dart';

class BmiResult extends StatelessWidget {
  const BmiResult({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "Your BMI  is",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 20),
          Container(
            // width: 70,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text.rich(
              TextSpan(
                text: "${UserCubit.get(context).user.bmi}\n",
                children: [
                  TextSpan(
                    text: " kg/m\u00B2",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            "(${UserCubit.get(context).user.category})",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
