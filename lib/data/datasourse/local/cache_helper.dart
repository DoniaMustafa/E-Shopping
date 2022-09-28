import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheHelper{

  Future get(String kay);

  Future<bool> has(String kay);
  Future<bool> clear(String kay);
  Future<bool> put(String kay,dynamic value);
  Future<bool> putBool(String kay,bool value);

}
class CacheImplement extends CacheHelper{
  final SharedPreferences _sharedPreferences;


  CacheImplement(this._sharedPreferences);

  @override

  Future<bool> has(String kay) async
  {
    return _sharedPreferences.containsKey(kay) ;

  }
  @override
  Future get( String kay) async {
    return await jsonDecode(_sharedPreferences.get(kay).toString());

  }
  @override
  Future<bool> put(String kay,dynamic value) async{
    return _sharedPreferences.setString(kay, jsonEncode(value));

  }
  @override
  Future<bool> putBool(String kay,bool value) async{
    return _sharedPreferences.setBool(kay, value);

  }
  @override
  Future<bool> clear(String kay) async{
    return _sharedPreferences.remove(kay);

  }


}
