import 'package:dio/dio.dart';
import 'package:mobilicis_task/services/dio_client.dart';

class AuthService {
  final DioClient dioClient;

  AuthService(this.dioClient);

  Future<Response> requestOtp(int countryCode, String mobileNumber) async {
    return await dioClient.dio.post('/login/otpCreate', data: {
      "countryCode": countryCode,
      "mobileNumber": mobileNumber,
    });
  }

  Future<Response> validateOtp(int countryCode, String mobileNumber, int otp) async {
    return await dioClient.dio.post('/login/otpValidate', data: {
      "countryCode": countryCode,
      "mobileNumber": mobileNumber,
      "otp": otp,
    });
  }

  Future<Response> isLoggedIn() async {
    return await dioClient.dio.get('/isLoggedIn');
  }

  Future<Response> logout(String csrfToken) async {
    return await dioClient.dio.get('/logout', options: Options(headers: {
      'X-Csrf-Token': csrfToken,
    }));
  }

  Future<Response> updateUser(String csrfToken, int countryCode, String userName) async {
    return await dioClient.dio.post('/update',
        data: {"countryCode": countryCode, "userName": userName},
        options: Options(headers: {'X-Csrf-Token': csrfToken}));
  }
}
