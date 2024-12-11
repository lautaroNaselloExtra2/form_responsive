import 'package:form_responsive/features/profile/domain/datasources/local_user_datasource.dart';
import 'package:form_responsive/features/profile/domain/entities/user.dart';
import 'package:form_responsive/features/profile/domain/repositories/profile_repository.dart';
import 'package:form_responsive/features/profile/domain/usecases/get_profile_use_case.dart';
import 'package:form_responsive/features/profile/domain/usecases/save_profile_use_case.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final LocalUserDatasource localUserDatasource;

  ProfileRepositoryImpl({required this.localUserDatasource});
  @override
  FutureGetProfile getUser() async {
    return await localUserDatasource.getUserFromStorage();
  }

  @override
  FutureSaveProfile saveUser(User user) async {
    return await localUserDatasource.saveUserToStorage(user);
  }
}
