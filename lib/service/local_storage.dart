import 'package:hive_flutter/hive_flutter.dart';

const String kBox = "box";
const String kToken = "token";

const String kPin = "pin";
const String kSeen = "seen";

const String kPassword = "password";
const String kEmail  = "email";

const String kLoggedIn = 'loggedIn';


class LocalStorage {
  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<dynamic>(kBox);
  }

  static Box<dynamic> get _appBox => Hive.box(kBox);

  static Future<void> setToken(String accessToken) async {
    await _appBox.put(kToken, accessToken);
  }

  static Future<void> setPin(String revealPin) async {
    await _appBox.put(kPin, revealPin);
  }

  static Future<void> setLogIn(bool logged) async{
     await  _appBox.put(kLoggedIn, logged);
    
  }

   static bool? getLogIn(){
    if(_appBox.containsKey(kLoggedIn)){
      return _appBox.get(kLoggedIn);
    } else {
      return false;
    }
  }

  static Future<void> setOnboarding(bool val) async{
    final res = await  _appBox.put(kSeen, val);
    return res;
  }

  static bool? getOnboarding(){
    if(_appBox.containsKey(kSeen)){
      return _appBox.get(kSeen);
    } else {
      return false;
    }
  }

  static Future<void> setEmail(String email) async {
    await _appBox.put(kEmail, email);
  }
   static Future<void> setPassword(String password) async {
    await _appBox.put(kPassword, password);
  }
  static String getEmail() {
    if (_appBox.containsKey(kEmail)) {
      return _appBox.get(kEmail);
    } else {
      return '';
    }
  }

   static String getPassword() {
    if (_appBox.containsKey(kPassword)) {
      return _appBox.get(kPassword);
    } else {
      return '';
    }
  }

  static String? getToken() {
    if (_appBox.containsKey(kToken)) {
      return _appBox.get(kToken);
    } else {
      return null;
    }
  }

  static clearPin() {
    if (_appBox.containsKey(kPin)) {
      return _appBox.clear();
    }
  }

  static String? getPin() {
    if (_appBox.containsKey(kPin)) {
      return _appBox.get(kPin);
    } else {
      return null;
    }
  }

  // static void setPath(PathwaysModel pathwayModel) async {
  //   await _appBox.put(kPath, pathwayModel.toJson());
  // }

  // static PathwaysModel? getPath() {
  //   final dynamic data = _appBox.get(kPath);
  //   if (data == null) {
  //     return null;
  //   }
  //   return PathwaysModel.fromJson(data);
  // }
}
