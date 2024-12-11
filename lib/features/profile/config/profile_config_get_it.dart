import 'package:form_responsive/features/profile/data/datasources/local_user_datasource_impl.dart';
import 'package:form_responsive/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:form_responsive/features/profile/domain/datasources/local_user_datasource.dart';
import 'package:form_responsive/features/profile/domain/repositories/profile_repository.dart';
import 'package:form_responsive/features/profile/domain/usecases/get_profile_use_case.dart';
import 'package:form_responsive/features/profile/domain/usecases/save_profile_use_case.dart';
import 'package:get_it/get_it.dart';

void profileGetItConfig() {
  //Repositories
  GetIt.instance.registerLazySingleton<LocalUserDatasource>(() =>
      LocalUserDatasourceImpl(storageBaseRepository: GetIt.instance.get()));
  GetIt.instance.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(localUserDatasource: GetIt.instance.get()));

//Use cases
  GetIt.instance.registerSingleton(
      GetProfileUseCase(profileRepository: GetIt.instance.get()));
  GetIt.instance.registerSingleton(
      SaveProfileUseCase(profileRepository: GetIt.instance.get()));
}
