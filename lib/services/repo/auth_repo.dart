import 'package:mobilicis_task/services/dio_client.dart';
import 'package:mobilicis_task/services/service/auth_service.dart';

class AuthRepo {
  final AuthService authService = AuthService(DioClient());

  Future<bool> requestOtp(int countryCode, int mobileNumber) async {
    try {
      final res = await authService.requestOtp(countryCode, mobileNumber);
      return res;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> validateOtp(int countryCode, int mobileNumber, int otp) async {
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

  Future<bool> logout() async {
    try {
      final res = await authService.logout();
      return res;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateUser(int countryCode, String userName) async {
    try {
      final res = await authService.updateUser(countryCode, userName);
      return res;
    } catch (e) {
      return false;
    }
  }
}
