import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences? pref;
}

class Preferences {
  Preferences._();

  static const String IS_USER_LOGIN = 'is_user_login';
}
