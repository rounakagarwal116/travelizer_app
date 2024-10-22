import 'package:bloc/bloc.dart';

// Event
abstract class LoginEvent {}

class PerformLogin extends LoginEvent {
  String email;
  PerformLogin(this.email);
}

// State
abstract class LoginState {}

class InitialLoginState extends LoginState {}

class LoginSuccess extends LoginState {
  final String email;
  LoginSuccess(this.email);
}

// BLoC
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(InitialLoginState()) {
    String userEmail;
    on<PerformLogin>((event, emit) async {
      userEmail = event.email;
      emit(LoginSuccess(userEmail));
    });
  }
}
