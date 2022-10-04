import 'package:blocfork/bloc/sign.in.bloc/sign.in.bloc.dart';
import 'package:blocfork/bloc/sign.in.bloc/sign.in.event.dart';
import 'package:blocfork/bloc/sign.in.bloc/sign.in.state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  TextEditingController emailControllerr = TextEditingController();
  TextEditingController passwordControllerr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In With Email"),
      ),
      body: SingleChildScrollView(
          child: SafeArea(
              child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
        height: MediaQuery.of(context).size.height - 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInErrorState) {
                  return Text(
                    state.errrorMessage,
                    style: const TextStyle(color: Colors.red),
                  );
                } else {
                  return Container();
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                return TextField(
                  controller: emailControllerr,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: (state is SignInValidState)
                              ? Colors.blue
                              : Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      hintText: "Email"),
                  onChanged: (v) {
                    BlocProvider.of<SignInBloc>(context).add(
                      SignInTextChangedEvent(
                          email: emailControllerr.text,
                          password: passwordControllerr.text),
                    );
                  },
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                return TextField(
                  controller: passwordControllerr,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: (state is SignInValidState)
                              ? Colors.blue
                              : Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      hintText: "Password"),
                  onChanged: (v) {
                    BlocProvider.of<SignInBloc>(context).add(
                      SignInTextChangedEvent(
                          email: emailControllerr.text,
                          password: passwordControllerr.text),
                    );
                  },
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                return TextButton(
                  onPressed: () {
                    BlocProvider.of<SignInBloc>(context).add(
                      SignInSubmitEvent(
                          email: emailControllerr.text,
                          password: passwordControllerr.text),
                    );
                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                        color: (state is SignInValidState)
                            ? Colors.blue
                            : Colors.grey),
                  ),
                );
              },
            ),
          ],
        ),
      ))),
    );
  }
}
