import 'package:bmi_calculator/common_widgets/custom_button.dart';
import 'package:bmi_calculator/common_widgets/custom_column.dart';
import 'package:bmi_calculator/cubit/user_cubit.dart';
import 'package:flutter/material.dart';

import '../widgets/bmi_result.dart';
import '../widgets/info_user.dart';
import '../widgets/report_part.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back'),
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
        automaticallyImplyLeading: false,
        leading: IconButton(
          padding: const EdgeInsets.only(left: 8),
          onPressed: () {
            UserCubit.get(context).pressBack();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
          iconSize: 25,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Result",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const BmiResult(),
            const Spacer(flex: 2),
            const InformationUser(),
            const Spacer(flex: 2),
            const ReportPart(),
            const Spacer(flex: 2),
            CustomButton(
              text: "TRY AGAIN ",
              onTap: () {
                UserCubit.get(context).pressTryAgain();
              },
              widget: Icon(
                Icons.refresh_rounded,
                color: Colors.white,
                size: 35,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
