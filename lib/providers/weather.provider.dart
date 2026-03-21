import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';

final weatherProfider = FutureProvider<String>((ref) async {
  await Future.delayed(const Duration(seconds: 5));

  final randomValue = Random().nextInt(2);

  if (randomValue == 0) {
    return throw Exception("Failed to load weather");
  }

  return "Sunny sunny";
});
