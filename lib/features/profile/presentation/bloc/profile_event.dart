import 'package:form_responsive/features/profile/domain/entities/user.dart';

abstract class ProfileEvent {}

class GetProfileEvent extends ProfileEvent {}

class SaveProfileEvent extends ProfileEvent {
  final User user;

  SaveProfileEvent({required this.user});
}
