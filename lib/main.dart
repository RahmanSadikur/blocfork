import 'package:blocfork/bloc/internet.bloc/internet.bloc.dart';
import 'package:blocfork/bloc/sign.in.bloc/sign.in.bloc.dart';
// import 'package:blocfork/screen/home.screen.dart';
import 'package:blocfork/screen/sign.in.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider(
          create: (context) => SignInBloc(),
          child: SignInScreen(),
        ),
      ),
    );
  }
}
