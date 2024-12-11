import 'package:form_responsive/features/storageBase/data/storage_base_repository_impl.dart';
import 'package:form_responsive/features/storageBase/domain/storage_base_repository.dart';
import 'package:get_it/get_it.dart';

void storageBaseConfig() {
  GetIt.instance.registerLazySingleton<StorageBaseRepository>(
      () => StorageBaseRepositoryImpl());
}
