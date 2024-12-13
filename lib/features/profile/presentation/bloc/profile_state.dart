import 'package:form_responsive/features/profile/domain/entities/user.dart';

abstract class ProfileState {}

final class ProfileStarted extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  final User? user;

  ProfileLoaded({required this.user});
}

final class ProfileSaved extends ProfileState {
  final String message;

  ProfileSaved({required this.message});
}

final class ProfileError extends ProfileState {
  final String messageError;

  ProfileError({required this.messageError});
}
