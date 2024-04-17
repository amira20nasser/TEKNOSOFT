import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user.dart';
import '../riverpod/change_widget_states.dart';

//start select any thing initial
abstract class States {}

class InitialState extends States {
  InitialState() {
    selectedGender = StateProvider<Gender>((ref) => Gender.male);

    height = StateProvider<int>((ref) => 164);
    age = StateProvider<int>((ref) => 22);
    weight = StateProvider<int>((ref) => 52);
  }
}

class BackState extends States {
  User user;

  BackState(this.user) {
    height = StateProvider<int>((ref) => user.height);
    age = StateProvider<int>((ref) => user.age);
    weight = StateProvider<int>((ref) => user.weight);
    selectedGender = StateProvider<Gender>((ref) => user.gender);
  }
}

class LoadingState extends States {}

class ResultState extends States {
  ResultState();
}
