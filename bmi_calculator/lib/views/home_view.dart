import 'package:bmi_calculator/common_widgets/custom_button.dart';
import 'package:bmi_calculator/cubit/user_cubit.dart';
import 'package:bmi_calculator/widgets/height_part.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/user_states.dart';
import '../widgets/age_weight_part.dart';
import '../widgets/gender_part.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: AbsorbPointer(
            absorbing: UserCubit.get(context).loading,
            child: Column(
              children: [
                const GenderPart(),
                const Spacer(flex: 2),
                const HeightPart(),
                const Spacer(flex: 2),
                const AgeWeightPart(),
                const Spacer(flex: 3),
                BlocBuilder<UserCubit, States>(
                  builder: (context, state) {
                    if (state is LoadingState) {
                      return Center(
                          child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ));
                    }
                    return CustomButton(
                      text: "CALCULATE BMI",
                      onTap: () async {
                        await UserCubit.get(context).calculateBMI();
                      },
                    );
                  },
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
