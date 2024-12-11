import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_responsive/core/utils/validators/profile_stream_validator.dart';
import 'package:form_responsive/features/profile/domain/entities/user.dart';
import 'package:form_responsive/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:form_responsive/features/profile/presentation/bloc/profile_event.dart';
import 'package:form_responsive/features/profile/presentation/bloc/profile_state.dart';
import 'package:form_responsive/features/profile/presentation/widgets/profile_button.dart';
import 'package:form_responsive/features/profile/presentation/widgets/profile_form.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ProfileStreamValidator _profileStreamValidator;

  @override
  void initState() {
    _profileStreamValidator = ProfileStreamValidator();
    super.initState();
  }

  void _setUserValues() {
    _profileStreamValidator.changeUsername(_profileStreamValidator.user);
    _profileStreamValidator.changePassword(_profileStreamValidator.pass);
    _profileStreamValidator.changeEmail(_profileStreamValidator.email);

    final User user = User(
        username: _profileStreamValidator.user,
        email: _profileStreamValidator.email,
        password: _profileStreamValidator.pass);
    context.read<ProfileBloc>().add(SaveProfileEvent(user: user));
  }

  @override
  void dispose() {
    _profileStreamValidator.closeStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ProfileForm(
              profileStreamValidator: _profileStreamValidator,
            ),
            const SizedBox(height: 32),
            BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                return ProfileButton(
                  onPressed: _setUserValues,
                  profileStreamValidator: _profileStreamValidator,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
