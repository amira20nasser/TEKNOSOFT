import 'package:flutter/material.dart';

import '../common_widgets/custom_column.dart';
import '../cubit/user_cubit.dart';
import '../models/user.dart';

class InformationUser extends StatelessWidget {
  const InformationUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isMale = UserCubit.get(context).user.gender == Gender.male;

    return Container(
      // width: (MediaQuery.of(context).size.width / 2) - 32,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomColumn(
            widget: Icon(
              isMale ? Icons.man_rounded : Icons.woman_rounded,
              size: 50,
            ),
            text: isMale ? "Male" : "Female",
          ),
          CustomColumn(
            widget: Text(
              UserCubit.get(context).user.age.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            text: "Age",
          ),
          CustomColumn(
            widget: Text(
              UserCubit.get(context).user.height.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            text: "Height",
          ),
          CustomColumn(
            widget: Text(
              UserCubit.get(context).user.weight.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            text: "Weight",
          ),
        ],
      ),
    );
  }
}
