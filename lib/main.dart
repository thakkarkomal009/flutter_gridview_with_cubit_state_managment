import 'package:cubit_state_management/presentation/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyHomePage(
    router: AppRouter(),
  ));
}

class MyHomePage extends StatelessWidget {
  final AppRouter router;

  const MyHomePage({Key key, this.router}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
    );
  }
}