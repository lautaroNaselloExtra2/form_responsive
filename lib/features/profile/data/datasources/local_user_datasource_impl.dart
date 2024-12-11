import 'dart:convert';

import 'package:form_responsive/core/constants/app_strings.dart';
import 'package:form_responsive/core/error/failure_base.dart';
import 'package:form_responsive/core/extensions/either.dart';
import 'package:form_responsive/features/profile/domain/datasources/local_user_datasource.dart';
import 'package:form_responsive/features/profile/domain/entities/user.dart';
import 'package:form_responsive/features/profile/domain/usecases/get_profile_use_case.dart';
import 'package:form_responsive/features/profile/domain/usecases/save_profile_use_case.dart';
import 'package:form_responsive/features/storageBase/domain/storage_base_repository.dart';

class LocalUserDatasourceImpl implements LocalUserDatasource {
  static const String userKey = 'USERKEY';
  final StorageBaseRepository storageBaseRepository;

  LocalUserDatasourceImpl({required this.storageBaseRepository});

  @override
  FutureGetProfile getUserFromStorage() async {
    final user = await storageBaseRepository.getUserStorageBase(userKey);
    if (user != null) {
      final userMap = jsonDecode(user);
      return Either.right(User.fromJson(userMap));
    }
    return Either.left(
        LocalStorageFailure('Error al traer el usuario desde local storage'));
  }

  @override
  FutureSaveProfile saveUserToStorage(User user) async {
    try {
      await storageBaseRepository.saveUserStorageBase(userKey, user);
      return Either.right(AppStrings.saveProfileSuccess);
    } catch (e) {
      return Either.left(LocalStorageFailure(
          'Error al guardar el usuario al almacenamiento local'));
    }
  }
}
