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
  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  @override
  void initState() {
    _profileStreamValidator = ProfileStreamValidator();
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  void _setUserValues(BuildContext context) {
    _profileStreamValidator.changeUsername(_profileStreamValidator.user);
    _profileStreamValidator.changePassword(_profileStreamValidator.pass);
    _profileStreamValidator.changeEmail(_profileStreamValidator.email);

    final User user = User(
        username: _profileStreamValidator.user,
        email: _profileStreamValidator.email,
        password: _profileStreamValidator.pass);
    context.read<ProfileBloc>().add(SaveProfileEvent(user: user));
  }

  void _clearInputs() {
    _profileStreamValidator.changeUsername('');
    _profileStreamValidator.changePassword('');
    _profileStreamValidator.changeEmail('');
    _usernameController.text = '';
    _emailController.text = '';
    _passwordController.text = '';
  }

  @override
  void dispose() {
    _profileStreamValidator.closeStream();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileSaved) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Perfil Cambiado con exito!'),
            duration: Duration(seconds: 2),
          ));
          _clearInputs();
        }
      },
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProfileForm(
                  profileStreamValidator: _profileStreamValidator,
                  usernameController: _usernameController,
                  emailController: _emailController,
                  passwordController: _passwordController),
              const SizedBox(height: 32),
              ProfileButton(
                onPressed: _setUserValues,
                profileStreamValidator: _profileStreamValidator,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
