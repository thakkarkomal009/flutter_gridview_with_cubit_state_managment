import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void moveToNextScreen(BuildContext context) {
    Timer(const Duration(seconds: 4), () {
      emit(Loaded());
    });
  }
}