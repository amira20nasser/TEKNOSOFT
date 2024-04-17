import 'package:bmi_calculator/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../cubit/user_states.dart';
import '../riverpod/change_widget_states.dart';

class AgePart extends StatelessWidget {
  const AgePart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Age",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 20),
        Container(
          width: (MediaQuery.of(context).size.width / 2) - 32,
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey),
          ),
          child: Consumer(
            builder: (__, ref, _) {
              return BlocListener<UserCubit, States>(
                listener: (context, state) {
                  if (state is LoadingState) {
                    UserCubit.get(context).user.age = ref.watch(age);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        ref.read(age.notifier).state--;
                      },
                      icon: const Icon(Icons.indeterminate_check_box_outlined),
                    ),
                    Text(
                      ref.watch(age).toString(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    IconButton(
                      onPressed: () {
                        ref.read(age.notifier).state++;
                      },
                      icon: const Icon(Icons.add_box_outlined),
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
