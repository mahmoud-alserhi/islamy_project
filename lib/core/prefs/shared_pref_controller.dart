
import 'package:islamy/core/utils/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefController {
  //SINGLETON DESIGN PATTERN

  static SharedPrefController? _instance;
  late SharedPreferences _sharedPreferences;

  SharedPrefController._internal();


  factory SharedPrefController() {
    return _instance ??= SharedPrefController._internal();
  }

  Future<void> initSharedPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  ///THIS IS METHOD FOR ADD DATA TO SharedPrefController

  // Future<void> save({required UserModel user}) async {
  //   await _sharedPreferences.setBool(PrefKey.login.toString(), true);
  //   await _sharedPreferences.setString(
  //       PrefKey.pharmacyId.toString(), user.pharmacyId);
  //   await _sharedPreferences.setString(
  //       PrefKey.pharmacyName.toString(), user.pharmacyName);
  // }

  //Function To Edit language
  Future<bool> changeLanguage(String language) async {
    return await _sharedPreferences.setString(
        PrefKey.lang.toString(), language);
  }

  //Function To Read language
  String get language =>
      _sharedPreferences.getString(PrefKey.lang.toString()) ?? '';

}
