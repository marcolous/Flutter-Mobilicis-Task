import 'package:mobilicis_task/services/dio_client.dart';
import 'package:mobilicis_task/services/service/auth_service.dart';

class AuthRepo {
  final AuthService authService = AuthService(DioClient());

  Future<bool> requestOtp(int countryCode, String mobileNumber) async {
    try {
      await authService.requestOtp(countryCode, mobileNumber);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> validateOtp(int countryCode, String mobileNumber, int otp) async {
    try {
      await authService.validateOtp(countryCode, mobileNumber, otp);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> isLoggedIn() async {
    try {
      await authService.isLoggedIn();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> logout(String csrfToken) async {
    try {
      await authService.logout(csrfToken);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateUser(String csrfToken, int countryCode, String userName) async {
    try {
      await authService.updateUser(csrfToken, countryCode, userName);
      return true;
    } catch (e) {
      return false;
    }
  }
}
