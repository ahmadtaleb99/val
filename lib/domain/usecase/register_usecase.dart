import 'package:val/data/network/failure.dart';
import 'package:val/data/requests/requests.dart';
import 'package:val/domain/model/models.dart';
import 'package:val/domain/repository/repository.dart';
import 'package:val/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class RegisterUseCase
    implements BaseUseCase<RegisterUseCaseInput, Authentication> {
  final AuthenticationRepository _authenticationRepository;

  RegisterUseCase(this._authenticationRepository);

  @override
  Future<Either<Failure, Authentication>> execute(
      RegisterUseCaseInput input) async {
    return await _authenticationRepository.register(RegisterRequest(
      input.username,
      input.password,
      input.phone,
      input.countryCode,
      input.profilePicture,
    ));
  }
}

class RegisterUseCaseInput {
  String username;
  String password;
  String phone;
  String countryCode;
  String profilePicture;

  RegisterUseCaseInput(this.username, this.password, this.phone,
      this.countryCode, this.profilePicture);
}
