import 'package:simple_chat/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:simple_chat/features/authentication/domain/repositories/auth_repository.dart';

class SignOutUsecase {
  final AuthRepository _authRepository = AuthRepositoryImpl();
  Future<void> call() async {
    return await _authRepository.signOut();
  }
}