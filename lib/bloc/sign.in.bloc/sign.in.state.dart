abstract class SignInState {}

class SignInInitState extends SignInState {}

class SignInValidState extends SignInState {}

class SignInErrorState extends SignInState {
  final String errrorMessage;
  SignInErrorState(this.errrorMessage);
}

class SignInLoadingState extends SignInState {}
