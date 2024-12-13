import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_responsive/features/profile/domain/entities/user.dart';
import 'package:form_responsive/features/profile/domain/usecases/get_profile_use_case.dart';
import 'package:form_responsive/features/profile/domain/usecases/save_profile_use_case.dart';
import 'package:form_responsive/features/profile/presentation/bloc/profile_event.dart';
import 'package:form_responsive/features/profile/presentation/bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUseCase getProfileUseCase;
  final SaveProfileUseCase saveProfileUseCase;

  ProfileBloc(
      {required this.getProfileUseCase, required this.saveProfileUseCase})
      : super(ProfileLoading()) {
    on<GetProfileEvent>(_onGetProfileEvent);
    on<SaveProfileEvent>(_onSaveProfileEvent);
  }

  FutureOr<void> _onGetProfileEvent(
      GetProfileEvent event, Emitter<ProfileState> emit) async {
    final failOrProfile = await getProfileUseCase.call();
    failOrProfile.when(
        left: (failure) => emit(ProfileError(messageError: failure.message)),
        right: (user) => emit(ProfileLoaded(user: user)));
  }

  FutureOr<void> _onSaveProfileEvent(
      SaveProfileEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    final User user = event.user;
    if (user.email.isEmpty || user.email.isEmpty || user.password.isEmpty) {
      emit(ProfileError(messageError: 'Todos los campos son requeridos'));
      return;
    }

    final failOrLoadedProfile =
        await saveProfileUseCase.call(profileData: user);
    failOrLoadedProfile.when(
        left: (failure) => emit(ProfileError(messageError: failure.message)),
        right: (message) => emit(ProfileSaved(message: message)));
  }
}
