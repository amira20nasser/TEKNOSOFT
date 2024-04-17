import 'package:bmi_calculator/cubit/user_cubit.dart';
import 'package:bmi_calculator/cubit/user_states.dart';
import 'package:bmi_calculator/views/result_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'theme/theme_app.dart';
import 'views/home_view.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(),
      child: MaterialApp(
        title: 'BMI CALCULATOR',
        home: BlocBuilder<UserCubit, States>(
          builder: (context, state) {
            return (state is ResultState) ? ResultView() : const HomeView();
          },
        ),
        theme: ThemeApp.lightTheme(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
