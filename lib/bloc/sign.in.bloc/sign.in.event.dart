abstract class SignInEvent {}

class SignInTextChangedEvent extends SignInEvent {
  final String email;
  final String password;
  SignInTextChangedEvent({required this.email, required this.password});
}

class SignInSubmitEvent extends SignInEvent {
  final String email;
  final String password;
  SignInSubmitEvent({required this.email, required this.password});
}
