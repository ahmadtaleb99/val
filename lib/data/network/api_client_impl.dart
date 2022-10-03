part of 'api_client.dart';

class ApiClientImpl implements ApiClient {
  ApiClientImpl(this._dio, this._cancelTokens);

  final Dio _dio;
  final CancelTokenHandler _cancelTokens;

  @override
  Future<AuthenticationResponse> login(username, password) async {
    final _data = {'username': username, 'password': password};
    final _result = await _dio.post(ApiConstants.loginUrl, data: _data,);
    final value = AuthenticationResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ForgetPasswordResponse> forgetPassword(username) async {
    final _data = {'username': username};
    final _result =
        await _dio.post(ApiConstants.forgetPasswordUrl, data: _data);
    final value = ForgetPasswordResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AuthenticationResponse> register(
      username, password, phone, countryCode, profilePicture) async {
    final _data = {
      'username': username,
      'password': password,
      'phone': phone,
      'country_code': countryCode,
      'profile_picture': profilePicture
    };
    final _result = await _dio.post(ApiConstants.registerUrl, data: _data);
    final value = AuthenticationResponse.fromJson(_result.data!);
    return value;
  }



  @override
  void cancelRequest(RequestType request) {
    if(request == RequestType.SYNC_FORM){
    final token=  _cancelTokens.syncFormCancelToken;
    token.cancel();
       _cancelTokens.refreshToken();
    }

  }
}
