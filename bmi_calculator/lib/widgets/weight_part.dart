import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:numberpicker/numberpicker.dart';

import '../cubit/user_cubit.dart';
import '../cubit/user_states.dart';
import '../riverpod/change_widget_states.dart';

class WeightPart extends StatelessWidget {
  const WeightPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Weight (kg)",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 20),
        Container(
          width: (MediaQuery.of(context).size.width / 2) - 32,
          padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey),
          ),
          child: Column(
            children: [
              Transform.scale(
                scaleY: 2.7,
                scaleX: 2,
                child: Icon(
                  Icons.arrow_drop_down,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Consumer(
                builder: (__, ref, _) => BlocListener<UserCubit, States>(
                  listener: (context, state) {
                    if (state is LoadingState) {
                      UserCubit.get(context).user.weight = ref.watch(weight);
                    }
                  },
                  child: NumberPicker(
                    axis: Axis.horizontal,
                    // haptics: true,
                    textMapper: (numberText) {
                      return numberText;
                    },
                    minValue: 30,
                    maxValue: 200,
                    itemCount: 3,
                    itemWidth: 50,
                    itemHeight: 40,

                    value: ref.watch(weight),
                    onChanged: (value) {
                      ref.read(weight.notifier).state = value;
                    },
                    selectedTextStyle:
                        Theme.of(context).textTheme.headlineMedium,
                    textStyle: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
