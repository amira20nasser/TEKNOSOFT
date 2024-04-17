import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user.dart';

StateProvider<Gender> selectedGender =
    StateProvider<Gender>((ref) => Gender.male);

StateProvider<int> height = StateProvider<int>((ref) => 164);
StateProvider<int> age = StateProvider<int>((ref) => 22);
StateProvider<int> weight = StateProvider<int>((ref) => 52);
