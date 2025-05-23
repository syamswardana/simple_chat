part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class AuthStarted extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class AuthSignInRequested extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class AuthSignOutRequested extends AuthEvent {
  @override
  List<Object?> get props => [];
}
