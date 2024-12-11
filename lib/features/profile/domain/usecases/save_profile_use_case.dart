import 'package:form_responsive/core/error/failure_base.dart';
import 'package:form_responsive/core/extensions/either.dart';
import 'package:form_responsive/features/profile/domain/entities/user.dart';
import 'package:form_responsive/features/profile/domain/repositories/profile_repository.dart';

typedef FutureSaveProfile = Future<Either<FailureBase, String>>;

class SaveProfileUseCase {
  final ProfileRepository profileRepository;
  SaveProfileUseCase({required this.profileRepository});

  FutureSaveProfile call({required User profileData}) async {
    return await profileRepository.saveUser(profileData);
  }
}
