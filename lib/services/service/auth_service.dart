import 'package:dio/dio.dart';
import 'package:mobilicis_task/models/user_model.dart';
import 'package:mobilicis_task/services/dio_client.dart';
import 'package:mobilicis_task/services/manager/user_manager.dart';
import 'package:mobilicis_task/utils/widgets/app_flutter_toast.dart';

class AuthService {
  final DioClient dioClient;

  AuthService(this.dioClient);

  Future<bool> requestOtp(int countryCode, int mobileNumber) async {
    try {
      final res = await dioClient.dio.post('/login/otpCreate', data: {
        "countryCode": countryCode,
        "mobileNumber": mobileNumber,
      });

      if (res.statusCode == 200 || res.statusCode == 201) {
        final message = res.data['reason'];
        AppFlutterToast.flutterToastSuccess(message);
        return true;
      } else {
        const message = 'Please Enter Correct Number';
        AppFlutterToast.flutterToastError(message);
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  String? _extractSessionCookie(List<String> setCookieHeader) {
    for (final cookie in setCookieHeader) {
      if (cookie.startsWith('session=')) {
        final sessionCookie = cookie.split(';').first;
        return sessionCookie;
      }
    }
    return null;
  }

  Future<bool> validateOtp(int countryCode, int mobileNumber, int otp) async {
    try {
      final res = await dioClient.dio.post('/login/otpValidate', data: {
        "countryCode": countryCode,
        "mobileNumber": mobileNumber,
        "otp": otp,
      });

      if (res.statusCode == 200 || res.statusCode == 201) {
        final setCookieHeader = res.headers['set-cookie'];
        if (setCookieHeader != null && setCookieHeader.isNotEmpty) {
          final sessionCookie = _extractSessionCookie(setCookieHeader);
          if (sessionCookie != null) {
            UserManager.instance.setCookies(sessionCookie);
          }
        }
        final message = res.data['reason'];
        final user = UserModel.fromJson(res.data['user']);
        UserManager.instance.setUser(user);
        final loggedIn = await isLoggedIn();
        if (loggedIn) {
          AppFlutterToast.flutterToastSuccess(message);
          return true;
        }
        return false;
      } else {
        const message = 'Incorrect OTP';
        AppFlutterToast.flutterToastError(message);
        return false;
      }
    } catch (e) {
      print(e);
      AppFlutterToast.flutterToastError('Something Went Wrong');
      return false;
    }
  }

  Future<bool> isLoggedIn() async {
    try {
      final sessionCookie = UserManager.instance.cookies;
      final res = await dioClient.dio.get(
        '/isLoggedIn',
        options: Options(
          headers: {
            if (sessionCookie != null) 'Cookie': sessionCookie,
          },
        ),
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        UserManager.instance.setIsLoggedIn(res.data['isLoggedIn']);
        UserManager.instance.setToken(res.data['csrfToken']);
        final user = UserModel.fromJson(res.data['user']);
        UserManager.instance.setUser(user);
        return true;
      } else {
        const message = 'Something Went Wrong';
        AppFlutterToast.flutterToastError(message);
        return false;
      }
    } catch (e) {
      print(e);
      AppFlutterToast.flutterToastError('Something Went Wrong');
      return false;
    }
  }

  Future<bool> logout() async {
    try {
      final sessionCookie = UserManager.instance.cookies;
      final csrfToken = UserManager.instance.token;
      final res = await dioClient.dio.get(
        '/logout',
        options: Options(headers: {
          'X-Csrf-Token': csrfToken,
          if (sessionCookie != null) 'Cookie': sessionCookie,
        }),
      );
      if (res.statusCode == 200) {
        UserManager.instance.setIsLoggedIn(res.data['isLoggedIn']);
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      AppFlutterToast.flutterToastError('Something Went Wrong');
      return false;
    }
  }

  Future<bool> updateUser(int countryCode, String userName) async {
    try {
      final sessionCookie = UserManager.instance.cookies;
      final csrfToken = UserManager.instance.token;
      final res = await dioClient.dio.post(
        '/update',
        data: {"countryCode": countryCode, "userName": userName},
        options: Options(headers: {
          'X-Csrf-Token': csrfToken,
          if (sessionCookie != null) 'Cookie': sessionCookie,
        }),
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        final message = res.data['reason'];
        AppFlutterToast.flutterToastSuccess(message);
        return true;
      } else {
        const message = 'Something Went Wrong';
        AppFlutterToast.flutterToastError(message);
        return false;
      }
    } catch (e) {
      print(e);
      AppFlutterToast.flutterToastError('Something Went Wrong');
      return false;
    }
  }
}
