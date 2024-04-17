import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/user.dart';
import 'user_states.dart';

class UserCubit extends Cubit<States> {
  UserCubit() : super(InitialState());
  static UserCubit get(context) => BlocProvider.of<UserCubit>(context);

  User user = User(
      age: 22,
      height: 164,
      weight: 52,
      gender: Gender.male,
      bmi: 19.7,
      category: "normal");
  bool loading = false;
  calculateBMI() async {
    emit(LoadingState());
    loading = true;
    double bmi = user.weight / ((user.height / 100) * (user.height / 100));

    user.bmi = double.parse(bmi.toStringAsExponential(2));
    if (bmi < 18.5) {
      user.category = "underweight";
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      user.category = "normal";
    } else if (bmi >= 25 && bmi <= 29.9) {
      user.category = "overweight";
    } else if (bmi >= 30) {
      user.category = "obese";
    }
    await Future.delayed(const Duration(seconds: 2));
    loading = false;

    emit(ResultState());
  }

  pressBack() {
    emit(BackState(user));
  }

  pressTryAgain() {
    emit(InitialState());
  }
}
