import 'package:form_responsive/core/error/failure_base.dart';
import 'package:form_responsive/core/extensions/either.dart';
import 'package:form_responsive/features/profile/domain/entities/user.dart';
import 'package:form_responsive/features/profile/domain/repositories/profile_repository.dart';

typedef FutureGetProfile = Future<Either<FailureBase, User?>>;

class GetProfileUseCase {
  final ProfileRepository profileRepository;
  GetProfileUseCase({required this.profileRepository});

  FutureGetProfile call() async {
    return await profileRepository.getUser();
  }
}
