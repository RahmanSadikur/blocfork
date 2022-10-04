import 'package:blocfork/bloc/sign.in.bloc/sign.in.event.dart';
import 'package:blocfork/bloc/sign.in.bloc/sign.in.state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitState()) {
    on<SignInTextChangedEvent>((event, emit) => {
          if (event.email == "" ||
              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(event.email))
            {
              emit(
                SignInErrorState("Please enter a valid email"),
              ),
            }
          else if (event.password == "" ||
              !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$')
                  .hasMatch(event.password))
            {
              emit(
                SignInErrorState("Please enter a valid Password"),
              ),
            }
          else
            {
              emit(SignInValidState()),
            }
        });
    on<SignInSubmitEvent>((event, emit) => {
          emit(SignInLoadingState()),
        });
  }
}
