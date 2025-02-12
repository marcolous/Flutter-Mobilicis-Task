import 'package:mobilicis_task/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserManager {
  UserManager._privateConstructor();

  static final UserManager _instance = UserManager._privateConstructor();

  static UserManager get instance => _instance;

  UserModel? _user;
  UserModel? get user => _user;

  String? _token;
  String? get token => _token;

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  String? _cookies;
  String? get cookies => _cookies;

  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    _isLoggedIn = _prefs.getBool('isLoggedIn') ?? false;
  }

  void setUser(UserModel user) {
    _user = user;
  }

  void setToken(String token) {
    _token = token;
  }

  void setIsLoggedIn(bool isLoggedIn) async {
    _isLoggedIn = isLoggedIn;
    await _prefs.setBool('isLoggedIn', isLoggedIn);
  }

  void setCookies(String cookies) {
    _cookies = cookies;
  }

  void clearUser() async {
    _user = null;
    _token = null;
    _cookies = null;
    _isLoggedIn = false;
    await _prefs.remove('isLoggedIn');
  }
}
