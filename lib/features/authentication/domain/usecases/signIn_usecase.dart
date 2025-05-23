import 'package:simple_chat/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:simple_chat/features/authentication/domain/entities/app_user.dart';
import 'package:simple_chat/features/authentication/domain/repositories/auth_repository.dart';

class SignInUsecase {
  final AuthRepository _authRepository = AuthRepositoryImpl();
  Future<AppUser?> call() async {
    return await _authRepository.signInWithGoogle();
  }
}