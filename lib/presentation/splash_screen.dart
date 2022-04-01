import 'package:cubit_state_management/cubit/splash/splash_cubit.dart';
import 'package:cubit_state_management/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SplashCubit>(context).moveToNextScreen(context);
    return BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is Loaded) {
            Navigator.pushReplacementNamed(context, HOME_SCREEN);
          }
        },
        child: Scaffold(
            backgroundColor: Colors.white,
            body:
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/splash.png'),
                    ],
                  ),
                ],
              ))
        );
  }
}