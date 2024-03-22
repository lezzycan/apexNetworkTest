

import 'dart:developer';

import 'package:apex/model/dashboard/dashboard_res.dart';
import 'package:apex/model/login/login_res.dart';
import 'package:apex/model/signup/http_response_model.dart';
import 'package:apex/model/signup/signu_model.dart';
import 'package:apex/model/signup/verify_res.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'data_service.g.dart';

@RestApi()
abstract class GetDataService {
  factory GetDataService(Dio dio, {String baseUrl}) = _GetDataService;

/*-------------Register-----------*/

  @POST("auth/email")
  Future<HttpResponseModel> getEmailToken(@Query("email") String email);

  @POST('auth/email/verify')
  Future<VerifyRes> verifyEmailToken(
    @Query("email") String email,
    @Query("token") String token,
  );

  @POST('auth/register')
  Future<RegisterModel> createAccount(
     @Query("full_name") String fullName,
      @Query("username") String username,
     @Query("email") String email,
      @Query("country") String country,
    @Query("password") String password,
     @Query("device_name") String mobile,
  );

  /*-------------Login-----------*/

  @POST("auth/login")
  Future<LoginRes> login(
     @Query("email") String email,
    @Query("password") String password,
      @Query("device_name") String mobile,
  );

  @POST('auth/logout')
  Future<bool> logout();

  /*------------Home--------------*/
  @GET('dashboard')
  Future<DashBoardRes> getSecret();
  
}
