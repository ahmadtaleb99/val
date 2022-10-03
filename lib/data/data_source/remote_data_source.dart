import 'package:val/data/network/api_client.dart';
import 'package:val/data/requests/forms/form_sync_request.dart';
import 'package:val/data/requests/requests.dart';
import 'package:val/data/responses/responses.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
  Future<ForgetPasswordResponse> forgetPassword(
      ForgetPasswordRequest forgetPasswordRequest);
  Future<AuthenticationResponse> register(RegisterRequest registerRequest);

  void cancelRequest(RequestType request);


}

class RemoteDataSourceImpl implements RemoteDataSource {
  final ApiClient _apiClient;
  RemoteDataSourceImpl(this._apiClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) {
    return _apiClient.login(loginRequest.username, loginRequest.password);
  }

  @override
  Future<ForgetPasswordResponse> forgetPassword(
      ForgetPasswordRequest forgetPasswordRequest) {
    return _apiClient.forgetPassword(forgetPasswordRequest.username);
  }

  @override
  Future<AuthenticationResponse> register(RegisterRequest registerRequest) {
    return _apiClient.register(
      registerRequest.username,
      registerRequest.password,
      registerRequest.phone,
      registerRequest.countryCode,
      registerRequest.profilePicture,
    );
  }





  @override
  void cancelRequest(RequestType request) {
    _apiClient.cancelRequest(request);
  }
}
