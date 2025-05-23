import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simple_chat/features/authentication/domain/entities/app_user.dart';
import 'package:simple_chat/features/authentication/domain/usecases/check_auth_usecase.dart';
import 'package:simple_chat/features/authentication/domain/usecases/signIn_usecase.dart';
import 'package:simple_chat/features/authentication/domain/usecases/signout_usecase.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CheckAuthUsecase _checkAuthUsecase = CheckAuthUsecase();
  final SignInUsecase _signInUsecase = SignInUsecase();
  final SignOutUsecase _signOutUsecase = SignOutUsecase();

  AuthBloc() : super(AuthInitial()) {
    on<AuthStarted>(_onStarted);
    on<AuthSignInRequested>(_onSignIn);
    on<AuthSignOutRequested>(_onSignOut);
  }

  Future<void> _onStarted(AuthStarted event, Emitter<AuthState> emit) async {
    final user = await _checkAuthUsecase.call();
    if (user != null) {
      emit(Authenticated(user));
    } else {
      emit(Unauthenticated());
    }
  }

  Future<void> _onSignIn(
    AuthSignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final user = await _signInUsecase.call();
      if (user != null) {
        emit(Authenticated(user));
      } else {
        emit(Unauthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onSignOut(
    AuthSignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    await _signOutUsecase.call();
    emit(Unauthenticated());
  }
}
