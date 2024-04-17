import 'package:bmi_calculator/riverpod/change_widget_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common_widgets/gender_widget.dart';
import '../cubit/user_cubit.dart';
import '../cubit/user_states.dart';
import '../models/user.dart';

class GenderPart extends StatelessWidget {
  const GenderPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => BlocListener<UserCubit, States>(
        listener: (context, state) {
          if (state is LoadingState) {
            UserCubit.get(context).user.gender = ref.watch(selectedGender);
          }
        },
        child: Column(
          children: [
            Text(
              "Gender",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                GenderWidget(
                  genderType: 'Male',
                  icon: Icons.man_rounded,
                  isSelected: ref.watch(selectedGender) == Gender.male,
                  onTap: () {
                    ref.read(selectedGender.notifier).state = Gender.male;
                  },
                ),
                const SizedBox(width: 16),
                GenderWidget(
                  genderType: 'Female',
                  icon: Icons.woman_rounded,
                  isSelected: ref.watch(selectedGender) == Gender.female,
                  onTap: () {
                    ref
                        .read(selectedGender.notifier)
                        .update((state) => Gender.female);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
