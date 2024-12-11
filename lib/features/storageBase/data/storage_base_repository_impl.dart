import 'dart:convert';

import 'package:form_responsive/features/profile/domain/entities/user.dart';
import 'package:form_responsive/features/storageBase/domain/storage_base_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageBaseRepositoryImpl implements StorageBaseRepository {
  @override
  Future<String?> getUserStorageBase(userKey) async {
    final pref = await SharedPreferences.getInstance();
    final user = pref.getString(userKey);
    return user;
  }

  @override
  Future<void> saveUserStorageBase(String userKey, User user) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(userKey, jsonEncode(user.toJson()));
  }
}
