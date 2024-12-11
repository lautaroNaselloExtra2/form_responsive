import 'package:form_responsive/features/profile/domain/entities/user.dart';
import 'package:form_responsive/features/profile/domain/usecases/get_profile_use_case.dart';
import 'package:form_responsive/features/profile/domain/usecases/save_profile_use_case.dart';

abstract class LocalUserDatasource {
  FutureGetProfile getUserFromStorage();

  FutureSaveProfile saveUserToStorage(User user);
}
