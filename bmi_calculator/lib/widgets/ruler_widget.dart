import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:ruler_picker_bn/ruler_picker_bn.dart';

import '../cubit/user_cubit.dart';
import '../cubit/user_states.dart';
import '../riverpod/change_widget_states.dart';

Key key = UniqueKey();

class CustomRulerWidget extends StatelessWidget {
  const CustomRulerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => BlocListener<UserCubit, States>(
        listener: (context, state) {
          if (state is LoadingState) {
            UserCubit.get(context).user.height = ref.watch(height);
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey),
          ),
          child: Column(
            children: [
              NumberPicker(
                // key: key,
                axis: Axis.horizontal,
                // haptics: true,
                textMapper: (numberText) {
                  return numberText;
                },
                minValue: 100,
                maxValue: 190,
                itemCount: 7,
                itemWidth: 50,
                value: ref.watch(height),
                onChanged: (value) {
                  ref.read(height.notifier).update((state) => value);
                },
                selectedTextStyle: Theme.of(context).textTheme.headlineMedium,
                textStyle: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.grey),
              ),
              SizedBox(
                height: 100,
                child: RulerPicker(
                  minValue: 100,
                  maxValue: 190,
                  startValue: UserCubit.get(context).user.height,
                  direction: Axis.horizontal,
                  background: Colors.white,
                  lineColor: Theme.of(context).primaryColor,
                  onChange: (value) {
                    // ref.read(height.notifier).update((state) => value);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
