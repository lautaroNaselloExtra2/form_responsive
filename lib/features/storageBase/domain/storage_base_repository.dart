import 'package:form_responsive/features/profile/domain/entities/user.dart';

abstract class StorageBaseRepository {
  Future<String?> getUserStorageBase(userKey);
  Future<void> saveUserStorageBase(String userKey, User user);
}
