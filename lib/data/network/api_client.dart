import 'dart:convert';
import 'dart:developer';

import 'package:val/data/network/api_constants.dart';
import 'package:val/data/network/cancel_tokens.dart';
import 'package:val/data/network/dio_factory.dart';
import 'package:val/data/requests/forms/form_sync_request.dart';
import 'package:val/data/requests/requests.dart';
import 'package:val/data/responses/responses.dart';
import 'package:val/presentation/resources/constants_manager.dart';
import 'package:dio/dio.dart'  ;

part  'api_client_impl.dart';

abstract class ApiClient {


  Future<AuthenticationResponse> login(
      String username, String password);

  Future<ForgetPasswordResponse> forgetPassword(
  String username);

  Future<AuthenticationResponse> register(
  String username,
   String password,
 String phone,
   String countryCode,
     String profilePicture,
  );








  void cancelRequest(RequestType request);


}
