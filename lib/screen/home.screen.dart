import 'package:blocfork/bloc/internet.bloc/internet.bloc.dart';
import 'package:blocfork/bloc/internet.bloc/internet.state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: BlocConsumer<InternetBloc, InternetState>(
          listener: (context, state) {
            if (state is InternetGainedState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Connected")));
            } else if (state is InternetLoastState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Not Connected")));
            } else {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Loading...")));
            }
          },
          builder: (context, state) {
            if (state is InternetGainedState) {
              return const Text("Connected");
            } else if (state is InternetLoastState) {
              return const Text("Not Connected");
            } else {
              return const Text("Loading...");
            }
          },
        ),
      )),
    );
  }
}
